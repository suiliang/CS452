#include <util.h>
#include <all.h>

int stringtoint (char *str){
	int acc = 0;
	while (*str != (char)0){
		if ( (*str < '0') || (*str > '9')){
			return FALSE;
		} else {
			acc = acc*10 + *str - (char)48;
			str++;
		}
	}
	return acc;
}

int strcmp (char * s1, char * s2){
	while (1){
		if (*s1 != *s2){
			return FALSE;
		} else { // *s1 == *s2
			if (*s1 == (char)0){
				return TRUE;
			} else {
				s1++;
				s2++;
			}
		}
	}
	return FALSE;
}

int locationtoint (char *str){
	int i;
	for (i = 0; i < TRACK_MAX; i++){
		if (strcmp((char*)trackData[i].name, str)) {
			kprintf(COM2, "converted loc:%s to %d\n",str,trackData[i].num);
			return trackData[i].num;
		}
	}
	kprintf(COM2, "converted loc failed");
	return 0;
}

char * intolocation (int num){
	int i;
	for (i = 0; i < TRACK_MAX; i++){
		if (trackData[i].num == num) {
			kprintf(COM2, "converted %d to loc%s\n",num,trackData[i].name);
			return trackData[i].name;
		}
	}
	kprintf(COM2, "converted inttoloc failed\n",num,trackData[i].name);
	return trackData[0].name;
}

int min(int a, int b){
	if (a > b) return b;
	else return a;
}