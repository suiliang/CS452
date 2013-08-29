#include <all.h>

#define MAX_TRAINS 5
#define TRAIN_FREE 127

typedef struct {
	char tid;
	char tr;
} train;

void conductorServer() {
	int _commandLineTid,tid,i;
	conductor_msg _req;
	conductor_msg _msg;
	train _trains[MAX_TRAINS];
	
	RegisterAs(conductorServer_TID);
	Receive( &tid, (char*)0, 0 );
	Reply( tid, (char*)0, 0 );
	
	for (i = 0; i < MAX_TRAINS; i++){
		_trains[i].tr = TRAIN_FREE;
	}
	
	_commandLineTid = WhoIs(commandLine_TID);
	kprintf(COM2, "conduct ready\n");
	while(1) {
		Receive(&tid, (char*)&_req, sizeof(conductor_msg));
		switch(_req.type) {
			case TYPE_CREATE: // 1
				Reply(tid, (char*)0, 0);
				for(i = 0; i < MAX_TRAINS; i++) if (_trains[i].tr == TRAIN_FREE) break;
				if (i == MAX_TRAINS){
					kprintf(COM2, "# of train limit reached, add command failed\n");
				} else {
					_trains[i].tid = Create(trainController_priority, trainController);
					_trains[i].tr = _req.m1;
					kprintf(COM2, "Created train %d with tid: %d!\n", _req.m1,_trains[i].tid);
				}
				break;
			case TYPE_TR: // 2
				Reply(tid, (char*)0, 0);
				for(i = 0; i < MAX_TRAINS; i++) if (_trains[i].tr == _req.m1) break;
				if (i == MAX_TRAINS){ // moving train that hasn't been initialized
					kprintf(COM2, "trying to move uninitialized train, tr command failed\n");
				} else {
					_msg.type = TYPE_TR;
					_msg.m1 = _req.m2;
					kprintf(COM2, "sending move command to train controller\n");
					Send(_trains[i].tid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
				}
				break;
			case TR_GOTO:
				Reply(tid, (char*)0, 0);
				for(i = 0; i < MAX_TRAINS; i++) if (_trains[i].tr == _req.m1) break;
				if (i == MAX_TRAINS){ // moving train that hasn't been initialized
					kprintf(COM2, "trying to move uninitialized train, goto command failed\n");
				} else {
					_msg.type = TYPE_GOTO;
					_msg.m1 = _req.m2;
					Send(_trains[i].tid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
				}
				break;
			case TYPE_MY_TR:
				for(i = 0; i < MAX_TRAINS; i++) if (_trains[i].tid == tid) break;
				if (i == MAX_TRAINS){ // moving train that hasn't been initialized
					kprintf(COM2, "fatal error, train doesn't know its TR\n");
				}
				Reply(tid, (char*)&_trains[i].tr, sizeof(char));
				break;
			case TYPE_LOCATE:
				Reply(tid, (char*)0, 0);
				for(i = 0; i < MAX_TRAINS; i++) if (_trains[i].tr == _req.m1) break;
				if (i == MAX_TRAINS){
					kprintf(COM2, "# of train limit reached, locate command failed\n");
				} else {
					_msg.type = TYPE_LOCATE;
					kprintf(COM2, "locating %d!\n", _trains[i].tr);
					Send(_trains[i].tid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
				}
				break;
			default:
				kprintf(COM2, "invalid request made to conductor from %d\n", tid);
				Reply(tid, (char*)0, 0);
				break;
		}
	}
}
