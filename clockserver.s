	.file	"clockserver.c"
	.data
	.align	2
	.type	CS_Tid, %object
	.size	CS_Tid, 4
CS_Tid:
	.word	-1
	.bss
	.align	2
time:
	.space	4
	.text
	.align	2
	.global	clocknotifier
	.type	clocknotifier, %function
clocknotifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L7
	ldr	r3, .L7+4
.L5:
	add	sl, pc, sl
	ldr	r4, [sl, r3]
	sub	sp, sp, #12
	mov	r5, #4
.L3:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	ldr	r0, [r4, #0]
	add	r1, sp, #11
	mov	r2, #0
	add	r3, sp, #4
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L3
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	CS_Tid(GOT)
	.size	clocknotifier, .-clocknotifier
	.align	2
	.global	start_clock
	.type	start_clock, %function
start_clock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	@ lr needed for prologue
	orr	r3, r3, r1
	str	r3, [r0, #8]
	str	r2, [r0, #0]
	bx	lr
	.size	start_clock, .-start_clock
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L14
	ldr	r3, .L14+4
.L13:
	add	sl, pc, sl
	ldr	r2, [sl, r3]
	@ lr needed for prologue
	ldr	r0, [r2, #0]
	ldmfd	sp!, {sl}
	bx	lr
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	time(GOT)
	.size	Time, .-Time
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L19
	ldr	r3, .L19+4
.L18:
	add	sl, pc, sl
	sub	sp, sp, #12
	ldr	r2, [sl, r3]
	mov	ip, #4
	add	r1, sp, #12
	str	r0, [r1, #-4]!
	add	r3, sp, ip
	ldr	r0, [r2, #0]
	mov	r2, ip
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #4]
	add	sp, sp, #12
	ldmfd	sp!, {sl, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	CS_Tid(GOT)
	.size	Delay, .-Delay
	.align	2
	.global	clockserver
	.type	clockserver, %function
clockserver:
	@ args = 0, pretend = 0, frame = 4012
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L55
	sub	sp, sp, #4000
.L51:
	add	sl, pc, sl
	sub	sp, sp, #12
	bl	MyTid(PLT)
	ldr	r3, .L55+4
	add	r1, sp, #12
	ldr	r2, [sl, r3]
	sub	r1, r1, #12
	str	r0, [r2, #0]
	mvn	r3, #0
	mov	r2, #0
.L22:
	str	r3, [r1, r2, asl #2]
	add	r2, r2, #1
	cmp	r2, #1000
	bne	.L22
	ldr	r3, .L55+8
	mov	r0, #1
	ldr	r1, [sl, r3]
	str	r2, [sp, #4004]
	bl	Create(PLT)
	add	r9, sp, #4000
	add	r8, sp, #4000
	add	r9, r9, #4
	mov	r6, #0
	add	r8, r8, #8
	add	r7, sp, #4000
.L52:
	mov	r0, r8
	mov	r1, r9
	mov	r2, #4
	bl	Receive(PLT)
	subs	ip, r0, #0
	beq	.L26
.L54:
	cmp	ip, #4
	beq	.L53
	mov	r3, #5
	mov	r1, r7
	mov	r2, #4
	ldr	r0, [sp, #4008]
	str	r3, [sp, #4000]
	bl	Reply(PLT)
	mov	r0, r8
	mov	r1, r9
	mov	r2, #4
	bl	Receive(PLT)
	subs	ip, r0, #0
	bne	.L54
.L26:
	ldr	r3, .L55+12
	add	r1, r6, #1
	smull	r2, r0, r3, r1
	mov	r2, r1, asr #31
	rsb	r6, r2, r0, asr #6
	rsb	r3, r6, r6, asl #5
	add	r3, r6, r3, asl #2
	sub	r6, r1, r3, asl #3
	add	r2, sp, #4000
	mov	r5, r6, asl #2
	add	r2, r2, #12
	add	r3, r5, r2
	ldr	r4, [r3, #-4012]
	str	ip, [sp, #4000]
	cmn	r4, #1
	beq	.L30
	cmp	r4, #64
	ble	.L33
.L43:
	and	r0, r4, #63
	mov	r2, #4
	mov	r1, r7
	bl	Reply(PLT)
	add	r2, sp, #4000
	mov	r4, r4, asr #6
	add	r2, r2, #12
	add	r3, r5, r2
	cmp	r4, #64
	str	r4, [r3, #-4012]
	bgt	.L43
	cmn	r4, #1
	beq	.L30
.L33:
	mov	r2, #4
	mov	r0, r4
	mov	r1, r7
	bl	Reply(PLT)
	add	r3, sp, #4000
	add	r3, r3, #12
	add	r2, r5, r3
	mvn	r3, #0
	str	r3, [r2, #-4012]
.L30:
	ldr	r0, [sp, #4008]
	mov	r1, r7
	mov	r2, #4
	bl	Reply(PLT)
	b	.L52
.L53:
	ldr	r3, [sp, #4004]
	cmp	r3, #0
	ble	.L34
	add	r1, r6, r3
	ldr	r3, .L55+12
	smull	r2, r0, r3, r1
	mov	r2, r1, asr #31
	rsb	r2, r2, r0, asr #6
	rsb	r3, r2, r2, asl #5
	add	r3, r2, r3, asl #2
	sub	r2, r1, r3, asl #3
	add	r3, sp, #4000
	add	r3, r3, #12
	add	r1, r3, r2, asl #2
	ldr	r0, [r1, #-4012]
	str	r2, [sp, #4004]
	cmn	r0, #1
	ldrne	r3, [sp, #4008]
	ldreq	r3, [sp, #4008]
	addne	r3, r3, r0, asl #6
	streq	r3, [r1, #-4012]
	strne	r3, [r1, #-4012]
	b	.L52
.L34:
	mov	r3, #0
	ldr	r0, [sp, #4008]
	mov	r1, r7
	mov	r2, #4
	str	r3, [sp, #4000]
	bl	Reply(PLT)
	b	.L52
.L56:
	.align	2
.L55:
	.word	_GLOBAL_OFFSET_TABLE_-(.L51+8)
	.word	CS_Tid(GOT)
	.word	clocknotifier(GOT)
	.word	274877907
	.size	clockserver, .-clockserver
	.ident	"GCC: (GNU) 4.0.2"
