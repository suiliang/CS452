#ifndef IRQ_H
#define IRQ_H

#include <kernel.h>

void disable_IRQ(){
	*(volatile int *)(VIC1_BASE + IntEnable) = 0;
	*(volatile int *)(VIC2_BASE + IntEnable) = 0;
	return;
}

void enable_IRQ(int VIC_BASE1, int VIC_BASE2, int Enable1,int Enable2){
	int i;
	for (i = 0; i < NUM_EVENTS; i++){
		event_waiter[i] = UNDEFINED_TID;
	}
	*(int *)(0x38) = (int)IRQ_Handler;
	*(volatile int *)(VIC_BASE1 + IntSelect) = 0;
	*(volatile int *)(VIC_BASE2 + IntSelect) = 0;
	
	disable_IRQ();
	i = *(volatile int *)( UART1_BASE + UART_FLAG_OFFSET ) & CTS_MASK; // read it to clear mdsr
	*(volatile int *)(UART1_BASE + UART_INTR_OFFSET) &= ~1; // clear modem interrupt
	cts_state = CTS_READY;
	
	*(volatile int *)(VIC_BASE1 + IntEnable) = Enable1;
	*(volatile int *)(VIC_BASE2 + IntEnable) = Enable2;
	return;
}

int * C_IRQ_Handler(int * sp, int * oldsp){
	//test2(cur_task->tid);
	//bwprintf(COM2, "a");
	cur_task->sp = sp;
	int cause = *(volatile int *)(VIC1_BASE + IRQStatus);
	volatile int * flag;
	flag = (volatile int *)(UART1_BASE + UART_FLAG_OFFSET);
	char c;
	if (cause == 0) {
		cause = *(volatile int *)(VIC2_BASE + IRQStatus);
		if (cause & INT_UART1) {
			cause = *(volatile int *)(UART1_BASE + UART_INTR_OFFSET);
			if (cause & MIS_MASK){// && (*(volatile int *)( UART1_BASE + UART_MDMSTS_OFFSET ) & DCTS_MASK)) { // Modem status interrupt
				if (*(int*)(UART1_BASE + UART_MDMSTS_OFFSET) & 1) {
					if ((cts_state == CTS_MIDDLE) || (cts_state == CTS_READY)){
						cts_state = CTS_BUSY;
					} else if (cts_state == CTS_BUSY){
						cts_state = CTS_READY;
						*(volatile int *)(UART1_BASE + UART_CTLR_OFFSET) |= TIEN_MASK;
					}
					*(volatile int *)(UART1_BASE + UART_INTR_OFFSET) &= ~1;
				}
			}
			if (cause & TIS_MASK) { // Transmit status interrupt
				*(volatile int *)(UART1_BASE + UART_CTLR_OFFSET) &= ~TIEN_MASK;
				if ((event_waiter[EVENT_COM1_PUT] != UNDEFINED_TID) && (*flag & CTS_MASK)){
					cts_state = CTS_MIDDLE;
					tds[event_waiter[EVENT_COM1_PUT]].state = READY;
					Schedule_Push(event_waiter[EVENT_COM1_PUT]);
					event_waiter[EVENT_COM1_PUT] = UNDEFINED_TID;
				}
			}
			if (*(volatile int *)(UART1_BASE + UART_INTR_OFFSET) & RIS_MASK){ // COM1 Receive
				if (!(*(volatile int*)(UART1_BASE + UART_FLAG_OFFSET) & RXFE_MASK)) {
					c = *(char *)( UART1_BASE + UART_DATA_OFFSET );
					if (event_waiter[EVENT_COM1_GET] != UNDEFINED_TID){
						tds[event_waiter[EVENT_COM1_GET]].state = READY;
						*(tds[event_waiter[EVENT_COM1_GET]].sp) = c;
						Schedule_Push(event_waiter[EVENT_COM1_GET]);
						event_waiter[EVENT_COM1_GET] = UNDEFINED_TID;
					} else {
						bwprintf(COM2, "missed\n");
					}
				}
			}
		} else { // if (cause & INT_UART2) {
			cause = *(volatile int *)(UART2_BASE + UART_INTR_OFFSET);
			if (cause & TIS_MASK){ // COM2 Transmit
				*(volatile int *)(UART2_BASE + UART_CTLR_OFFSET) &= ~TIEN_MASK;
				if (event_waiter[EVENT_COM2_PUT] != UNDEFINED_TID){
					tds[event_waiter[EVENT_COM2_PUT]].state = READY;
					Schedule_Push(event_waiter[EVENT_COM2_PUT]);
					event_waiter[EVENT_COM2_PUT] = UNDEFINED_TID;
				}
			} else { //if (cause & RIS_MASK){ // COM2 Receive
				if (!(*(volatile int*)(UART2_BASE + UART_FLAG_OFFSET) & RXFE_MASK)) {
					if (event_waiter[EVENT_COM2_GET] != UNDEFINED_TID){
						tds[event_waiter[EVENT_COM2_GET]].state = READY;
						*(tds[event_waiter[EVENT_COM2_GET]].sp) = (int)*(volatile char *)( UART2_BASE + UART_DATA_OFFSET );
						Schedule_Push(event_waiter[EVENT_COM2_GET]);
						event_waiter[EVENT_COM2_GET] = UNDEFINED_TID;
					} else {
						c = *(volatile char *)( UART2_BASE + UART_DATA_OFFSET );
						bwprintf(COM2, "lost2rcv\n");
					}
				}
			}
		}
	}else{ // VIC1 TIMER2 UNDERFLOW
		//bwprintf(COM2, "tc2 interrupted\n");
		if (event_waiter[EVENT_TICK] != UNDEFINED_TID){
			tds[event_waiter[EVENT_TICK]].state = READY;
			Schedule_Push(event_waiter[EVENT_TICK]);
			event_waiter[EVENT_TICK] = UNDEFINED_TID;
		}
		*(volatile int *)(TIMER2_BASE + TIMER_CLEAR_OFFSET) = 0; // clear timer offset
		*(volatile int *)(UART1_BASE + UART_CTLR_OFFSET) |= TIEN_MASK;
	}
	cur_task = &tds[Schedule_Next()];
	Dispatch(cur_task->sp,oldsp);
}

#endif
