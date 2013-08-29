#include <clockserver.h>
#include <syscall.h>
#include <bwio.h>
#include <ts7200.h>

static int CS_Tid = -1;
static int time = 0;

void clocknotifier( ){
	//bwprintf(COM2, "notifier created\n");
	char notifyRequest;
	int reply;
	while(1){
		//bwprintf(COM2, "notifying\n");
		AwaitEvent(EVENT_TICK);
		Send( CS_Tid, (char*)&notifyRequest, CS_NOTIFY, (char*)&reply, sizeof(int)/sizeof(char) );
	}
	return;
}

void start_clock(int TIMER_BASE, int MODE, int LDR_VALUE){
	*(volatile int *)(TIMER_BASE + CRTL_OFFSET) |= MODE;
	*(volatile int *)(TIMER_BASE + LDR_OFFSET) = LDR_VALUE;
	return;
}

int Time( ){
	return time;
}

int Delay( int ticks ) {
	//bwprintf(COM2, "delay called with ticks:%d\n", ticks);
	int i = ticks;
	int retVal;
	Send( CS_Tid, (char *)&i, CS_DELAY, (char*)&retVal, sizeof( int )/sizeof( char ) );
	return retVal; 	
}

/*
int DelayUntil( int ticks ){
	int retVal;
	Send( CS_Tid, (char*)&ticks, CS_DELAY, (char*)&retVal, sizeof( int )/sizeof( char ) );
	return retVal;
}*/

void clockserver( ){
	CS_Tid = MyTid();
	int time,clientTid,i,retVal,req;
	int Delay_Tids[CS_MAX_DELAY];
	
	time=0;
	//bwprintf(COM2, "cs created\n");
	
	for ( i = 0; i < CS_MAX_DELAY; i++ ){
		Delay_Tids[i] = CS_UNDEFINED_TID;
	}
	Create( 1, clocknotifier );
	while(1){
		req = Receive( (int*)&clientTid, (char*)&i, CS_DELAY);
		switch( req ){
			case( CS_NOTIFY ):
				//bwprintf(COM2, "tick %d\n",time);
				retVal = CS_SUCCESS;
				time++;
				time = time % (CS_MAX_DELAY);
				if (Delay_Tids[time] != CS_UNDEFINED_TID){
					while(Delay_Tids[time] > 64){ // Multiple Tid waiting
						Reply( Delay_Tids[time] % 64, (char*)&retVal, sizeof( int )/sizeof( char ) );
						Delay_Tids[time] /= 64;
					}
					if (Delay_Tids[time] != CS_UNDEFINED_TID){
						//bwprintf(COM2, "trying to release:%d\n", Delay_Tids[i]);
						Reply( Delay_Tids[time], (char*)&retVal, sizeof( int )/sizeof( char ) );
						Delay_Tids[time] = CS_UNDEFINED_TID;
					}
				}
				Reply( clientTid, (char*)&retVal, sizeof( int )/sizeof( char ) );
				break;
			case( CS_DELAY ):
				if (i > 0){
					i = (i+time)%CS_MAX_DELAY;
					//kprintf(COM2, "time:%d, delaying till:%d\n", time,i);
					if (Delay_Tids[i] == CS_UNDEFINED_TID){
						Delay_Tids[i] = clientTid;
					} else {
						Delay_Tids[i] = (Delay_Tids[i] *64 ) + clientTid;
					}
				} else {
					retVal = CS_SUCCESS;
					Reply( clientTid, (char*)&retVal, sizeof( int )/sizeof( char ) );
				}
				//bwprintf(COM2, "delay called with ticks:%d\n", Delay_Tids[i]);
				break;
			default:
				retVal = CS_INVALID_REQUEST;
				Reply( clientTid, (char*)&retVal, sizeof( int )/sizeof( char ) );
				break;	
		}
	}
	return;
}

