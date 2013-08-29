void COM2putnotify(){
	//bwprintf(COM2, "COM2 put notifier created%d\n", EVENT_COM2_PUT);
	int reply;
	//i = MyTid();
	while(1){
		AwaitEvent(EVENT_COM2_PUT);
		//bwprintf(COM2, "hello\n");
		Send( ss_put_tid[COM2], (char *)&reply, SS_NOTIFY, (char *)&reply, 0 );
	}
	Exit();
}

void COM2getnotify(){
	//bwprintf(COM2, "COM2 get notifier created\n");
	int reply;
	char c;
	while(1){
		c = (char)AwaitEvent(EVENT_COM2_GET);
		Send( ss_get_tid[COM2], (char *)&c, SS_GET, (char*)&reply, 0 );
	}
	Exit();
}

void COM2putc (){
	ss_put_tid[COM2] = MyTid();
	char put_queue[SS_BUFFLEN2];
	int put_cur, put_end, req, clientTid, retVal;
	int state = READY;
	retVal = SS_SUCCESS;
	char c;
	volatile char * in;
	in = (volatile char *)( UART2_BASE + UART_DATA_OFFSET );
	put_cur = 0;
	put_end = 0;
	int putTid = Create(1, COM2putnotify);
	while(1)
	{
		req = Receive( &clientTid, &c, 1 );
		if (clientTid == putTid){
			if (put_cur != put_end){
				//kprintf(COM2, "swag1%d\n", clientTid);
				*in = (char)put_queue[put_cur];
				put_cur++;
				put_cur &= 1023;
				state = BUSY;
				Reply( clientTid, (char*)&retVal, 0 );
			} else {
				state = READY;
			}
		} else if (req == SS_PUTC){
			if (state == READY){
				//kprintf(COM2, "swag2%d\n", c);
				*in = c;
				state = BUSY;
				Reply( putTid, (char*)&retVal, 0 );
			} else {
				//kprintf(COM2, "q%d\n", c);
				put_queue[put_end] = c;
				put_end++;
				put_end &= 1023;
			}
			Reply( clientTid, (char*)&retVal, 0 );
		} else {
			retVal = SS_INVALID_REQUEST;
			Reply( clientTid, (char*)0, 0);
		}
	}
}

void COM2getc (){
	ss_get_tid[COM2] = MyTid();
	int get_queue[SS_BUFFLEN];
	char buf_queue[SS_BUFFLEN];
	int get_cur, get_end,buf_cur,buf_end, req,clientTid, retVal;
	retVal = SS_SUCCESS;
	char c;
	get_cur = 0;
	get_end = 0;
	buf_cur = 0;
	buf_end = 0;
	int getTid = Create(1, COM2getnotify);
	while(1)
	{
		req = Receive( &clientTid, &c, 1 );
		if (clientTid == getTid){
			//bwprintf(COM2, "%d", c);
			if ( get_cur != get_end){
				Reply( get_queue[get_cur], (char*)&c, 1);
				get_cur++;
				get_cur &= 127;
			} else {
				buf_queue[buf_end] = c;
				buf_end++;
				buf_end &= 127;
			}
			Reply( clientTid, (char*)0, 0);
		} else if (req == SS_GETC){
			if (buf_cur != buf_end){
				Reply( clientTid, (char *)&buf_queue[buf_cur], 1);
				buf_cur++;
				buf_cur &= 127;
			} else {
				get_queue[get_end] = clientTid;
				get_end++;
				get_end &= 127;
			}
		} else {
			retVal = SS_INVALID_REQUEST;
			Reply( clientTid, (char*)0, 0 );
		}
	}
}
