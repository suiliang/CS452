#include <all.h>

#define MAX_WORD 20

void getWord(char * s){
	int n;
	for (n = 0; n < MAX_WORD - 1; n++){
		*s = getc(COM2);
		putc(COM2, *s);
		if ( (*s == ' ') || (*s == (char)13) ){
			*s = (char)0;
			return;
		} else {
			s++;
		}
	}
	return;
}

void commandLine(){
	int _conductorServerTid;
	char _s[MAX_WORD];
	conductor_msg _msg;
	
	char * s = (char*)&_s; // for readability
	
	RegisterAs(commandLine_TID);
	Receive( &_conductorServerTid, (char*)0, 0 );
	Reply( _conductorServerTid, (char*)0, 0 );
	
	 _conductorServerTid = WhoIs(conductorServer_TID);
	kprintf(COM2, "commandLine ready\n");
	while(1){
		getWord(s);
		if (strcmp(s, "tr")){
			_msg.type = TYPE_TR;
			getWord(s);
			_msg.m1 = (char)stringtoint(s);
			if (_msg.m1){
				getWord(s);
				_msg.m2 = (char)stringtoint(s);
				if (_msg.m2){
					kprintf(COM2, "got tr %d %d, sending to %d\n",_msg.m1,_msg.m2,_conductorServerTid);
					Send (_conductorServerTid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
				} else {
					kprintf(COM2, "invalid speed\n");
				}
			} else {
				kprintf(COM2, "invalid train\n");
			}
		} else if (strcmp(s, "goto")){
			_msg.type = TYPE_GOTO;
			getWord(s);
			_msg.m1 = stringtoint(s);
			if (_msg.m1){
				getWord(s);
				_msg.m2 = locationtoint(s);
				if (_msg.m2){
					// received goto trn dest
					kprintf(COM2, "got goto %d %d\n",_msg.m1,_msg.m2);
					Send (_conductorServerTid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
				} else {
					kprintf(COM2, "invalid dest\n");
				}
			} else {
				kprintf(COM2, "invalid train\n");
			}
		} else if (strcmp(s, "create")){
			_msg.type = TYPE_CREATE;
			getWord(s);
			_msg.m1 = stringtoint(s);
			if (_msg.m1){
				kprintf(COM2, "creating %d sent to %d\n",_msg.m1,_conductorServerTid);
				Send (_conductorServerTid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
			} else {
				kprintf(COM2, "invalid train\n");
			}
		} else if (strcmp(s, "locate")){
			_msg.type = TYPE_LOCATE;
			getWord(s);
			_msg.m1 = stringtoint(s);
			if (_msg.m1){
				Send (_conductorServerTid, (char*)&_msg, sizeof(conductor_msg), (char*)0, 0);
			} else {
				kprintf(COM2, "invalid train\n");
			}
		} else {
			kprintf(COM2, "invalid command\n");
		}
	}
}
