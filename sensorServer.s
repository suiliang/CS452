	.file	"sensorServer.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"rejected request for free sensor\012\000"
	.align	2
.LC1:
	.ascii	"releasing %d\012\000"
	.align	2
.LC2:
	.ascii	"invalid request made to sensorServer from %d\012\000"
	.text
	.align	2
	.global	sensorServer
	.type	sensorServer, %function
sensorServer:
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L31
	sub	sp, sp, #416
.L25:
	add	sl, pc, sl
	mov	r0, #1
	bl	RegisterAs(PLT)
	mov	r1, #0
	add	r7, sp, #412
	mov	r2, r1
	mov	r0, r7
	bl	Receive(PLT)
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #412]
	bl	Reply(PLT)
	ldr	r3, .L31+4
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r3, #0
	add	r1, sp, #4
	mov	r0, #70
.L2:
	str	r0, [r3, r1]
	add	r3, r3, #4
	cmp	r3, #400
	bne	.L2
	ldr	r2, .L31+8
	ldr	fp, .L31+12
	ldr	r9, .L31+16
	str	r2, [sp, #0]
	mov	r5, r0
	add	r6, sp, #404
	add	r8, sp, #408
.L27:
	mov	r0, r7
	mov	r1, r6
	mov	r2, #4
	bl	Receive(PLT)
	ldrb	ip, [sp, #404]	@ zero_extendqisi2
	cmp	ip, #6
	beq	.L7
.L30:
	cmp	ip, #7
	beq	.L8
	cmp	ip, #5
	beq	.L29
	add	r1, sl, r9
	ldr	r2, [sp, #412]
	mov	r0, #1
	bl	kprintf(PLT)
.L26:
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #412]
	bl	Reply(PLT)
	mov	r0, r7
	mov	r1, r6
	mov	r2, #4
	bl	Receive(PLT)
	ldrb	ip, [sp, #404]	@ zero_extendqisi2
	cmp	ip, #6
	bne	.L30
.L7:
	ldrb	lr, [sp, #405]	@ zero_extendqisi2
	add	r2, sp, #416
	add	r3, r2, lr, asl #2
	ldr	r4, [r3, #-412]
	cmp	r4, #70
	beq	.L11
	mov	r1, #0
	mov	r2, r1
	mov	r0, r4
	strb	ip, [sp, #408]
	bl	Reply(PLT)
	ldrb	r3, [sp, #405]	@ zero_extendqisi2
	add	r2, sp, #416
	add	r1, r2, r3, asl #2
	mov	r2, #70
	str	r2, [r1, #-412]
	b	.L26
.L8:
	ldrb	r3, [sp, #405]	@ zero_extendqisi2
	add	r2, sp, #416
	add	r1, r2, r3, asl #2
	ldr	r2, [r1, #-412]
	cmp	r2, #70
	ldreqb	r3, [sp, #412]	@ zero_extendqisi2
	streq	r3, [r1, #-412]
	beq	.L27
.L15:
	mov	r3, #8
	ldr	r0, [sp, #412]
	mov	r1, r8
	mov	r2, #4
	strb	r3, [sp, #408]
	bl	Reply(PLT)
	b	.L27
.L29:
	cmp	r5, #70
	ldreqb	r5, [sp, #412]	@ zero_extendqisi2
	beq	.L27
	add	r1, sl, fp
	mov	r0, #1
	bl	kprintf(PLT)
	b	.L15
.L11:
	cmp	r5, #70
	beq	.L26
	ldr	r3, [sp, #0]
	mov	r2, r5
	add	r1, sl, r3
	mov	r0, #1
	strb	ip, [sp, #408]
	strb	lr, [sp, #409]
	bl	kprintf(PLT)
	mov	r0, r5
	mov	r1, r8
	mov	r2, #4
	bl	Reply(PLT)
	mov	r5, r4
	b	.L26
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	sensorsTask(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	sensorServer, .-sensorServer
	.align	2
	.global	reservationServer
	.type	reservationServer, %function
reservationServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	reservationServer, .-reservationServer
	.ident	"GCC: (GNU) 4.0.2"
