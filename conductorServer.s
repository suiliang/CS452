	.file	"conductorServer.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"conduct ready\012\000"
	.align	2
.LC1:
	.ascii	"# of train limit reached, add command failed\012\000"
	.align	2
.LC2:
	.ascii	"Created train %d with tid: %d!\012\000"
	.align	2
.LC3:
	.ascii	"trying to move uninitialized train, tr command fail"
	.ascii	"ed\012\000"
	.align	2
.LC4:
	.ascii	"sending move command to train controller\012\000"
	.align	2
.LC5:
	.ascii	"trying to move uninitialized train, goto command fa"
	.ascii	"iled\012\000"
	.align	2
.LC6:
	.ascii	"fatal error, train doesn't know its TR\012\000"
	.align	2
.LC7:
	.ascii	"# of train limit reached, locate command failed\012"
	.ascii	"\000"
	.align	2
.LC8:
	.ascii	"locating %d!\012\000"
	.align	2
.LC9:
	.ascii	"invalid request made to conductor from %d\012\000"
	.text
	.align	2
	.global	conductorServer
	.type	conductorServer, %function
conductorServer:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L54
	sub	sp, sp, #72
.L50:
	add	sl, pc, sl
	mov	r0, #3
	bl	RegisterAs(PLT)
	mov	r1, #0
	add	r8, sp, #68
	mov	r2, r1
	mov	r0, r8
	bl	Receive(PLT)
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #68]
	add	r6, sp, #40
	bl	Reply(PLT)
	add	r9, sp, #60
	mov	r3, r6
	mov	r2, #127
.L2:
	strb	r2, [r3, #1]
	add	r3, r3, #4
	cmp	r3, r9
	bne	.L2
	mov	r0, #0
	bl	WhoIs(PLT)
	ldr	r1, .L54+4
	mov	r0, #1
	add	r1, sl, r1
	bl	kprintf(PLT)
	ldr	r2, .L54+8
	ldr	r3, .L54+12
	ldr	lr, .L54+16
	str	r2, [sp, #32]
	str	r3, [sp, #36]
	ldr	r2, .L54+20
	ldr	r3, .L54+24
	str	lr, [sp, #28]
	ldr	lr, .L54+28
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	str	lr, [sp, #16]
	ldr	r2, .L54+32
	ldr	r3, .L54+36
	ldr	lr, .L54+40
	ldr	fp, .L54+44
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	lr, [sp, #4]
	add	r7, sp, #64
.L52:
	mov	r0, r8
	mov	r1, r7
	mov	r2, #4
	bl	Receive(PLT)
	ldrb	r3, [sp, #64]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L5
	.p2align 2
.L11:
	b	.L6
	b	.L7
	b	.L8
	b	.L9
	b	.L10
.L5:
	add	r1, sl, fp
	ldr	r2, [sp, #68]
	mov	r0, #1
	bl	kprintf(PLT)
	mov	r1, #0
	ldr	r0, [sp, #68]
	mov	r2, r1
	bl	Reply(PLT)
	b	.L52
.L6:
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #68]
	bl	Reply(PLT)
	ldrb	r1, [sp, #65]	@ zero_extendqisi2
	mov	r5, #0
	mov	r2, r6
.L16:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	r2, r2, #4
	cmp	r3, r1
	beq	.L17
	add	r5, r5, #1
	cmp	r5, #5
	bne	.L16
	ldr	r2, [sp, #24]
	mov	r0, #1
	add	r1, sl, r2
	bl	kprintf(PLT)
	b	.L52
.L7:
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #68]
	bl	Reply(PLT)
	ldrb	r0, [sp, #65]	@ zero_extendqisi2
	mov	r1, #0
	mov	r2, r6
.L20:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	r2, r2, #4
	cmp	r3, r0
	beq	.L21
	add	r1, r1, #1
	cmp	r1, #5
	bne	.L20
	ldr	r3, [sp, #16]
	mov	r0, #1
	add	r1, sl, r3
	bl	kprintf(PLT)
	b	.L52
.L8:
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #68]
	bl	Reply(PLT)
	mov	r4, #0
	mov	r2, r6
.L12:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	r2, r2, #4
	cmp	r3, #127
	beq	.L13
	add	r4, r4, #1
	cmp	r4, #5
	bne	.L12
	ldr	r2, [sp, #32]
	mov	r0, #1
	add	r1, sl, r2
	bl	kprintf(PLT)
	b	.L52
.L9:
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #68]
	bl	Reply(PLT)
	ldrb	r0, [sp, #65]	@ zero_extendqisi2
	mov	r1, #0
	mov	r2, r6
.L28:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	r2, r2, #4
	cmp	r3, r0
	beq	.L29
	add	r1, r1, #1
	cmp	r1, #5
	bne	.L28
	ldr	r3, [sp, #8]
	mov	r0, #1
	add	r1, sl, r3
	bl	kprintf(PLT)
	b	.L52
.L10:
	ldr	r0, [sp, #68]
	mov	r4, #0
.L24:
	mov	r2, r4, asl #2
	ldrb	r3, [r6, r2]	@ zero_extendqisi2
	add	r4, r4, #1
	cmp	r3, r0
	beq	.L25
	cmp	r4, #5
	bne	.L24
	ldr	r2, [sp, #12]
	mov	r0, #1
	add	r1, sl, r2
	bl	kprintf(PLT)
	ldr	r0, [sp, #68]
	mov	r2, r4, asl #2
.L25:
	add	r1, r6, r2
	add	r1, r1, #1
	mov	r2, #1
	bl	Reply(PLT)
	b	.L52
.L17:
	ldr	lr, [sp, #20]
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	mov	r4, #0
	add	r1, sl, lr
	mov	r0, #1
	strb	r3, [sp, #61]
	strb	r4, [sp, #60]
	bl	kprintf(PLT)
	add	r2, sp, #72
	add	r3, r2, r5, asl #2
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	mov	r1, r9
	mov	r3, r4
	mov	r2, #4
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L52
.L13:
	ldr	r3, [sp, #36]
	mov	r0, #5
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	lr, sp, #72
	add	ip, lr, r4, asl #2
	strb	r0, [ip, #-32]
	ldrb	r4, [sp, #65]	@ zero_extendqisi2
	ldr	lr, [sp, #28]
	ldrb	r3, [ip, #-32]	@ zero_extendqisi2
	mov	r2, r4
	mov	r0, #1
	add	r1, sl, lr
	strb	r4, [ip, #-31]
	bl	kprintf(PLT)
	b	.L52
.L29:
	ldr	r2, [sp, #4]
	mov	r3, #3
	add	lr, sp, #72
	add	r4, lr, r1, asl #2
	strb	r3, [sp, #60]
	add	r1, sl, r2
	mov	r0, #1
	ldrb	r2, [r4, #-31]	@ zero_extendqisi2
	bl	kprintf(PLT)
	ldrb	r0, [r4, #-32]	@ zero_extendqisi2
.L51:
	mov	ip, #0
	mov	r3, ip
	mov	r1, r9
	mov	r2, #4
	str	ip, [sp, #0]
	bl	Send(PLT)
	b	.L52
.L21:
	ldrb	r2, [sp, #66]	@ zero_extendqisi2
	mov	r3, #1
	add	lr, sp, #72
	strb	r3, [sp, #60]
	strb	r2, [sp, #61]
	add	r3, lr, r1, asl #2
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	b	.L51
.L55:
	.align	2
.L54:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	trainController(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	conductorServer, .-conductorServer
	.ident	"GCC: (GNU) 4.0.2"
