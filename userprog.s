	.file	"userprog.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"CS is tid %d \012\000"
	.align	2
.LC1:
	.ascii	"NS is tid %d \012\000"
	.align	2
.LC2:
	.ascii	"COM2 get is tid %d \012\000"
	.align	2
.LC3:
	.ascii	"COM2 put is tid %d \012\000"
	.align	2
.LC4:
	.ascii	"COM1 get tid is tid %d \012\000"
	.align	2
.LC5:
	.ascii	"COM1 put is tid %d\012\000"
	.text
	.align	2
	.global	first
	.type	first, %function
first:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
	add	sl, pc, sl
	sub	sp, sp, #12
	ldr	r1, [sl, r3]
	mov	r0, #0
	bl	Create(PLT)
	add	r7, sp, #4
	add	r6, sp, #11
	mov	r4, #1
	mov	r3, r6
	mov	r1, r7
	mov	r2, #5
	mov	r5, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L4+8
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, r4
	bl	bwprintf(PLT)
	ldr	r3, .L4+12
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r3, r6
	mov	r1, r7
	mov	r2, #6
	mov	r5, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L4+16
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, r4
	bl	bwprintf(PLT)
	ldr	r3, .L4+20
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r3, r6
	mov	r1, r7
	mov	r2, #4
	mov	r5, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L4+24
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, r4
	bl	bwprintf(PLT)
	ldr	r3, .L4+28
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r3, r6
	mov	r1, r7
	mov	r2, #4
	mov	r5, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L4+32
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, r4
	bl	bwprintf(PLT)
	ldr	r3, .L4+36
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r3, r6
	mov	r1, r7
	mov	r2, #4
	mov	r5, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L4+40
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, r4
	bl	bwprintf(PLT)
	ldr	r3, .L4+44
	mov	r0, r4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L4+48
	mov	r5, r0
	add	r1, sl, r1
	mov	r0, r4
	mov	r2, r5
	bl	bwprintf(PLT)
	mov	r3, r6
	mov	r1, r7
	mov	r2, #4
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L4+52
	sub	r4, r4, #1
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	mov	r2, r4
	mov	r3, r4
	mov	r1, r4
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L4+56
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r2, r4
	mov	r3, r4
	mov	r1, r4
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L4+60
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r1, r4
	mov	r2, r4
	mov	r3, r4
	str	r4, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	clockserver(GOT)
	.word	.LC0(GOTOFF)
	.word	nameServer(GOT)
	.word	.LC1(GOTOFF)
	.word	COM2getc(GOT)
	.word	.LC2(GOTOFF)
	.word	COM2putc(GOT)
	.word	.LC3(GOTOFF)
	.word	COM1getc(GOT)
	.word	.LC4(GOTOFF)
	.word	COM1putc(GOT)
	.word	.LC5(GOTOFF)
	.word	commandLine(GOT)
	.word	conductorServer(GOT)
	.word	sensorServer(GOT)
	.size	first, .-first
	.ident	"GCC: (GNU) 4.0.2"
