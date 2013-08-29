#include <all.h>

#define MAX_SWITCH 22

track_node trackData[144];
int switchTable[MAX_SWITCH];
int trackSize;
int distances[TRACK_MAX][TRACK_MAX];

void init_switch(){
	int i;
	for (i = 0; i < 22; i++) {
		if(i > 17) crvSwitch(i + 153 - 18);
		else crvSwitch(i + 1);
	}
}

// This task also initializes the track information
void sensorsTask() {
	RegisterAs(sensorsTask_TID);
	putc(COM1, (char)192); // reset mode
	int i, j;
	int sensors[10];
	char byte, sen;
	int ind;
	int sensorServer = WhoIs(sensorServer_TID);
	conductor_msg _req;
	_req.type = TYPE_SENSOR_TRIGGERED;
	
	init_switch();
	trackSize = 144;
	// Initialize the track
	//trackSize = 144;
	//init_tracka(trackData);

	//_req.type = SENSOR_TRIPPED;
	// initialize the switches
	/*
	for (i = 0; i < 22; i++) {
		if(i > 17) crvSwitch(i + 153 - 18);
		else crvSwitch(i + 1);
	}*/
	kprintf(COM2, "switches straightened\n");
	//Delay(1);
	//kprintf(COM2, "listening to sensor\n");
	
	//getc(COM1);
	kprintf(COM2, "starting sensor\n");
	for(i = 0; i<10; i++) sensors[i] = 0;
	while(1) {
		Delay(1);
		putc(COM1, (char)(128 + 5)); // query the 5 sensors
		for(i = 0; i < 5; i++) { // per module

			// first byte
			byte = getc(COM1);
			//kprintf(COM2, "got 1\n");
			//kprintf(COM2, "Sensor %d\n", 'A' + byte);
			ind = i*2;
			sen = ~sensors[ind] & byte;
			sensors[ind] = byte;
			for(j = 0; j < 8; j++) {
				if (sen & (128 >> j)) {
					//kprintf(COM2, "\033[50;1HSensor %c%d\n", 'A' + i, j + 1);
					kprintf(COM2, "Sensor %c%d\n", 'A' + i, j + 1);
					// Send i*16 + j to the sensor reservation task
					_req.m1 = i*16 + j;
					Send(sensorServer, (char*)&_req, sizeof(conductor_msg), 0, 0);
				}
			}
			////
			
			// second byte
			byte = getc(COM1);
			//kprintf(COM2, "got 2\n");
			ind = i*2 + 1;
			sen = ~sensors[ind] & byte;
			sensors[ind] = byte;
			for(j = 0; j < 8; j++) {
				if (sen & (128 >> j)) {
					//kprintf(COM2,"\033[50;1HSensor %c%d\n", 'A' + i, j + 9);
					kprintf(COM2,"Sensor %c%d\n", 'A' + i, j + 9);
					// Send i*16 + j + 8 to the sensor reservation task
					_req.m1 = i*16 + j + 8;
					Send(sensorServer, (char*)&_req, sizeof(conductor_msg), 0, 0);
				}
			}
			////
		}
	}
}

int switchTableInd(swt) {
	int i = swt - 1;
	if(swt > 152) i -= 152 - 18;
	return i;
}

// straighten/curve at switch (for switches from 1-8, 153 156)
// Handles the switch table for us
void strSwitch(int swt) {
	kprintf(COM2, "straightening %d\n", swt);
	putc(COM1,  SWITCH_STR);
	putc(COM1, swt);
	putc(COM1, SOLENOID_OFF);
	switchTable[switchTableInd(swt)] = SWITCH_STR;
}

void crvSwitch(int swt) {
	kprintf(COM2, "curving %d\n", swt);
	putc(COM1,  SWITCH_CRV);
	putc(COM1, swt);
	putc(COM1, SOLENOID_OFF);
	switchTable[switchTableInd(swt)] = SWITCH_CRV;
}
