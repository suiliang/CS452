#ifndef KERNEL_H
#define KERNEL_H

#define NUM_PRIORITIES 8
#define PRIORITY_SIZE 8
#define NUM_TASKS (NUM_PRIORITIES*PRIORITY_SIZE)

#define USR_STACK_BASE 0x1100000
#define USR_STACK_SIZE 0x10000
#define UNDEFINED_TD -1
#define UNDEFINED_SP 0
#define UNDEFINED_TID -1

#define TICK 0xC670 // 502khz is 50200(0xc670) per 1/10 seconds
#define EVENT_TICK 0

#define EVENT_TICK 0
#define EVENT_COM1_PUT 1
#define EVENT_COM2_PUT 2
#define EVENT_COM1_GET 3
#define EVENT_COM2_GET 4
#define EVENT_CTS 5
#define NUM_EVENTS 6

#define TC2UI (1 << 5)
#define INT_UART1 (1 << (52-32))
#define INT_UART2 (1 << (54-32))

#define CTS_READY 0
#define CTS_MIDDLE 1
#define CTS_BUSY 2

struct Q {
	struct Q * next;
	int tid;
};

struct td {
	int tid;
	int parent_tid;
	int * sp;
	int state;
	char * msg;
	int msglen;
	char * reply;
	int replylen;
	int * sender_tid;
	struct Q msgBuf[10];
	struct Q * cur_msg;
	struct Q * last_msg;
};


void init_kernel();
void kernel (int argv[7],int * oldsp)__attribute__ ((noreturn));
int main( volatile int argc, volatile char* argv[] );
#endif
