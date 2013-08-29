#include <all.h>

typedef struct {
	char ind;
	char swt;
} path_node;

typedef struct {
	unsigned int dist;
	int prev;
	char vis;
	int dp;
} pathfind_node;

int pathFind(int orig, int dest);

#define TRAIN_NOTIFY_DELAY 10
void trainNotifier() {
	int tid = MyParentTid();
	while(1) {
		Delay(TRAIN_NOTIFY_DELAY);
		Send(tid, (char*)&tid, 0, (char*)0, 0);
	}
}

static __inline__
void tr(char n, char spd){
	putc(COM1, spd);
	putc(COM1, n);
	return;
}

#define UNDEFINED_LOCATION 200
void trainController() {
	int _trainNotifierTid = 100, _conductorServerTid = WhoIs(conductorServer_TID), _sensorServerTid = WhoIs(sensorServer_TID),myLocation = UNDEFINED_LOCATION,tid;
	char myTr;
	conductor_msg _msg;
	conductor_msg _req;
	//int oldTick = 0, newTick, velocity = 0, travelled = 0, distanceToNextSensor = 0, nextSensor = -1;	
	// init, get tr #
	//tr(myTr,0);
	_msg.type = TYPE_MY_TR;
	Send(_conductorServerTid, (char*)&_msg, sizeof(conductor_msg), &myTr, sizeof(char));
	
	// _trainNotifierTid = Create(trainNotifier_priority, trainNotifier);	//TODO
	while(TRUE){
		Receive(&tid, (char*)&_req, sizeof(conductor_msg));
		if (tid == _trainNotifierTid){ // TR_TIMEOUT
			//kprintf(COM2, "train time out\n");
			Reply(tid, (char*)0, 0);
			// TODO maintance tasks
			//break;
		} else {
			switch(_req.type){
				case TYPE_LOCATE:
					Reply(tid, (char*)0, 0);
					if (myLocation == UNDEFINED_LOCATION){
						tr(myTr,14);
						_msg.type = TYPE_FREE_SENSOR;
						Send(_sensorServerTid, (char*)&_msg, sizeof(conductor_msg), (char*)&_req, sizeof(conductor_msg));
						myLocation = _req.m1;
					}
					tr(myTr,0);
					kprintf(COM2, "train %d is at %d\n", myTr, myLocation);
					break;
				case TYPE_TR:
					Reply(tid, (char*)0, 0);
					kprintf(COM2, "MOVING TRAIN: %d, %d\n", myTr, _req.m1);
					tr(myTr,_req.m1);
					break;
				case TYPE_GOTO:
					kprintf(COM2, "going to %s\n", intolocation((int)_req.m1));
					pathSet(myLocation, (int)_req.m1);
					tr(myTr,12 + 16);
					Reply(tid, (char*)0, 0);
					break;
				default:
					Reply(tid, (char*)0, 0);
					break;
			}
		}


	}
}

void pathSet(int orig, int dest) {
	if (orig == dest) return;
	if (trackData[orig].type == NODE_BRANCH){
		if(distances[trackData[orig].edge[DIR_STRAIGHT].dest->num][dest] < distances[trackData[orig].edge[DIR_CURVED].dest->num][dest]){
			strSwitch(trackData[orig].num);
			return pathSet(trackData[orig].edge[DIR_STRAIGHT].dest->num,dest);
		} else {
			crvSwitch(trackData[orig].num);
			return pathSet(trackData[orig].edge[DIR_CURVED].dest->num,dest);
		}
	} else {
		return pathSet(trackData[orig].edge[DIR_AHEAD].dest->num,dest);
	}
}
