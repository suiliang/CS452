#ifndef SERIALSERVER_H
#define SERIALSERVER_H

#define SS_SUCCESS 0
#define SS_INVALID_REQUEST 4
#define SS_BUFFLEN 128
#define SS_NOTIFY 0
#define SS_GETC 1
#define SS_GET 1
#define SS_PUTC 1

#define BUSY 1
#define READY 0
#define SS_BUFFLEN2 1024

void init_uart();
void COM1putc();
void COM1getc();
void COM2putc();
void COM2getc();
int putc( int channel, char c );
char getc( int channel );
int putx( int channel, char c );
int putstr( int channel, char *str );
int putr( int channel, unsigned int reg );
void putw( int channel, int n, char fc, char *bf );
void kprintf( int channel, char *format, ... );
void putc2(char c1, char c2);
#endif
