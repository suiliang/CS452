#include <kernel.h>
#include <ts7200.h>
#include <bwio.h>
#include <all.h>

static struct td tds[NUM_TASKS];
static struct td * cur_task;
static int event_waiter[NUM_EVENTS];
static int cts_state;

#include <syscall.h>
#include <schedule.h>
#include <SWI.h>
#include <IRQ.h>
#include <clockserver.h>
#include <userprog.h>
#include <serialserver.h>

void init_kernel(){
	int i, j;
	cur_task = &tds[0];
	cur_task->sp = (int *)USR_STACK_BASE;
	for (i = 0; i < NUM_TASKS; i++){
		tds[i].tid = i;
		tds[i].parent_tid = UNDEFINED_TID;
		tds[i].sp = UNDEFINED_SP;
		tds[i].state = UNDEFINED_TD;
		tds[i].msg = (char *)0;
		tds[i].reply = (char *)0;
		for (j = 0; j < 10; j++){
			tds[i].msgBuf[j].next = &(tds[i].msgBuf[(j+1)%10]);
			tds[i].msgBuf[j].tid = UNDEFINED_TID;
		}
		tds[i].cur_msg = &(tds[i].msgBuf[0]);
		tds[i].last_msg = &(tds[i].msgBuf[0]);
	}
	return;
}

void kernel (int argv[7], int * oldsp) {
	//bwprintf(COM2, "argv is at:%x\n", &argv);
	//asm("mov r1, r0");
	//asm("mov r0, #1");
	//asm("bl bwputr(PLT)");
	//bwprintf(COM2, "got code:%d, cur_task->sp:%x, arguments:%d, %x, %d, %d, %d\n", argv[0],argv[1],argv[2],argv[3],argv[4],argv[5],argv[6]);
	cur_task->sp = (int *)argv[1];
	switch(argv[0]){
		//bwprintf(COM2, "context switched with code:%d\n", argc);
		case SWI_CREATE:
			C_SWI_Create( (int)argv[2], (void *)argv[3] );
			break;
		case SWI_EXIT:
			C_SWI_Exit();
			break;
		case SWI_MyParentTid:
			*(cur_task->sp) = cur_task->parent_tid;
			break;
		case SWI_MyTid:
			*(cur_task->sp) = cur_task->tid;
			break;
		case SWI_Send:
			C_SWI_Send((int)argv[2], (char *)argv[3], (int)argv[4], (char *)argv[5], (int)argv[6]);
			break;
		case SWI_Receive:
			C_SWI_Receive((int *)argv[2], (char *)argv[3], (int)argv[4]);
			break;
		case SWI_Reply:
			C_SWI_Reply((int)argv[2], (char *)argv[3], (int)argv[4]);
			break;
		case SWI_AwaitEvent:
			C_SWI_AwaitEvent( (int)argv[2] );
			break;
		default: // C_SWI_PASS enters here
			break;
	}
	cur_task = &tds[Schedule_Next()];
	//bwprintf(COM2, "dispatching: %d\n", cur_task->tid);
	Dispatch(cur_task->sp,oldsp);
}

void meatspin(){
	while(1){
	}
}

int main( volatile int argc, volatile char* argv[] ) {
	init_tracka(trackData);
	init_distance(distances,trackData);
	init_kernel();
	init_schedule();
	enable_SWI();
	init_uart(COM1, 2400, UARTEN_MASK | RIEN_MASK | MSIEN_MASK );
	init_uart(COM2, 115200, UARTEN_MASK | RIEN_MASK );
	start_clock(TIMER2_BASE, (ENABLE_MASK | MODE_MASK | CLKSEL_MASK), TICK);
	bwprintf(COM2, "enabling IRQ and starting first task\n");
	
	C_SWI_Create(0, first);
	C_SWI_Create(7, meatspin);
	init_uart(COM1, 2400, UARTEN_MASK | RIEN_MASK | MSIEN_MASK );
	init_uart(COM2, 115200, UARTEN_MASK | RIEN_MASK );
	enable_IRQ(VIC1_BASE,VIC2_BASE, TC2UI, INT_UART1 | INT_UART2);
	Dispatch_First(cur_task->sp);
	return 0;
}
