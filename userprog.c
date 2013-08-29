#include <userprog.h>
#include <bwio.h>
#include <all.h>

void first(){
	// Kernel servers
	int tid, msg;
	char reply;
	tid = Create(0, clockserver);
	Send(tid, (char*)&msg, CS_INVALID_REQUEST, &reply, 1);
	bwprintf(COM2, "CS is tid %d \n", tid);
	
	tid = Create(0, nameServer);
	Send(tid, (char*)&msg, NS_INVALID, &reply, 1);
	bwprintf(COM2, "NS is tid %d \n", tid);
	
	tid = Create(0, COM2getc);
	Send(tid, (char*)&msg, SS_INVALID_REQUEST, &reply, 1);
	bwprintf(COM2, "COM2 get is tid %d \n", tid);
	
	tid = Create(0, COM2putc);
	Send(tid, (char*)&msg, SS_INVALID_REQUEST, &reply, 1);
	bwprintf(COM2, "COM2 put is tid %d \n", tid);
	
	tid = Create(0, COM1getc);
	Send(tid, (char*)&msg, SS_INVALID_REQUEST, &reply, 1);
	bwprintf(COM2, "COM1 get tid is tid %d \n", tid);
	
	tid = Create(1, COM1putc);
	bwprintf(COM2, "COM1 put is tid %d\n", tid);
	Send(tid, (char*)&msg, SS_INVALID_REQUEST, &reply, 1);
	// Kernel servers started, no more bwio
	
	// Train Servers, all servers register then blocked until released later
	tid = Create(commandLine_priority, commandLine);
	Send(tid, (char*)0, 0, (char*)0, 0);
	tid = Create(conductorServer_priority, conductorServer);
	Send(tid, (char*)0, 0, (char*)0, 0);
	tid = Create(sensorServer_priority, sensorServer);
	Send(tid,(char*)0, 0, (char*)0, 0);
	
	Exit();
}
