#include <all.h>

#define UNDEFINED_TID 70
void sensorServer() {
	int tid,i;
	char nextWaiter = UNDEFINED_TID;
	int waiters[100];
	conductor_msg _msg,_req;
	
	RegisterAs(sensorServer_TID);
	Receive( &tid, (char*)0, 0 );
	Reply( tid, (char*)0, 0 );
	
	Create(sensorsTask_priority, sensorsTask);
	
	for (i = 0; i < 100; i++){
		waiters[i] = UNDEFINED_TID;
	}

	while(1) {
		Receive(&tid, (char*)&_req, sizeof(conductor_msg));
		switch(_req.type) {
			case TYPE_FREE_SENSOR:
				if (nextWaiter == UNDEFINED_TID){
					nextWaiter = (char)tid;
				} else {
					kprintf(COM2, "rejected request for free sensor\n");
					_msg.type = TYPE_SENSOR_DENIED;
					Reply(tid, (char*)&_msg, sizeof(conductor_msg));
				}
				break;
			case TYPE_SENSOR_TRIGGERED:
				if (waiters[(int)_req.m1] != UNDEFINED_TID){
					_msg.type = TYPE_SENSOR_TRIGGERED;
					Reply(waiters[(int)_req.m1], (char*)0, 0);
					waiters[(int)_req.m1] = UNDEFINED_TID;
				} else if (nextWaiter != UNDEFINED_TID){
					_msg.type = TYPE_SENSOR_TRIGGERED;
					_msg.m1 = _req.m1;
					kprintf(COM2, "releasing %d\n", nextWaiter);
					Reply(nextWaiter, (char*)&_msg, sizeof(conductor_msg));
					nextWaiter = UNDEFINED_TID;
				}
				Reply(tid, 0, 0);
				break;
			case TYPE_SENSOR_AWAIT:
				if (waiters[(int)_req.m1] == UNDEFINED_TID){
					waiters[(int)_req.m1] = (char)tid;
				} else {
					_msg.type = TYPE_SENSOR_DENIED;
					Reply(tid, (char*)&_msg, sizeof(conductor_msg));
				}
				break;
			default:
				kprintf(COM2, "invalid request made to sensorServer from %d\n", tid);
				Reply(tid, (char*)0, 0);
				break;
		}
	}
}

void reservationServer() {
}
