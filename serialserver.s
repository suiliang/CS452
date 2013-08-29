	.file	"serialserver.c"
	.text
	.align	2
	.global	COM1putnotify
	.type	COM1putnotify, %function
COM1putnotify:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L7
	ldr	r3, .L7+4
.L4:
	add	sl, pc, sl
	sub	sp, sp, #8
	ldr	r5, [sl, r3]
	mov	r4, #0
	add	r6, sp, #4
.L5:
	ldr	r0, [r5, #0]
	mov	r1, r6
	mov	r2, r4
	mov	r3, r6
	str	r4, [sp, #0]
	bl	Send(PLT)
	mov	r0, #1
	bl	AwaitEvent(PLT)
	b	.L5
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	ss_put_tid(GOT)
	.size	COM1putnotify, .-COM1putnotify
	.align	2
	.global	COM1getnotify
	.type	COM1getnotify, %function
COM1getnotify:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L14
	ldr	r3, .L14+4
.L13:
	add	sl, pc, sl
	ldr	r4, [sl, r3]
	sub	sp, sp, #12
	mov	r5, #0
.L11:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	r3, [r4, #0]
	str	r0, [sp, #4]
	add	r1, sp, #4
	mov	r0, r3
	mov	r2, #1
	add	r3, sp, #8
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L11
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	ss_get_tid(GOT)
	.size	COM1getnotify, .-COM1getnotify
	.align	2
	.global	COM1putc
	.type	COM1putc, %function
COM1putc:
	@ args = 0, pretend = 0, frame = 1044
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L38
	sub	sp, sp, #1040
	sub	sp, sp, #4
.L33:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L38+4
	mov	r4, #0
	ldr	r2, [sl, r3]
	ldr	r3, .L38+8
	str	r0, [r2, #0]
	ldr	r1, [sl, r3]
	mov	r0, r4
	str	r4, [sp, #1032]
	bl	Create(PLT)
	add	r2, sp, #1024
	add	r3, sp, #1040
	add	r2, r2, #12
	add	r3, r3, #3
	add	r9, sp, #1024
	mov	r8, r0
	mov	fp, r4
	mov	r6, r4
	mov	r7, r4
	stmia	sp, {r2, r3}	@ phole stm
	add	r9, r9, #8
	mov	r1, r3
	mov	r0, r2
.L34:
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #1036]
	mov	lr, r0
	cmp	r8, ip
	beq	.L35
.L19:
	mov	r1, #0
	cmp	lr, #1
	mov	r0, ip
	mov	r2, r1
	beq	.L36
	mov	r3, #4
	str	r3, [sp, #1032]
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #1036]
	mov	lr, r0
	cmp	r8, ip
	bne	.L19
.L35:
	add	r2, sp, #1040
	add	r2, r2, #4
	cmp	r6, r7
	add	r3, r2, r6
	add	lr, r6, #1
	mov	r0, ip
	mov	r1, r9
	mov	r2, #0
	mov	fp, #1
	beq	.L18
	ldrb	r3, [r3, #-1036]	@ zero_extendqisi2
	ldr	ip, .L38+12
	mov	r6, lr, asl #22
	strb	r3, [ip, #0]
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	r6, r6, lsr #22
	b	.L34
.L36:
	add	r3, sp, #1040
	add	r3, r3, #4
	cmp	fp, #0
	mov	r2, fp
	mov	r0, r8
	mov	r1, r9
	add	r5, r7, #1
	add	r4, r3, r7
	beq	.L37
	ldrb	r3, [sp, #1043]	@ zero_extendqisi2
	mov	r7, r5, asl #22
	strb	r3, [r4, #-1036]
	mov	r7, r7, lsr #22
.L26:
	mov	r1, r9
	mov	r0, ip
	mov	r2, #0
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	b	.L34
.L18:
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	fp, #0
	b	.L34
.L37:
	ldr	ip, .L38+12
	ldrb	r3, [sp, #1043]	@ zero_extendqisi2
	mov	fp, lr
	strb	r3, [ip, #0]
	bl	Reply(PLT)
	ldr	ip, [sp, #1036]
	b	.L26
.L39:
	.align	2
.L38:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	ss_put_tid(GOT)
	.word	COM1putnotify(GOT)
	.word	-2138308608
	.size	COM1putc, .-COM1putc
	.align	2
	.global	COM1getc
	.type	COM1getc, %function
COM1getc:
	@ args = 0, pretend = 0, frame = 660
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L61
	sub	sp, sp, #660
.L57:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L61+4
	mov	r7, #0
	ldr	r2, [sl, r3]
	ldr	r3, .L61+8
	str	r0, [r2, #0]
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	add	r9, sp, #656
	mov	r5, r0
	add	r0, sp, #524
	mov	r8, r7
	mov	r6, r7
	mov	r4, r7
	add	fp, sp, #652
	add	r9, r9, #3
	str	r0, [sp, #8]
.L58:
	mov	r1, r9
	mov	r0, fp
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #652]
	mov	r3, r0
	cmp	r5, ip
	beq	.L59
.L42:
	mov	r1, #0
	cmp	r3, #1
	mov	r0, ip
	mov	r2, r1
	beq	.L60
	bl	Reply(PLT)
	mov	r1, r9
	mov	r0, fp
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #652]
	mov	r3, r0
	cmp	r5, ip
	bne	.L42
.L59:
	add	r2, sp, #660
	add	r3, r2, r6, asl #2
	mov	r2, #1
	add	r0, r4, r2
	str	r0, [sp, #0]
	cmp	r6, r7
	add	r0, sp, #660
	mov	r1, r9
	add	lr, r0, r4
	beq	.L44
	ldr	r0, [r3, #-648]
	bl	Reply(PLT)
	add	r3, r6, #1
	ldr	ip, [sp, #652]
	and	r6, r3, #127
.L46:
	mov	r1, #0
	mov	r0, ip
	mov	r2, r1
	bl	Reply(PLT)
	b	.L58
.L60:
	mov	r2, r3
	ldr	r3, [sp, #8]
	cmp	r8, r4
	add	r1, r3, r8
	add	r3, r7, #1
	str	r3, [sp, #4]
	add	r3, sp, #660
	add	lr, r3, r7, asl #2
	beq	.L49
	bl	Reply(PLT)
	add	r3, r8, #1
	and	r8, r3, #127
	b	.L58
.L44:
	ldr	r2, [sp, #0]
	ldrb	r3, [sp, #659]	@ zero_extendqisi2
	and	r4, r2, #127
	strb	r3, [lr, #-136]
	b	.L46
.L49:
	ldr	r0, [sp, #4]
	mov	r4, r8
	and	r7, r0, #127
	str	ip, [lr, #-648]
	b	.L58
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.L57+8)
	.word	ss_get_tid(GOT)
	.word	COM1getnotify(GOT)
	.size	COM1getc, .-COM1getc
	.align	2
	.global	COM2putnotify
	.type	COM2putnotify, %function
COM2putnotify:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L68
	ldr	r3, .L68+4
.L67:
	add	sl, pc, sl
	sub	sp, sp, #8
	ldr	r6, [sl, r3]
	add	r5, sp, #4
	mov	r4, #0
.L65:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	r0, [r6, #4]
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L65
.L69:
	.align	2
.L68:
	.word	_GLOBAL_OFFSET_TABLE_-(.L67+8)
	.word	ss_put_tid(GOT)
	.size	COM2putnotify, .-COM2putnotify
	.align	2
	.global	COM2getnotify
	.type	COM2getnotify, %function
COM2getnotify:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L75
	ldr	r3, .L75+4
.L74:
	add	sl, pc, sl
	ldr	r4, [sl, r3]
	sub	sp, sp, #12
	mov	r5, #0
.L72:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	r3, [r4, #4]
	add	r1, sp, #12
	strb	r0, [r1, #-1]!
	mov	r2, #1
	mov	r0, r3
	add	r3, sp, #4
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L72
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	ss_get_tid(GOT)
	.size	COM2getnotify, .-COM2getnotify
	.align	2
	.global	COM2putc
	.type	COM2putc, %function
COM2putc:
	@ args = 0, pretend = 0, frame = 1044
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L99
	sub	sp, sp, #1040
	sub	sp, sp, #4
.L94:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r2, .L99+4
	ldr	r3, .L99+8
	mov	r4, #0
	ldr	r1, [sl, r3]
	ldr	r3, [sl, r2]
	str	r4, [sp, #1032]
	str	r0, [r3, #4]
	mov	r0, #1
	bl	Create(PLT)
	add	r2, sp, #1024
	add	r3, sp, #1040
	add	r2, r2, #12
	add	r3, r3, #3
	add	r9, sp, #1024
	mov	r8, r0
	mov	fp, r4
	mov	r6, r4
	mov	r7, r4
	stmia	sp, {r2, r3}	@ phole stm
	add	r9, r9, #8
	mov	r1, r3
	mov	r0, r2
.L95:
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #1036]
	mov	lr, r0
	cmp	r8, ip
	beq	.L96
.L80:
	mov	r1, #0
	cmp	lr, #1
	mov	r0, ip
	mov	r2, r1
	beq	.L97
	mov	r3, #4
	str	r3, [sp, #1032]
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #1036]
	mov	lr, r0
	cmp	r8, ip
	bne	.L80
.L96:
	add	r2, sp, #1040
	add	r2, r2, #4
	cmp	r6, r7
	add	r3, r2, r6
	add	lr, r6, #1
	mov	r0, ip
	mov	r1, r9
	mov	r2, #0
	mov	fp, #1
	beq	.L79
	ldrb	r3, [r3, #-1036]	@ zero_extendqisi2
	ldr	ip, .L99+12
	mov	r6, lr, asl #22
	strb	r3, [ip, #0]
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	r6, r6, lsr #22
	b	.L95
.L97:
	add	r3, sp, #1040
	add	r3, r3, #4
	cmp	fp, #0
	mov	r2, fp
	mov	r0, r8
	mov	r1, r9
	add	r5, r7, #1
	add	r4, r3, r7
	beq	.L98
	ldrb	r3, [sp, #1043]	@ zero_extendqisi2
	mov	r7, r5, asl #22
	strb	r3, [r4, #-1036]
	mov	r7, r7, lsr #22
.L87:
	mov	r1, r9
	mov	r0, ip
	mov	r2, #0
	bl	Reply(PLT)
	ldmia	sp, {r0, r1}	@ phole ldm
	b	.L95
.L79:
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	fp, #0
	b	.L95
.L98:
	ldr	ip, .L99+12
	ldrb	r3, [sp, #1043]	@ zero_extendqisi2
	mov	fp, lr
	strb	r3, [ip, #0]
	bl	Reply(PLT)
	ldr	ip, [sp, #1036]
	b	.L87
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L94+8)
	.word	ss_put_tid(GOT)
	.word	COM2putnotify(GOT)
	.word	-2138243072
	.size	COM2putc, .-COM2putc
	.align	2
	.global	COM2getc
	.type	COM2getc, %function
COM2getc:
	@ args = 0, pretend = 0, frame = 660
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L122
	sub	sp, sp, #660
.L118:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L122+4
	mov	r7, #0
	ldr	r2, [sl, r3]
	ldr	r3, .L122+8
	str	r0, [r2, #4]
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	add	r9, sp, #656
	mov	r5, r0
	add	r0, sp, #524
	mov	r8, r7
	mov	r6, r7
	mov	r4, r7
	add	fp, sp, #652
	add	r9, r9, #3
	str	r0, [sp, #8]
.L119:
	mov	r1, r9
	mov	r0, fp
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #652]
	mov	r3, r0
	cmp	r5, ip
	beq	.L120
.L103:
	mov	r1, #0
	cmp	r3, #1
	mov	r0, ip
	mov	r2, r1
	beq	.L121
	bl	Reply(PLT)
	mov	r1, r9
	mov	r0, fp
	mov	r2, #1
	bl	Receive(PLT)
	ldr	ip, [sp, #652]
	mov	r3, r0
	cmp	r5, ip
	bne	.L103
.L120:
	add	r2, sp, #660
	add	r3, r2, r6, asl #2
	mov	r2, #1
	add	r0, r4, r2
	str	r0, [sp, #0]
	cmp	r6, r7
	add	r0, sp, #660
	mov	r1, r9
	add	lr, r0, r4
	beq	.L105
	ldr	r0, [r3, #-648]
	bl	Reply(PLT)
	add	r3, r6, #1
	ldr	ip, [sp, #652]
	and	r6, r3, #127
.L107:
	mov	r1, #0
	mov	r0, ip
	mov	r2, r1
	bl	Reply(PLT)
	b	.L119
.L121:
	mov	r2, r3
	ldr	r3, [sp, #8]
	cmp	r8, r4
	add	r1, r3, r8
	add	r3, r7, #1
	str	r3, [sp, #4]
	add	r3, sp, #660
	add	lr, r3, r7, asl #2
	beq	.L110
	bl	Reply(PLT)
	add	r3, r8, #1
	and	r8, r3, #127
	b	.L119
.L105:
	ldr	r2, [sp, #0]
	ldrb	r3, [sp, #659]	@ zero_extendqisi2
	and	r4, r2, #127
	strb	r3, [lr, #-136]
	b	.L107
.L110:
	ldr	r0, [sp, #4]
	mov	r4, r8
	and	r7, r0, #127
	str	ip, [lr, #-648]
	b	.L119
.L123:
	.align	2
.L122:
	.word	_GLOBAL_OFFSET_TABLE_-(.L118+8)
	.word	ss_get_tid(GOT)
	.word	COM2getnotify(GOT)
	.size	COM2getc, .-COM2getc
	.align	2
	.global	setfifo
	.type	setfifo, %function
setfifo:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	@ lr needed for prologue
	ldr	ip, .L134
	beq	.L129
	cmp	r0, #1
	add	ip, ip, #65536
	mvn	r0, #0
	bxne	lr
.L129:
	ldr	r3, [ip, #0]
	cmp	r1, #0
	orr	r2, r3, #16
	mov	r0, #0
	biceq	r2, r3, #16
	str	r2, [ip, #0]
	bx	lr
.L135:
	.align	2
.L134:
	.word	-2138308600
	.size	setfifo, .-setfifo
	.align	2
	.global	init_uart
	.type	init_uart, %function
init_uart:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r1, #0
	mov	r6, r2
	bl	setfifo(PLT)
	cmp	r4, #0
	ldreq	r2, .L149
	ldreq	r1, .L149+4
	beq	.L140
	cmp	r4, #1
	beq	.L147
.L137:
	cmp	r4, #0
	ldreq	r3, .L149+8
	streq	r6, [r3, #0]
	ldmeqfd	sp!, {r4, r5, r6, pc}
.L148:
	cmp	r4, #1
	ldreq	r3, .L149+12
	streq	r6, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L147:
	ldr	r2, .L149+16
	ldr	r1, .L149+20
.L140:
	cmp	r5, #2400
	moveq	r3, #0
	streq	r3, [r2, #0]
	moveq	r2, #191
	streq	r2, [r1, #0]
	beq	.L137
	ldr	r3, .L149+24
	cmp	r5, r3
	moveq	r3, #0
	streq	r3, [r2, #0]
	moveq	r2, #3
	streq	r2, [r1, #0]
	cmp	r4, #0
	ldreq	r3, .L149+8
	streq	r6, [r3, #0]
	ldmeqfd	sp!, {r4, r5, r6, pc}
	b	.L148
.L150:
	.align	2
.L149:
	.word	-2138308596
	.word	-2138308592
	.word	-2138308588
	.word	-2138243052
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.size	init_uart, .-init_uart
	.align	2
	.global	putc
	.type	putc, %function
putc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L154
	ldr	r3, .L154+4
.L153:
	add	sl, pc, sl
	ldr	r2, [sl, r3]
	sub	sp, sp, #12
	mov	ip, #1
	strb	r1, [sp, #4]
	ldr	r0, [r2, r0, asl #2]
	add	r1, sp, #4
	mov	r2, ip
	add	r3, sp, #8
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #8]
	add	sp, sp, #12
	ldmfd	sp!, {sl, pc}
.L155:
	.align	2
.L154:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	ss_put_tid(GOT)
	.size	putc, .-putc
	.align	2
	.global	getc
	.type	getc, %function
getc:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L159
	ldr	r3, .L159+4
.L158:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	sub	sp, sp, #8
	mov	ip, #1
	ldr	r0, [r1, r0, asl #2]
	mov	r2, ip
	mov	r1, #0
	add	r3, sp, #7
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L160:
	.align	2
.L159:
	.word	_GLOBAL_OFFSET_TABLE_-(.L158+8)
	.word	ss_get_tid(GOT)
	.size	getc, .-getc
	.align	2
	.global	putx
	.type	putx, %function
putx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	and	r3, r1, #255
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r6, r0
	mov	r0, r3, lsr #4
	mov	r4, r1
	bl	c2x(PLT)
	mov	r5, r0
	and	r0, r4, #15
	bl	c2x(PLT)
	mov	r1, r5
	mov	r4, r0
	mov	r0, r6
	bl	putc(PLT)
	mov	r0, r6
	mov	r1, r4
	ldmfd	sp!, {r4, r5, r6, lr}
	b	putc(PLT)
	.size	putx, .-putx
	.align	2
	.global	putr
	.type	putr, %function
putr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #4
	add	r6, sp, #4
	str	r1, [r6, #-4]!
	mov	r5, r0
	mov	r4, #3
.L164:
	ldrb	r1, [r6, r4]	@ zero_extendqisi2
	mov	r0, r5
	sub	r4, r4, #1
	bl	putx(PLT)
	cmn	r4, #1
	bne	.L164
	mov	r0, r5
	mov	r1, #32
	bl	putc(PLT)
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	putr, .-putr
	.align	2
	.global	putstr
	.type	putstr, %function
putstr:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, r1
	ldrb	r1, [r1, #0]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r1, #0
	bne	.L178
.L170:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, pc}
.L178:
	mov	r5, r3
	b	.L172
.L173:
	ldrb	r1, [r5, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L170
.L172:
	mov	r0, r4
	bl	putc(PLT)
	cmp	r0, #0
	bge	.L173
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, pc}
	.size	putstr, .-putstr
	.align	2
	.global	putw
	.type	putw, %function
putw:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r7, r3
	cmp	ip, #0
	mov	r6, r0
	and	r5, r2, #255
	add	r8, r3, #1
	bne	.L199
.L180:
	cmp	r1, #0
	sub	r4, r1, #1
	ble	.L186
.L193:
	sub	r4, r4, #1
	mov	r0, r6
	mov	r1, r5
	bl	putc(PLT)
	add	r3, r4, #1
	cmp	r3, #0
	bgt	.L193
	ldrb	ip, [r7, #0]	@ zero_extendqisi2
.L186:
	and	r1, ip, #255
	cmp	r1, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	mov	r4, r8
.L191:
	mov	r0, r6
	bl	putc(PLT)
	ldrb	r1, [r4], #1	@ zero_extendqisi2
	cmp	r1, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	mov	r0, r6
	bl	putc(PLT)
	ldrb	r1, [r4], #1	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L191
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L199:
	cmp	r1, #0
	movgt	r0, r1
	movgt	r2, #0
	ble	.L180
.L183:
	ldrb	r3, [r2, r8]	@ zero_extendqisi2
	sub	r0, r0, #1
	cmp	r3, #0
	add	r2, r2, #1
	beq	.L184
	cmp	r1, r2
	bne	.L183
.L184:
	mov	r1, r0
	b	.L180
	.size	putw, .-putw
	.align	2
	.global	a2d
	.type	a2d, %function
a2d:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r0, r0, #255
	sub	r2, r0, #48
	and	r3, r2, #255
	cmp	r3, #9
	@ lr needed for prologue
	sub	r1, r0, #97
	bls	.L203
	cmp	r1, #5
	sub	r3, r0, #65
	sub	r2, r0, #87
	bhi	.L209
.L203:
	mov	r0, r2
	bx	lr
.L209:
	cmp	r3, #5
	mvn	r2, #0
	subls	r2, r0, #55
	b	.L203
	.size	a2d, .-a2d
	.align	2
	.global	a2i
	.type	a2i, %function
a2i:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r8, r1
	ldr	r1, [r1, #0]
	mov	r7, r2
	mov	r9, r3
	and	r4, r0, #255
	mov	r6, #0
	b	.L211
.L212:
	cmp	r0, r7
	add	r1, r5, #1
	bgt	.L213
	mla	r6, r7, r6, r0
	ldrb	r4, [r1, #-1]	@ zero_extendqisi2
.L211:
	mov	r0, r4
	mov	r5, r1
	bl	a2d(PLT)
	cmp	r0, #0
	bge	.L212
.L213:
	mov	r0, r4
	str	r5, [r8, #0]
	str	r6, [r9, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	.size	a2i, .-a2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	ui2a
	.type	ui2a, %function
ui2a:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r7, r1
	mov	r9, r2
	movcc	r6, #1
	movcc	r8, #0
	bcc	.L238
	mov	r6, #1
.L220:
	mul	r6, r7, r6
	mov	r0, r5
	mov	r1, r6
	bl	__udivsi3(PLT)
	cmp	r7, r0
	bls	.L220
	cmp	r6, #0
	movne	r8, #0
	bne	.L238
.L222:
	mov	r3, #0
	strb	r3, [r9, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L224:
	cmp	r4, #9
	movgt	r3, #87
	movle	r3, #48
	add	r3, r3, r4
	cmp	r6, #0
	strb	r3, [r9], #1
	add	r8, r8, #1
	beq	.L222
.L238:
	mov	r1, r6
	mov	r0, r5
	bl	__udivsi3(PLT)
	mov	r1, r6
	mov	r4, r0
	mov	r0, r5
	bl	__umodsi3(PLT)
	mov	r1, r7
	mov	r5, r0
	mov	r0, r6
	bl	__udivsi3(PLT)
	cmp	r4, #0
	cmple	r8, #0
	mov	r6, r0
	bne	.L224
	cmp	r0, #0
	bne	.L238
	cmp	r4, #9
	movgt	r3, #87
	movle	r3, #48
	add	r3, r3, r4
	cmp	r6, #0
	strb	r3, [r9], #1
	add	r8, r8, #1
	bne	.L238
	b	.L222
	.size	ui2a, .-ui2a
	.align	2
	.global	i2a
	.type	i2a, %function
i2a:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	mov	r2, r1
	movlt	r3, #45
	mov	r1, #10
	strltb	r3, [r2], #1
	rsblt	r0, r0, #0
	@ lr needed for prologue
	b	ui2a(PLT)
	.size	i2a, .-i2a
	.align	2
	.global	format
	.type	format, %function
format:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	mov	r5, r2
	mov	r6, r0
	add	r7, sp, #4
	str	r1, [sp, #0]
	mov	r2, r1
.L272:
	mov	r3, r2
	ldrb	r1, [r3], #1	@ zero_extendqisi2
	cmp	r1, #0
	str	r3, [sp, #0]
	beq	.L261
	cmp	r1, #37
	bne	.L270
	mov	r4, #0
	str	r4, [sp, #16]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	add	r3, r2, #2
	cmp	r0, #48
	str	r3, [sp, #0]
	beq	.L249
	bcc	.L251
	cmp	r0, #57
	movls	r1, sp
	movls	r2, #10
	addls	r3, sp, #16
	blls	a2i(PLT)
.L251:
	cmp	r0, #115
	beq	.L256
.L275:
	bhi	.L259
	cmp	r0, #99
	beq	.L254
	bhi	.L260
	cmp	r0, #0
	bne	.L273
.L261:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L273:
	cmp	r0, #37
	bne	.L269
	mov	r1, r0
.L270:
	mov	r0, r6
	bl	putc(PLT)
	ldr	r2, [sp, #0]
	b	.L272
.L259:
	cmp	r0, #117
	beq	.L257
	cmp	r0, #120
	beq	.L274
.L269:
	ldr	r2, [sp, #0]
	b	.L272
.L249:
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	add	r3, r2, #3
	cmp	r0, #115
	mov	r4, #1
	str	r3, [sp, #0]
	bne	.L275
.L256:
	ldr	r3, [r5, #0]
	mov	r2, #0
	mov	r0, r6
	ldr	r1, [sp, #16]
	bl	putw(PLT)
	add	r3, r5, #4
	ldr	r2, [sp, #0]
	mov	r5, r3
	b	.L272
.L260:
	cmp	r0, #100
	bne	.L269
	ldr	r0, [r5, #0]
	mov	r1, r7
	bl	i2a(PLT)
	b	.L271
.L257:
	ldr	r0, [r5, #0]
	mov	r1, #10
	mov	r2, r7
	bl	ui2a(PLT)
.L271:
	mov	r2, r4
	mov	r3, r7
	mov	r0, r6
	ldr	r1, [sp, #16]
	bl	putw(PLT)
	add	r3, r5, #4
	ldr	r2, [sp, #0]
	mov	r5, r3
	b	.L272
.L254:
	ldrb	r1, [r5, #0]	@ zero_extendqisi2
	mov	r0, r6
	bl	putc(PLT)
	add	r3, r5, #4
	ldr	r2, [sp, #0]
	mov	r5, r3
	b	.L272
.L274:
	ldr	r0, [r5, #0]
	mov	r1, #16
	mov	r2, r7
	bl	ui2a(PLT)
	b	.L271
	.size	format, .-format
	.align	2
	.global	kprintf
	.type	kprintf, %function
kprintf:
	@ args = 4, pretend = 12, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
	stmfd	sp!, {r1, r2, r3}
	str	lr, [sp, #-4]!
	ldr	r1, [sp, #4]
	add	r2, sp, #8
	bl	format(PLT)
	ldr	lr, [sp], #4
	add	sp, sp, #12
	bx	lr
	.size	kprintf, .-kprintf
	.bss
	.align	2
ss_get_tid:
	.space	8
	.align	2
ss_put_tid:
	.space	8
	.ident	"GCC: (GNU) 4.0.2"
