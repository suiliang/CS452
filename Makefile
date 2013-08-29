#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -O3 -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map kernel.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all: SWI.o IRQ.o nameserver.o clockserver.o syscall.o schedule.o track_manager.o kernel.elf 

kernel: kernel.elf

#kernel stuff
syscall.o: syscall.S
	$(AS) $(ASFLAGS) -o syscall.o syscall.S
nameserver.s: nameserver.c nameserver.h
	$(XCC) -S $(CFLAGS) nameserver.c
nameserver.o: nameserver.s
	$(AS) $(ASFLAGS) -o nameserver.o nameserver.s
clockserver.s: clockserver.c clockserver.h
	$(XCC) -S $(CFLAGS) clockserver.c
clockserver.o: clockserver.s
	$(AS) $(ASFLAGS) -o clockserver.o clockserver.s
serialserver.s: serialserver.c serialserver.h
	$(XCC) -S $(CFLAGS) serialserver.c
serialserver.o: serialserver.s
	$(AS) $(ASFLAGS) -o serialserver.o serialserver.s
kernel.s: kernel.c kernel.h
	$(XCC) -S $(CFLAGS) kernel.c
kernel.o: kernel.s
	$(AS) $(ASFLAGS) -o kernel.o kernel.s

#train stuff
util.s: util.c util.h
	$(XCC) -S $(CFLAGS) util.c
util.o: util.s
	$(AS) $(ASFLAGS) -o util.o util.s
track_data.s: track_data.c track_data.h
	$(XCC) -S $(CFLAGS) track_data.c
track_data.o: track_data.s
	$(AS) $(ASFLAGS) -o track_data.o track_data.s
commandLine.s: commandLine.c commandLine.h
	$(XCC) -S $(CFLAGS) commandLine.c
commandLine.o: commandLine.s
	$(AS) $(ASFLAGS) -o commandLine.o commandLine.s
conductorServer.s: conductorServer.c conductorServer.h
	$(XCC) -S $(CFLAGS) conductorServer.c
conductorServer.o: conductorServer.s
	$(AS) $(ASFLAGS) -o conductorServer.o conductorServer.s
trainController.s: trainController.c trainController.h
	$(XCC) -S $(CFLAGS) trainController.c
trainController.o: trainController.s
	$(AS) $(ASFLAGS) -o trainController.o trainController.s
sensorServer.s: sensorServer.c sensorServer.h
	$(XCC) -S $(CFLAGS) sensorServer.c
sensorServer.o: sensorServer.s
	$(AS) $(ASFLAGS) -o sensorServer.o sensorServer.s
sensorsTask.s: sensorsTask.c sensorsTask.h
	$(XCC) -S $(CFLAGS) sensorsTask.c
sensorsTask.o: sensorsTask.s
	$(AS) $(ASFLAGS) -o sensorsTask.o sensorsTask.s

userprog.s: userprog.c userprog.h
	$(XCC) -S $(CFLAGS) userprog.c
userprog.o: userprog.s
	$(AS) $(ASFLAGS) -o userprog.o userprog.s

kernel.elf: syscall.o nameserver.o clockserver.o serialserver.o kernel.o util.o track_data.o commandLine.o conductorServer.o trainController.o sensorServer.o sensorsTask.o userprog.o
	$(LD) $(LDFLAGS) -o $@ syscall.o nameserver.o clockserver.o serialserver.o kernel.o util.o track_data.o commandLine.o conductorServer.o trainController.o sensorServer.o sensorsTask.o userprog.o -lbwio -lgcc
clean:
	-rm -f kernel.elf *.s *.o kernel.map
