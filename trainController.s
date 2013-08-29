	.file	"trainController.c"
	.text
	.align	2
	.global	trainNotifier
	.type	trainNotifier, %function
trainNotifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #8
	bl	MyParentTid(PLT)
	add	r5, sp, #8
	str	r0, [r5, #-4]!
	mov	r4, #0
.L2:
	mov	r0, #10
	bl	Delay(PLT)
	mov	r1, r5
	ldr	r0, [sp, #4]
	mov	r2, r4
	mov	r3, r4
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L2
	.size	trainNotifier, .-trainNotifier
	.align	2
	.global	pathSet
	.type	pathSet, %function
pathSet:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L16
	cmp	r0, r1
.L15:
	add	sl, pc, sl
	mov	r5, r1
	ldmeqfd	sp!, {r4, r5, r6, r7, sl, pc}
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	ldr	r6, [sl, r3]
	ldr	r7, [sl, r2]
	b	.L8
.L10:
	ldr	r3, [r4, #24]
	ldr	r0, [r3, #8]
	cmp	r5, r0
	ldmeqfd	sp!, {r4, r5, r6, r7, sl, pc}
.L8:
	add	r3, r0, r0, asl #1
	add	r4, r6, r3, asl #4
	ldr	r2, [r4, #4]
	cmp	r2, #2
	bne	.L10
	ldr	r1, [r4, #24]
	ldr	r0, [r4, #40]
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #8]
	add	r3, r3, r3, asl #3
	add	r2, r2, r2, asl #3
	add	r3, r5, r3, asl #4
	add	r2, r5, r2, asl #4
	ldr	r0, [r7, r3, asl #2]
	ldr	r1, [r7, r2, asl #2]
	cmp	r0, r1
	bge	.L12
	ldr	r0, [r4, #8]
	bl	strSwitch(PLT)
	ldr	r3, [r4, #24]
	ldr	r0, [r3, #8]
	cmp	r5, r0
	bne	.L8
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L12:
	ldr	r0, [r4, #8]
	bl	crvSwitch(PLT)
	ldr	r3, [r4, #40]
	ldr	r0, [r3, #8]
	cmp	r5, r0
	bne	.L8
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	trackData(GOT)
	.word	distances(GOT)
	.size	pathSet, .-pathSet
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"train %d is at %d\012\000"
	.align	2
.LC1:
	.ascii	"MOVING TRAIN: %d, %d\012\000"
	.align	2
.LC2:
	.ascii	"going to %s\012\000"
	.text
	.align	2
	.global	trainController
	.type	trainController, %function
trainController:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L39
	sub	sp, sp, #28
.L34:
	add	sl, pc, sl
	mov	r0, #3
	bl	WhoIs(PLT)
	mov	r4, r0
	mov	r0, #1
	bl	WhoIs(PLT)
	mov	r5, #4
	add	r3, sp, #16
	str	r0, [sp, #8]
	str	r3, [sp, #4]
	mov	r2, r5
	mov	r1, r3
	mov	ip, #1
	mov	r0, r4
	add	r3, sp, #27
	strb	r5, [sp, #16]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	fp, .L39+4
	ldr	r8, .L39+8
	ldr	r9, .L39+12
	add	r6, sp, #12
	add	r5, r5, #196
	add	r7, sp, #20
.L35:
	mov	r0, r7
	mov	r1, r6
	mov	r2, #4
	bl	Receive(PLT)
	ldr	r0, [sp, #20]
	cmp	r0, #100
	beq	.L22
	ldrb	r4, [sp, #12]	@ zero_extendqisi2
	cmp	r4, #1
	beq	.L24
.L37:
	bcc	.L23
	cmp	r4, #3
	beq	.L36
.L22:
	mov	r1, #0
	mov	r2, r1
	bl	Reply(PLT)
	mov	r0, r7
	mov	r1, r6
	mov	r2, #4
	bl	Receive(PLT)
	ldr	r0, [sp, #20]
	cmp	r0, #100
	beq	.L22
	ldrb	r4, [sp, #12]	@ zero_extendqisi2
	cmp	r4, #1
	bne	.L37
.L24:
	ldrb	r0, [sp, #13]	@ zero_extendqisi2
	bl	intolocation(PLT)
	add	r1, sl, r9
	mov	r2, r0
	mov	r0, r4
	bl	kprintf(PLT)
	mov	r0, r5
	ldrb	r1, [sp, #13]	@ zero_extendqisi2
	bl	pathSet(PLT)
	ldrb	r4, [sp, #27]	@ zero_extendqisi2
	mov	r1, #28
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, r4
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, #0
	ldr	r0, [sp, #20]
	mov	r2, r1
	bl	Reply(PLT)
	b	.L35
.L23:
	mov	r1, #0
	mov	r2, r1
	bl	Reply(PLT)
	add	r1, sl, r8
	ldrb	r2, [sp, #27]	@ zero_extendqisi2
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	mov	r0, #1
	bl	kprintf(PLT)
	ldrb	r4, [sp, #27]	@ zero_extendqisi2
	ldrb	r1, [sp, #13]	@ zero_extendqisi2
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, r4
	mov	r0, #0
	bl	putc(PLT)
	b	.L35
.L36:
	mov	r1, #0
	mov	r2, r1
	bl	Reply(PLT)
	cmp	r5, #200
	beq	.L38
.L26:
	ldrb	r4, [sp, #27]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r0
	bl	putc(PLT)
	mov	r1, r4
	mov	r0, #0
	bl	putc(PLT)
	mov	r0, #1
	add	r1, sl, fp
	ldrb	r2, [sp, #27]	@ zero_extendqisi2
	mov	r3, r5
	bl	kprintf(PLT)
	b	.L35
.L38:
	ldrb	r4, [sp, #27]	@ zero_extendqisi2
	mov	r1, #14
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, r4
	mov	r0, #0
	mov	r4, #4
	bl	putc(PLT)
	mov	ip, #5
	mov	r2, r4
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #4]
	mov	r3, r6
	strb	ip, [sp, #16]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldrb	r5, [sp, #13]	@ zero_extendqisi2
	b	.L26
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	trainController, .-trainController
	.ident	"GCC: (GNU) 4.0.2"
