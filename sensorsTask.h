#ifndef TRACK_MANAGER_H
#define TRACK_MANAGER_H

#include <track_data.h>


#define MAX_SWITCH 22

#define SWITCH_CRV 34
#define SWITCH_STR 33
#define SOLENOID_OFF 32

extern track_node trackData [TRACK_MAX];
extern int switchTable [MAX_SWITCH];
extern int trackSize;
extern int distances[TRACK_MAX][TRACK_MAX];

void sensorsTask();

void strSwitch(int swt);
void crvSwitch(int swt);

int switchTableInd(int swt);

#endif
