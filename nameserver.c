#include <nameserver.h>
#include <syscall.h>
#include <bwio.h>
#include <serialserver.h>

static int ns_tid = -1;

int WhoIs( int n )
{
	int i,retVal;
	i = n;
	Send( ns_tid, (char*)&i, NS_WHOIS, (char*)&retVal, sizeof( int )/sizeof(char) );
	return retVal;
}

int RegisterAs(	int n )
{
	int i,retVal;
	i = n;
	Send( ns_tid, (char*)&i, NS_REGISTER, (char*)&retVal, sizeof( int )/sizeof(char) );
	return retVal;
}

void nameServer( )
{
	ns_tid = MyTid();
	int name_space[MAX_NAME_HASH];
	int clientTid, retVal, clientMsg,req;
	for (retVal = 0; retVal < MAX_NAME_HASH; retVal++){
		name_space[retVal] = NS_UNDEFINED_TID;
	}

	while(1)
	{
		//bwprintf(COM2, "nameserver calls receive\n");
		req = Receive( (int *)&clientTid, (char*)&clientMsg, sizeof(int)/sizeof(char) );
		bwprintf(COM2, "nameserver got clientTid: %d, req: %d\n\r", clientTid,req);
		switch ( req ) 
		{
			case ( NS_REGISTER ):
				if ( name_space[clientMsg] == NS_UNDEFINED_TID ) {
					//bwprintf(COM2, "Registering %d to have tid %d\n",clientMsg,clientTid);
					name_space[clientMsg] = clientTid;
					retVal = NS_SUCCESS;
				} else {
					kprintf(COM2, "collision has occured\n");
					retVal = NS_HASH_COLLISION;
				}
				break;
			case ( NS_WHOIS ):
				retVal = name_space[clientMsg];
				retVal = (retVal == NS_UNDEFINED_TID) ? NS_NOT_FOUND : retVal;
				break;
			default :
				//kprintf(COM2, "Invalid who is was made by Tid:%d\n", clientTid);
				retVal = NS_INVALID_REQUEST;
		}
		Reply( clientTid, (char*)&retVal, sizeof( int )/sizeof(char) );
	}
}
