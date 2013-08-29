#ifndef SCHEDULE_H
#define SCHEDULE_H
static int min_priority;
static int priorities_active;
//static int min_priority_map[16];
static int tds_exist[NUM_PRIORITIES];
static int tds_active[NUM_PRIORITIES];
static int tds_queue[NUM_PRIORITIES];

void init_schedule(){
	int i;
	min_priority = 0;
	priorities_active = 0;
	for (i = 0; i < NUM_PRIORITIES; i++){
		tds_exist[i] = 0;
		tds_active[i] = 0;
		tds_queue[i] = 0;
	}
	/*
	min_priority_map[0] = 0; // TODO
	for (i = 1; i < 16; i++){
		min_priority_map[i] = (i & 1) ? 0 : (i & 2) ? 1 : (i & 4) ? 2 : 3;
	}*/
	return;
}

static __inline__ void Add_Tid(int tid){
	int priority = tid >> 3;
	tid = (1 << (tid & 7));
	tds_exist[priority] |= tid;
	return;
}

static __inline__ void Remove_Tid(int tid){
	int priority = tid >> 3;
	tid = (1 << (tid & 7));
	tds_exist[priority] &= ~tid;
	return;
}

static __inline__ int Free_Tid(int priority){
	int tid = ~tds_exist[priority] & (tds_exist[priority] + 1);
	tid = (tid > 8) ? ((tid > 32) ? ((tid == 128) ? 7 : 6) : ((tid == 32) ? 5 : 4)) : ((tid > 2) ? ((tid == 8) ? 3 : 2) : (tid - 1));
	return priority*8 + tid;
}

static __inline__ void Schedule_Push( int tid ){
	//bwprintf(COM2, "pushing %d\n",tid);
	int priority = tid >> 3;
	if (tds_active[priority] == 0){
		priorities_active |= (1 << priority);
		if (priority < min_priority) min_priority = priority;
		//bwprintf(COM2, "pri %d pushed %d, min pri %d\n", priority, tid, min_priority);
	}
	tds_active[priority] |= (1 << (tid & 7));
	tds_queue[priority] |= (1 << (tid & 7));
	return;
}

static __inline__ void Schedule_Pop( int tid ){
	//bwprintf(COM2, "popping %d\n",tid);
	int priority = tid >> 3;
	tds_active[priority] &= ~(1 << (tid & 7));
	if (tds_active[priority] == 0){
		priorities_active &= ~(1 << priority);
		priority = (priorities_active & (-priorities_active));
		min_priority = (priority > 8) ? ((priority > 32) ? ((priority == 128) ? 7 : 6) : ((priority == 32) ? 5 : 4)) : ((priority > 2) ? ((priority == 8) ? 3 : 2) : (priority - 1)); ;
		//bwprintf(COM2, "popped %d, active %d, blah %d, min pri %d\n", tid, priority, priorities_active, min_priority);
	}
	return;
}

static __inline__ int Schedule_Next(){
	//bwprintf(COM2, "priorities active: %d, min priority is:%d , tds_active is: %d and tds_queue is: %d\n", priorities_active, min_priority, tds_active[min_priority], tds_queue[min_priority]);
	int tid = tds_active[min_priority] & tds_queue[min_priority];
	if (tid == 0){
		tid = tds_active[min_priority] & (-tds_active[min_priority]);
		tds_queue[min_priority] = tds_active[min_priority] - tid;
	} else {
		tid = tid & (-tid);
		tds_queue[min_priority] -= tid;
	}
	tid = (tid > 8) ? ((tid > 32) ? ((tid == 128) ? 7 : 6) : ((tid == 32) ? 5 : 4)) : ((tid > 2) ? ((tid == 8) ? 3 : 2) : (tid -1));
	//bwprintf(COM2, "scheduling pri %d, task %d\n", min_priority, tid);
	return min_priority*8 + tid;
}

#endif
