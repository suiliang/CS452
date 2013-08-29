#ifndef NAMESERVER_H
#define NAMESERVER_H

#define MAX_NAME_HASH 100
#define NS_WHOIS 4
#define NS_REGISTER 5
#define NS_INVALID 6

#define NS_UNDEFINED_TID 100

#define NS_SUCCESS 0
#define NS_HASH_COLLISION 1
#define NS_NOT_FOUND 2
#define NS_INVALID_REQUEST 3

struct message 
{
	int code;
	char *msg;
};

int RegisterAs( int n );
int WhoIs( int n );
void nameServer( );
#endif /* NAMESERVER_H */
