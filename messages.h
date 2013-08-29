#ifndef MESSAGES_H
#define MESSAGES_H

// conductor/controller
typedef struct {
	char type;
	char m1;
	char m2;
} conductor_msg;

// conductor message types
#define TYPE_TR 0 // commandLine, conductorServer
#define TYPE_GOTO 1 // commandLine, conductorServer
#define TYPE_CREATE 2 // commandLine
#define TYPE_LOCATE 3 // commandLine, conductorServer, trainController
#define TYPE_MY_TR 4 // trainController
#define TYPE_FREE_SENSOR 5
#define TYPE_SENSOR_TRIGGERED 6
#define TYPE_SENSOR_AWAIT 7
#define TYPE_SENSOR_DENIED 8


#define TR_GOTO 1
#define TR_SPD 2
#define TR_TIMEOUT 3
#define TR_SEN 4

// For sensors
#define SENSOR_TRIPPED 0
#define SENSOR_ANY 3
#define SENSOR_REQ 2

// For reservation/sensor server
#define RESERVE_SENSOR 3
#define RESERVE_FAIL 4
#define RESERVE_PASS 5

#endif
