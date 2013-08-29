	.file	"sensorsTask.c"
	.text
	.align	2
	.global	switchTableInd
	.type	switchTableInd, %function
switchTableInd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #152
	sub	r3, r0, #1
	subgt	r3, r0, #135
	mov	r0, r3
	@ lr needed for prologue
	bx	lr
	.size	switchTableInd, .-switchTableInd
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"curving %d\012\000"
	.text
	.align	2
	.global	crvSwitch
	.type	crvSwitch, %function
crvSwitch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L8
	ldr	r1, .L8+4
.L7:
	add	sl, pc, sl
	mov	r2, r0
	mov	r4, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	kprintf(PLT)
	mov	r1, #34
	mov	r0, #0
	bl	putc(PLT)
	and	r1, r4, #255
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, #32
	mov	r0, #0
	bl	putc(PLT)
	mov	r0, r4
	bl	switchTableInd(PLT)
	ldr	r3, .L8+8
	mov	r1, #34
	ldr	r2, [sl, r3]
	str	r1, [r2, r0, asl #2]
	ldmfd	sp!, {r4, sl, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	.LC0(GOTOFF)
	.word	switchTable(GOT)
	.size	crvSwitch, .-crvSwitch
	.align	2
	.global	init_switch
	.type	init_switch, %function
init_switch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #0
.L11:
	add	r4, r3, #1
	mov	r0, r4
	bl	crvSwitch(PLT)
	cmp	r4, #21
	add	r0, r4, #135
	mov	r3, r4
	bgt	.L22
.L12:
	cmp	r4, #17
	add	r4, r4, #1
	ble	.L11
	bl	crvSwitch(PLT)
	cmp	r4, #21
	add	r0, r4, #135
	mov	r3, r4
	ble	.L12
.L22:
	ldmfd	sp!, {r4, pc}
	.size	init_switch, .-init_switch
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"switches straightened\012\000"
	.align	2
.LC2:
	.ascii	"starting sensor\012\000"
	.align	2
.LC3:
	.ascii	"Sensor %c%d\012\000"
	.text
	.align	2
	.global	sensorsTask
	.type	sensorsTask, %function
sensorsTask:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L48
	sub	sp, sp, #64
.L45:
	add	sl, pc, sl
	mov	r0, #2
	bl	RegisterAs(PLT)
	mov	r1, #192
	mov	r0, #0
	bl	putc(PLT)
	mov	r0, #1
	bl	WhoIs(PLT)
	mov	r3, #6
	str	r0, [sp, #12]
	strb	r3, [sp, #60]
	bl	init_switch(PLT)
	ldr	r3, .L48+4
	ldr	r1, .L48+8
	ldr	r2, [sl, r3]
	mov	ip, #144
	str	ip, [r2, #0]
	add	r1, sl, r1
	mov	r0, #1
	bl	kprintf(PLT)
	ldr	r1, .L48+12
	mov	r0, #1
	add	r1, sl, r1
	bl	kprintf(PLT)
	mov	r2, #0
	add	r1, sp, #20
	str	r1, [sp, #8]
	mov	r3, r2
.L24:
	ldr	ip, [sp, #8]
	str	r3, [r2, ip]
	add	r2, r2, #4
	cmp	r2, #40
	bne	.L24
	add	r1, sp, #60
	ldr	r9, .L48+16
	str	r1, [sp, #4]
.L25:
	mov	r0, #1
	bl	Delay(PLT)
	mov	r0, #0
	mov	r1, #133
	bl	putc(PLT)
	mov	r2, #8
	ldr	fp, [sp, #8]
	mov	r7, #65
	str	r2, [sp, #16]
.L26:
	mov	r0, #0
	bl	getc(PLT)
	ldr	r3, [fp, #0]
	ldr	ip, [sp, #16]
	mvn	r3, r3
	sub	r2, ip, #8
	and	r3, r3, r0
	and	r6, r3, #255
	and	r8, r2, #255
	mov	r4, #0
	str	r0, [fp, #0]
	b	.L27
.L30:
	cmp	r4, #7
	bgt	.L46
.L27:
	mov	r3, #128
	ands	r3, r6, r3, asr r4
	add	r5, r4, #1
	mov	r0, #1
	add	r1, sl, r9
	mov	r2, r7
	mov	r3, r5
	addeq	r4, r4, r0
	beq	.L30
	bl	kprintf(PLT)
	add	ip, r4, r8
	mov	r3, #0
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #4]
	mov	r2, #4
	mov	r4, r5
	strb	ip, [sp, #61]
	str	r3, [sp, #0]
	bl	Send(PLT)
	cmp	r4, #7
	ble	.L27
.L46:
	mov	r0, #0
	bl	getc(PLT)
	ldr	r3, [fp, #4]
	mov	r5, #0
	mvn	r3, r3
	and	r3, r3, r0
	ldr	r4, [sp, #16]
	and	r6, r3, #255
	mov	r8, r5
	str	r0, [fp, #4]
	b	.L32
.L33:
	add	r3, r4, #1
	cmp	r5, #8
	and	r4, r3, #255
	beq	.L47
.L32:
	mov	r3, #128
	ands	r3, r6, r3, asr r5
	mov	r0, #1
	add	r3, r5, #9
	add	r1, sl, r9
	add	r5, r5, #1
	mov	r2, r7
	beq	.L33
	bl	kprintf(PLT)
	mov	r3, r8
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #4]
	mov	r2, #4
	strb	r4, [sp, #61]
	str	r8, [sp, #0]
	bl	Send(PLT)
	add	r3, r4, #1
	cmp	r5, #8
	and	r4, r3, #255
	bne	.L32
.L47:
	ldr	r1, [sp, #16]
	add	r7, r7, #1
	add	r3, r1, #16
	and	r3, r3, #255
	cmp	r7, #70
	add	fp, fp, #8
	str	r3, [sp, #16]
	bne	.L26
	b	.L25
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.L45+8)
	.word	trackSize(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	sensorsTask, .-sensorsTask
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"straightening %d\012\000"
	.text
	.align	2
	.global	strSwitch
	.type	strSwitch, %function
strSwitch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L53
	ldr	r1, .L53+4
.L52:
	add	sl, pc, sl
	mov	r2, r0
	mov	r4, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	kprintf(PLT)
	mov	r1, #33
	mov	r0, #0
	bl	putc(PLT)
	and	r1, r4, #255
	mov	r0, #0
	bl	putc(PLT)
	mov	r1, #32
	mov	r0, #0
	bl	putc(PLT)
	mov	r0, r4
	bl	switchTableInd(PLT)
	ldr	r3, .L53+8
	mov	r1, #33
	ldr	r2, [sl, r3]
	str	r1, [r2, r0, asl #2]
	ldmfd	sp!, {r4, sl, pc}
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	.LC4(GOTOFF)
	.word	switchTable(GOT)
	.size	strSwitch, .-strSwitch
	.comm	distances,82944,4
	.comm	trackSize,4,4
	.comm	switchTable,88,4
	.comm	trackData,6912,4
	.ident	"GCC: (GNU) 4.0.2"
