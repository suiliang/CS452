#ifndef SYSCALL_H
#define SYSCALL_H

#define EVENT_TICK 0

void Dispatch_First(int * sp);
void Dispatch(int * sp, int * ogsp) __attribute__ ((noreturn));
void SWI_Handler();
void IRQ_Handler();
int Create( int priority, void (*code) ( ) );
int MyTid( );
int MyParentTid( );
void Pass( );
void Exit( );
int Send( int tid, char *msg, int msglen, char *reply, int replylen );
int Receive( int *tid, char *msg, int msglen );
int Reply( int tid, char *reply, int replylen );
char AwaitEvent( int eventid );
#endif
