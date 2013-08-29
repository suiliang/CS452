	.file	"nameserver.c"
	.data
	.align	2
	.type	ns_tid, %object
	.size	ns_tid, 4
ns_tid:
	.word	-1
	.text
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
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
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	ns_tid(GOT)
	.size	WhoIs, .-WhoIs
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L9
	ldr	r3, .L9+4
.L8:
	add	sl, pc, sl
	sub	sp, sp, #12
	ldr	r2, [sl, r3]
	add	r1, sp, #12
	str	r0, [r1, #-4]!
	mov	ip, #4
	ldr	r0, [r2, #0]
	add	r3, sp, #4
	mov	r2, #5
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #4]
	add	sp, sp, #12
	ldmfd	sp!, {sl, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	ns_tid(GOT)
	.size	RegisterAs, .-RegisterAs
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"nameserver got clientTid: %d, req: %d\012\015\000"
	.align	2
.LC1:
	.ascii	"collision has occured\012\000"
	.text
	.align	2
	.global	nameServer
	.type	nameServer, %function
nameServer:
	@ args = 0, pretend = 0, frame = 412
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L30
	sub	sp, sp, #412
.L26:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L30+4
	mov	r1, #0
	ldr	r2, [sl, r3]
	mov	ip, sp
	str	r0, [r2, #0]
	mov	r3, #100
.L12:
	str	r3, [ip, r1, asl #2]
	add	r1, r1, #1
	cmp	r1, #100
	bne	.L12
	ldr	r8, .L30+8
	ldr	r9, .L30+12
	add	r7, sp, #400
	add	r6, sp, #408
	add	r5, sp, #404
	str	r1, [sp, #404]
	b	.L14
.L29:
	cmp	r4, #5
	beq	.L28
	mov	r3, #3
	ldr	r0, [sp, #408]
	str	r3, [sp, #404]
.L20:
	mov	r1, r5
	mov	r2, #4
	bl	Reply(PLT)
.L14:
	mov	r1, r7
	mov	r2, #4
	mov	r0, r6
	bl	Receive(PLT)
	add	r1, sl, r8
	mov	r4, r0
	mov	r3, r0
	ldr	r2, [sp, #408]
	mov	r0, #1
	bl	bwprintf(PLT)
	cmp	r4, #4
	bne	.L29
	ldr	r3, [sp, #400]
	add	r2, sp, #412
	add	r1, r2, r3, asl #2
	ldr	r2, [r1, #-412]
	ldr	r0, [sp, #408]
	cmp	r2, #100
	moveq	r2, #2
	str	r2, [sp, #404]
	b	.L20
.L28:
	ldr	r3, [sp, #400]
	add	r2, sp, #412
	add	ip, r2, r3, asl #2
	ldr	r2, [ip, #-412]
	mov	r0, #1
	cmp	r2, #100
	add	r1, sl, r9
	bne	.L18
	ldr	r0, [sp, #408]
	mov	r3, #0
	str	r3, [sp, #404]
	str	r0, [ip, #-412]
	b	.L20
.L18:
	bl	kprintf(PLT)
	ldr	r0, [sp, #408]
	mov	r3, #1
	str	r3, [sp, #404]
	b	.L20
.L31:
	.align	2
.L30:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	ns_tid(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	nameServer, .-nameServer
	.ident	"GCC: (GNU) 4.0.2"
