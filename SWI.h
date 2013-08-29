#ifndef SWI_H
#define SWI_H

#include <kernel.h>

#define READY 0
#define REPLY_BLOCK 1
#define SEND_BLOCK 2
#define RECEIVE_BLOCK 3
#define EVENT_BLOCK 4

#define	SWI_CREATE 1
#define	SWI_PASS 2
#define	SWI_EXIT 3
#define	SWI_MyParentTid 4
#define	SWI_MyTid 5
#define SWI_Send 6
#define SWI_Receive 7
#define SWI_Reply 8
#define SWI_AwaitEvent 9

void enable_SWI(){
	*(int *)(0x28) = (int)SWI_Handler;
}

#define CREATE_INVALID_PRIORITY -1
#define CREATE_NO_TD -2
static __inline__ void C_SWI_Create( int priority, void (*code) ( ) ){
	//bwprintf(COM2, "create called with %d\n", priority);
	if (priority >= NUM_PRIORITIES){ // invalid priority
		bwprintf(COM2, "invalid priority: %d\n", priority);
		*(cur_task->sp) = CREATE_INVALID_PRIORITY;
		return;
	}
	int tid = Free_Tid(priority);
	//bwprintf(COM2, "using tid %d\n", tid);
	Add_Tid(tid);
	if (tid == -1) { // out of TDs
		*(cur_task->sp) = CREATE_NO_TD;
		return;
	}
	Schedule_Push(tid);

	/* START: set td */
	struct td * task = &tds[tid];
	task->sp = (int *)(USR_STACK_BASE - (tid * USR_STACK_SIZE));
	*(task->sp) = (int)code;
	task->state = READY;
	task->sp -= 14;
	task->parent_tid = cur_task->tid;
	*(cur_task->sp) = tid; // set return value
	/* END: set td */
	//bwprintf(COM2, "created tid:%d, sp:%x\n", tid, task->sp);
	return;
}

static __inline__ void C_SWI_Exit(){
	int tmp;
	/* START: td Queue operations */
	Remove_Tid(cur_task->tid);
	Schedule_Pop(cur_task->tid);
	/* END: td Queue operations */

	/* START: clear td */
	cur_task->parent_tid = UNDEFINED_TID;
	cur_task->sp = UNDEFINED_SP;
	cur_task->state = UNDEFINED_TD;
	cur_task->msg = (char *)0;
	cur_task->reply = (char *)0;
	for (tmp = 0; tmp < 10; tmp++){
		cur_task->msgBuf[tmp].tid = UNDEFINED_TID;
	}
	cur_task->cur_msg = &(cur_task->msgBuf[0]);
	cur_task->last_msg = &(cur_task->msgBuf[0]);
	/* END: clear td */
	//bwprintf(COM2, "%d is now exiting\n", cur_task->tid);
	return;
}

#define SEND_INVALID_TID -1
#define SEND_TID_DNE -2
static __inline__ void C_SWI_Send( int tid, char *msg, int msglen, char *reply, int replylen ){
	if ((unsigned int)tid >= 64){
		*(cur_task->sp) = SEND_INVALID_TID;
		return;
	} else if (tds[tid].state == UNDEFINED_TD){
		*(cur_task->sp) = SEND_TID_DNE;
		return;
	}
	cur_task->reply = reply;
	cur_task->replylen = replylen;
	Schedule_Pop(cur_task->tid); // sender is blocked until reply is called
	if ( tds[tid].state == RECEIVE_BLOCK ){ // receive called
		cur_task->state = REPLY_BLOCK;
		if (msglen < tds[tid].replylen) tds[tid].replylen = msglen;
		while (tds[tid].replylen--){ // copy data
			*tds[tid].reply = *msg;
			tds[tid].reply++;
			msg++;
		}
		*(tds[tid].sender_tid) = cur_task->tid;
		*(tds[tid].sp) = msglen;
		tds[tid].state = READY;
		Schedule_Push(tid);
	} else { // receive not called
		cur_task->state = SEND_BLOCK;
		cur_task->msg = msg;
		cur_task->msglen = msglen;
		tds[tid].last_msg->tid = cur_task->tid;
		tds[tid].last_msg = tds[tid].last_msg->next;
	}
	return;
}

static __inline__ void C_SWI_Receive( int *tid, char *msg, int msglen ){
	int source_tid = cur_task->cur_msg->tid;
	if (source_tid == UNDEFINED_TID){ // No msgs sent to cur_task
		cur_task->reply = msg;
		cur_task->replylen = msglen;
		cur_task->sender_tid = (int *)tid;
		cur_task->state = RECEIVE_BLOCK;
		//bwprintf(COM2, "blocking: %d\n", cur_task->tid);
		Schedule_Pop(cur_task->tid);
	} else {
		tds[source_tid].state = REPLY_BLOCK;
		if (msglen > tds[source_tid].msglen) msglen = tds[source_tid].msglen;
		while(msglen--){
			*msg = *tds[source_tid].msg;
			msg++;
			tds[source_tid].msg++;
		}
		*tid = source_tid;
		*(cur_task->sp) = tds[source_tid].msglen;
		cur_task->cur_msg->tid = UNDEFINED_TID;
		cur_task->cur_msg = cur_task->cur_msg->next;
	}
	return;
}

#define REPLY_SUCCESS 0
#define REPLY_INVALID_TID -1
#define REPLY_TID_DNE -2
#define REPLY_TID_NOT_REPLY_BLOCKED -3
#define REPLY_SMALL_BUFFER -4
static __inline__ void C_SWI_Reply( int tid, char *reply, int replylen ){
	int retVal = REPLY_SUCCESS;
	if ((unsigned int)tid >= 64){
		retVal = REPLY_INVALID_TID;
	}else if (tds[tid].state == UNDEFINED_TD){
		retVal = REPLY_TID_DNE;
	}else if (tds[tid].state != REPLY_BLOCK){
		retVal = REPLY_TID_NOT_REPLY_BLOCKED;
	}else {
		tds[tid].state = READY;
		Schedule_Push(tid);
		if (replylen > tds[tid].replylen){
			retVal = REPLY_SMALL_BUFFER;
		}else if (replylen < tds[tid].replylen){
			tds[tid].replylen = replylen;
		}
		while(tds[tid].replylen--){
			*(tds[tid].reply) = *reply;
			tds[tid].reply++;
			reply++;
		}
		*(tds[tid].sp) = replylen;
	}
	*(cur_task->sp) = retVal;
	return;
}

static __inline__ void C_SWI_AwaitEvent( int eventid ){
	//bwprintf(COM2, "sleeping %d\n", eventid);
	if (eventid == EVENT_COM2_PUT){
		*(volatile int *)(UART2_BASE + UART_CTLR_OFFSET) |= TIEN_MASK;
	}
	event_waiter[eventid] = cur_task->tid;
	cur_task->state = EVENT_BLOCK;
	Schedule_Pop(cur_task->tid);
	return;
}

#endif
