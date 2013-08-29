#ifndef CLOCKSERVER_H
#define CLOCKSERVER_H

#define CS_NOTIFY 0
#define CS_TIME 1
#define CS_DELAY 4
#define CS_INVALID_REQUEST 5

#define CS_UNDEFINED_TID -1
#define CS_MAX_DELAY 1000
#define NS_NOT_READY -2

#define CS_SUCCESS 0
#define CS_NOT_READY -2


void start_clock(int TIMER_BASE, int MODE, int LDR_VALUE);
int Time( );
int Delay( int ticks );
// int DelayUntil( int ticks ); NOT WORKING
void clockserver( );

#endif
