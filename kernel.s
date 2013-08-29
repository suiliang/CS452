	.file	"kernel.c"
	.text
	.align	2
	.global	init_schedule
	.type	init_schedule, %function
init_schedule:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L9
	ldr	r3, .L9+4
.L7:
	add	sl, pc, sl
	ldr	r0, [sl, r3]
	ldr	r3, .L9+8
	ldr	r2, .L9+12
	ldr	ip, [sl, r3]
	ldr	r3, .L9+16
	ldr	lr, [sl, r2]
	ldr	r2, [sl, r3]
	ldr	r3, .L9+20
	mov	r1, #0
	str	r1, [r2, #0]
	ldr	r2, [sl, r3]
	add	r3, r0, #32
	str	r1, [r2, #0]
.L2:
	str	r1, [r0], #4
	cmp	r0, r3
	str	r1, [lr], #4
	str	r1, [ip], #4
	bne	.L2
	ldmfd	sp!, {sl, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	tds_exist(GOT)
	.word	tds_queue(GOT)
	.word	tds_active(GOT)
	.word	min_priority(GOT)
	.word	priorities_active(GOT)
	.size	init_schedule, .-init_schedule
	.align	2
	.global	enable_SWI
	.type	enable_SWI, %function
enable_SWI:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L14
	ldr	r3, .L14+4
.L13:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r2, #40
	@ lr needed for prologue
	str	r1, [r2, #0]
	ldmfd	sp!, {sl}
	bx	lr
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	SWI_Handler(GOT)
	.size	enable_SWI, .-enable_SWI
	.align	2
	.global	disable_IRQ
	.type	disable_IRQ, %function
disable_IRQ:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L18
	ldr	r1, .L18+4
	mov	r3, #0
	str	r3, [r2, #0]
	@ lr needed for prologue
	str	r3, [r1, #0]
	bx	lr
.L19:
	.align	2
.L18:
	.word	-2146762736
	.word	-2146697200
	.size	disable_IRQ, .-disable_IRQ
	.align	2
	.global	enable_IRQ
	.type	enable_IRQ, %function
enable_IRQ:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L27
	mov	r6, r0
	ldr	r0, .L27+4
.L26:
	add	sl, pc, sl
	ldr	r0, [sl, r0]
	mov	r7, r2
	mov	r8, r3
	mov	r5, r1
	mvn	r2, #0
	add	r3, r0, #24
.L21:
	str	r2, [r0], #4
	cmp	r3, r0
	bne	.L21
	ldr	r3, .L27+8
	mov	r4, #0
	ldr	r1, [sl, r3]
	mov	r2, #56
	str	r1, [r2, #0]
	str	r4, [r6, #12]
	str	r4, [r5, #12]
	bl	disable_IRQ(PLT)
	ldr	r1, .L27+12
	ldr	r2, .L27+16
	ldr	r0, [r2, #0]
	ldr	r3, [r1, #0]
	ldr	r2, .L27+20
	bic	r3, r3, #1
	str	r3, [r1, #0]
	ldr	r3, [sl, r2]
	str	r4, [r3, #0]
	str	r7, [r6, #16]
	str	r8, [r5, #16]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	event_waiter(GOT)
	.word	IRQ_Handler(GOT)
	.word	-2138308580
	.word	-2138308584
	.word	cts_state(GOT)
	.size	enable_IRQ, .-enable_IRQ
	.align	2
	.global	init_kernel
	.type	init_kernel, %function
init_kernel:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L42
	ldr	r3, .L42+4
.L40:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	ldr	r3, .L42+8
	mov	r7, #0
	ldr	r2, [sl, r3]
	sub	sp, sp, #4
	mov	r3, #17825792
	ldr	r5, .L42+12
	str	r3, [r1, #8]
	mov	lr, r1
	str	r1, [r2, #0]
	mvn	r4, #0
	mov	r6, r7
	str	r1, [sp, #0]
	mov	r9, #36
	mov	r8, r7
	mov	fp, r1
	mov	r3, r1
.L30:
	str	r7, [lr, #0]
	stmib	lr, {r4, r6}	@ phole stm
	str	r4, [lr, #12]
	str	r6, [lr, #16]
	str	r6, [lr, #24]
	add	r1, r8, r3
	mov	r0, r6
	add	ip, r9, fp
.L31:
	add	r0, r0, #1
	smull	r3, r2, r5, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, asl #2
	sub	r3, r0, r3, asl #1
	add	r3, ip, r3, asl #3
	cmp	r0, #10
	str	r3, [r1, #36]
	str	r4, [r1, #40]
	add	r1, r1, #8
	bne	.L31
	add	r7, r7, #1
	cmp	r7, #64
	str	ip, [lr, #120]
	str	ip, [lr, #116]
	add	r8, r8, #124
	add	r9, r9, #124
	add	lr, lr, #124
	ldrne	r3, [sp, #0]
	bne	.L30
.L41:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L43:
	.align	2
.L42:
	.word	_GLOBAL_OFFSET_TABLE_-(.L40+8)
	.word	tds(GOT)
	.word	cur_task(GOT)
	.word	1717986919
	.size	init_kernel, .-init_kernel
	.align	2
	.global	meatspin
	.type	meatspin, %function
meatspin:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
.L46:
	b	.L46
	.size	meatspin, .-meatspin
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"missed\012\000"
	.align	2
.LC1:
	.ascii	"lost2rcv\012\000"
	.text
	.align	2
	.global	C_IRQ_Handler
	.type	C_IRQ_Handler, %function
C_IRQ_Handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L128
	ldr	r7, .L128+4
.L123:
	add	sl, pc, sl
	ldr	r2, .L128+8
	ldr	r3, [sl, r7]
	ldr	lr, [r2, #0]
	ldr	ip, [r3, #0]
	cmp	lr, #0
	sub	sp, sp, #8
	str	r0, [ip, #8]
	mov	r6, r1
	bne	.L49
	add	r2, r2, #65536
	ldr	r3, [r2, #0]
	ands	r0, r3, #1048576
	bne	.L124
	ldr	r3, .L128+12
	ldr	r2, [r3, #0]
	tst	r2, #4
	bne	.L125
	ldr	r2, .L128+16
	ldr	r3, [r2, #0]
	ands	r1, r3, #16
	bne	.L115
	ldr	r8, .L128+20
	ldr	r0, [sl, r8]
	ldr	r3, [r0, #16]
	cmn	r3, #1
	beq	.L82
	ldr	r9, .L128+24
	rsb	r2, r3, r3, asl #5
	ldr	r3, [sl, r9]
	ldr	r5, .L128+28
	add	r3, r3, r2, asl #2
	ldr	r2, .L128+32
	str	r1, [r3, #12]
	ldr	r1, [r3, #8]
	ldrb	r3, [r2, #0]	@ zero_extendqisi2
	str	r5, [sp, #4]
	str	r3, [r1, #0]
	ldr	ip, [r0, #16]
	ldr	r3, [sl, r5]
	mov	r4, ip, asr #3
	ldr	r5, [r3, r4, asl #2]
	cmp	r5, #0
	bne	.L116
	ldr	r3, .L128+36
	ldr	r1, .L128+40
	ldr	r0, [sl, r3]
	mov	r3, #1
	ldr	r2, [r0, #0]
	ldr	lr, [sl, r1]
	orr	r2, r2, r3, asl r4
	str	r1, [sp, #0]
	ldr	r1, [lr, #0]
	str	r2, [r0, #0]
	cmp	r4, r1
	strlt	r4, [lr, #0]
.L84:
	and	r2, ip, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	fp, .L128+44
	ldr	r1, [sp, #4]
	ldr	r0, [sl, fp]
	ldr	ip, [sl, r1]
	ldr	r2, [r0, r4, asl #2]
	orr	r1, r5, r3
	ldr	lr, [sl, r8]
	orr	r3, r3, r2
	str	r3, [r0, r4, asl #2]
	str	r1, [ip, r4, asl #2]
	mvn	r3, #0
	ldr	r5, [sp, #0]
	ldr	r1, [sp, #4]
	str	r3, [lr, #16]
	mov	lr, r0
	b	.L67
.L49:
	ldr	r8, .L128+20
	ldr	r3, [sl, r8]
	ldr	ip, [r3, #0]
	cmn	ip, #1
	beq	.L117
	ldr	r9, .L128+24
	ldr	r5, .L128+28
	ldr	r2, [sl, r9]
	rsb	r3, ip, ip, asl #5
	add	r2, r2, r3, asl #2
	ldr	r1, [sl, r5]
	mov	r3, #0
	str	r3, [r2, #12]
	mov	r4, ip, asr #3
	str	r5, [sp, #4]
	ldr	r5, [r1, r4, asl #2]
	cmp	r5, r3
	bne	.L118
	ldr	r3, .L128+36
	ldr	r1, .L128+40
	ldr	r0, [sl, r3]
	mov	r3, #1
	ldr	r2, [r0, #0]
	ldr	lr, [sl, r1]
	orr	r2, r2, r3, asl r4
	str	r1, [sp, #0]
	ldr	r1, [lr, #0]
	str	r2, [r0, #0]
	cmp	r4, r1
	strlt	r4, [lr, #0]
.L89:
	and	r2, ip, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	fp, .L128+44
	ldr	r1, [sp, #4]
	ldr	r0, [sl, fp]
	ldr	ip, [sl, r1]
	ldr	r2, [r0, r4, asl #2]
	orr	r1, r5, r3
	ldr	lr, [sl, r8]
	orr	r3, r3, r2
	str	r3, [r0, r4, asl #2]
	mvn	r3, #0
	str	r1, [ip, r4, asl #2]
	str	r3, [lr, #0]
.L87:
	ldr	r2, .L128+48
	ldr	r0, .L128+52
	mov	r1, #0
	str	r1, [r2, #0]
	ldr	r3, [r0, #0]
	ldr	r5, [sp, #0]
	orr	r3, r3, #32
	ldr	r1, [sp, #4]
	ldr	lr, [sl, fp]
	str	r3, [r0, #0]
.L67:
	ldr	r3, [sl, r5]
	ldr	r2, [sl, r1]
	ldr	ip, [r3, #0]
	ldr	r2, [r2, ip, asl #2]
	ldr	r1, [lr, ip, asl #2]
	ands	r0, r2, r1
	rsbeq	r3, r2, #0
	rsbne	r3, r0, #0
	andeq	r3, r2, r3
	andne	r3, r0, r3
	rsbeq	r2, r3, r2
	rsbne	r2, r3, r1
	streq	r2, [lr, ip, asl #2]
	strne	r2, [lr, ip, asl #2]
	cmp	r3, #8
	ble	.L95
	cmp	r3, #32
	ble	.L97
	cmp	r3, #128
	movne	r3, #6
	moveq	r3, #7
.L101:
	add	r3, r3, ip, asl #3
	ldr	r2, [sl, r9]
	rsb	r3, r3, r3, asl #5
	ldr	ip, [sl, r7]
	add	r2, r2, r3, asl #2
	ldr	r0, [r2, #8]
	mov	r1, r6
	str	r2, [ip, #0]
	bl	Dispatch(PLT)
.L124:
	ldr	r3, .L128+56
	ldr	r1, [r3, #0]
	tst	r1, #1
	beq	.L53
	add	r3, r3, #232
	ldr	r2, [r3, #0]
	tst	r2, #1
	beq	.L53
	ldr	r3, .L128+60
	ldr	r0, [sl, r3]
	ldr	r3, [r0, #0]
	cmp	r3, #1
	movls	r3, #2
	strls	r3, [r0, #0]
	bls	.L58
	cmp	r3, #2
	ldreq	r2, .L128+52
	streq	lr, [r0, #0]
	ldreq	r3, [r2, #0]
	orreq	r3, r3, #32
	streq	r3, [r2, #0]
.L58:
	ldr	r2, .L128+56
	ldr	r3, [r2, #0]
	bic	r3, r3, #1
	str	r3, [r2, #0]
.L53:
	tst	r1, #4
	bne	.L126
.L111:
	ldr	r2, .L128+28
	ldr	r3, .L128+40
	ldr	r9, .L128+24
	ldr	fp, .L128+44
	str	r2, [sp, #4]
	str	r3, [sp, #0]
.L60:
	ldr	r3, .L128+56
	ldr	r2, [r3, #0]
	tst	r2, #2
	beq	.L120
	ldr	r2, .L128+64
	ldr	r3, [r2, #0]
	ands	r0, r3, #16
	bne	.L120
	ldr	r8, .L128+20
	ldr	r3, .L128+68
	ldr	lr, [sl, r8]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [lr, #12]
	cmn	r2, #1
	beq	.L70
	ldr	r3, [sl, r9]
	rsb	r2, r2, r2, asl #5
	add	r3, r3, r2, asl #2
	ldr	r1, [r3, #8]
	str	r0, [r3, #12]
	ldr	r5, [sp, #4]
	str	ip, [r1, #0]
	ldr	ip, [lr, #12]
	ldr	r3, [sl, r5]
	mov	lr, ip, asr #3
	ldr	r4, [r3, lr, asl #2]
	cmp	r4, #0
	beq	.L127
.L72:
	and	r3, ip, #7
	mov	r2, #1
	mov	r2, r2, asl r3
	ldr	r1, [sl, fp]
	ldr	r0, [sl, r5]
	ldr	r3, [r1, lr, asl #2]
	ldr	ip, [sl, r8]
	orr	r3, r2, r3
	orr	r2, r4, r2
	str	r3, [r1, lr, asl #2]
	str	r2, [r0, lr, asl #2]
	ldr	r5, [sp, #0]
	ldr	r1, [sp, #4]
	ldr	lr, [sl, fp]
	mvn	r3, #0
	str	r3, [ip, #12]
	b	.L67
.L118:
	ldr	r2, .L128+40
	str	r2, [sp, #0]
	b	.L89
.L117:
	ldr	r2, .L128+28
	ldr	r3, .L128+40
	ldr	r9, .L128+24
	ldr	fp, .L128+44
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	b	.L87
.L125:
	ldr	r8, .L128+20
	ldr	r1, .L128+72
	ldr	r2, [sl, r8]
	ldr	r3, [r1, #0]
	ldr	ip, [r2, #8]
	bic	r3, r3, #32
	cmn	ip, #1
	str	r3, [r1, #0]
	beq	.L113
	ldr	r9, .L128+24
	ldr	r1, .L128+28
	ldr	r3, [sl, r9]
	rsb	r2, ip, ip, asl #5
	str	r1, [sp, #4]
	add	r3, r3, r2, asl #2
	ldr	r1, [sl, r1]
	str	r0, [r3, #12]
	mov	r4, ip, asr #3
	ldr	r5, [r1, r4, asl #2]
	cmp	r5, #0
	bne	.L114
	ldr	r3, .L128+36
	ldr	r2, .L128+40
	ldr	r0, [sl, r3]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r2, [r0, #0]
	ldr	lr, [sl, r3]
	mov	r3, #1
	orr	r2, r2, r3, asl r4
	ldr	r1, [lr, #0]
	str	r2, [r0, #0]
	cmp	r4, r1
	strlt	r4, [lr, #0]
.L78:
	and	r2, ip, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	fp, .L128+44
	ldr	r2, [sp, #4]
	ldr	r0, [sl, fp]
	ldr	ip, [sl, r2]
	ldr	r2, [r0, r4, asl #2]
	orr	r1, r5, r3
	ldr	lr, [sl, r8]
	orr	r3, r3, r2
	str	r3, [r0, r4, asl #2]
	str	r1, [ip, r4, asl #2]
	mvn	r3, #0
	ldr	r5, [sp, #0]
	ldr	r1, [sp, #4]
	str	r3, [lr, #8]
	mov	lr, r0
	b	.L67
.L126:
	ldr	r8, .L128+20
	ldr	r1, .L128+52
	ldr	r2, [sl, r8]
	ldr	r3, [r1, #0]
	ldr	ip, [r2, #4]
	bic	r3, r3, #32
	cmn	ip, #1
	str	r3, [r1, #0]
	beq	.L110
	ldr	r3, .L128+64
	ldr	r2, [r3, #0]
	tst	r2, #1
	beq	.L111
	ldr	r9, .L128+24
	rsb	r3, ip, ip, asl #5
	ldr	r1, [sl, r9]
	ldr	r2, .L128+28
	add	r1, r1, r3, asl #2
	ldr	r3, .L128+60
	ldr	r0, [sl, r2]
	str	r2, [sp, #4]
	ldr	r2, [sl, r3]
	mov	lr, #1
	mov	r3, #0
	str	lr, [r2, #0]
	mov	r4, ip, asr #3
	str	r3, [r1, #12]
	ldr	r5, [r0, r4, asl #2]
	cmp	r5, r3
	bne	.L112
	ldr	r3, .L128+40
	str	r3, [sp, #0]
	ldr	r3, .L128+36
	ldr	r2, [sp, #0]
	ldr	r1, [sl, r3]
	ldr	r0, [sl, r2]
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	orr	r3, r3, lr, asl r4
	cmp	r4, r2
	str	r3, [r1, #0]
	strlt	r4, [r0, #0]
.L64:
	and	r2, ip, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	fp, .L128+44
	ldr	r1, [sp, #4]
	ldr	r0, [sl, fp]
	ldr	ip, [sl, r1]
	ldr	r2, [r0, r4, asl #2]
	orr	r1, r5, r3
	ldr	lr, [sl, r8]
	orr	r3, r3, r2
	str	r3, [r0, r4, asl #2]
	mvn	r3, #0
	str	r1, [ip, r4, asl #2]
	str	r3, [lr, #4]
	b	.L60
.L95:
	cmp	r3, #2
	suble	r3, r3, #1
	ble	.L101
	cmp	r3, #8
	movne	r3, #2
	moveq	r3, #3
	b	.L101
.L97:
	moveq	r3, #5
	movne	r3, #4
	b	.L101
.L120:
	ldr	r5, [sp, #0]
	ldr	r1, [sp, #4]
	ldr	lr, [sl, fp]
	b	.L67
.L82:
	ldr	r1, .L128+76
	ldr	r3, .L128+32
	add	r1, sl, r1
	mov	r0, #1
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	bl	bwprintf(PLT)
.L115:
	ldr	fp, .L128+44
	ldr	r2, .L128+28
	ldr	r3, .L128+40
	ldr	r9, .L128+24
	ldr	lr, [sl, fp]
	mov	r5, r3
	mov	r1, r2
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	b	.L67
.L114:
	ldr	r1, .L128+40
	str	r1, [sp, #0]
	b	.L78
.L116:
	ldr	r2, .L128+40
	str	r2, [sp, #0]
	b	.L84
.L127:
	ldr	r3, .L128+36
	ldr	r1, [sp, #0]
	ldr	r0, [sl, r3]
	mov	r3, #1
	ldr	r2, [r0, #0]
	ldr	r5, [sl, r1]
	orr	r2, r2, r3, asl lr
	ldr	r1, [r5, #0]
	str	r2, [r0, #0]
	cmp	lr, r1
	strlt	lr, [r5, #0]
	ldrge	r5, [sp, #4]
	ldrlt	r5, [sp, #4]
	b	.L72
.L113:
	ldr	r5, .L128+28
	ldr	r1, .L128+40
	ldr	fp, .L128+44
	stmia	sp, {r1, r5}	@ phole stm
	mov	r5, r1
	ldr	r9, .L128+24
	ldr	r1, [sp, #4]
	ldr	lr, [sl, fp]
	b	.L67
.L110:
	ldr	r5, .L128+28
	ldr	r1, .L128+40
	ldr	r9, .L128+24
	ldr	fp, .L128+44
	stmia	sp, {r1, r5}	@ phole stm
	b	.L60
.L112:
	ldr	r3, .L128+40
	str	r3, [sp, #0]
	b	.L64
.L70:
	ldr	r1, .L128+80
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r5, [sp, #0]
	ldr	r1, [sp, #4]
	ldr	lr, [sl, fp]
	b	.L67
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L123+8)
	.word	cur_task(GOT)
	.word	-2146762752
	.word	-2138243044
	.word	-2138243048
	.word	event_waiter(GOT)
	.word	tds(GOT)
	.word	tds_active(GOT)
	.word	-2138243072
	.word	priorities_active(GOT)
	.word	min_priority(GOT)
	.word	tds_queue(GOT)
	.word	-2139029460
	.word	-2138308588
	.word	-2138308580
	.word	cts_state(GOT)
	.word	-2138308584
	.word	-2138308608
	.word	-2138243052
	.word	.LC1(GOTOFF)
	.word	.LC0(GOTOFF)
	.size	C_IRQ_Handler, .-C_IRQ_Handler
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"invalid priority: %d\012\000"
	.text
	.align	2
	.global	kernel
	.type	kernel, %function
kernel:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L303
	ldr	r9, .L303+4
.L294:
	add	sl, pc, sl
	ldr	r2, [sl, r9]
	ldr	r3, [r0, #0]
	ldr	r5, [r2, #0]
	ldr	ip, [r0, #4]
	sub	sp, sp, #24
	sub	r3, r3, #1
	str	r1, [sp, #16]
	str	ip, [r5, #8]
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L277
	.p2align 2
.L140:
	b	.L132
	b	.L277
	b	.L133
	b	.L134
	b	.L135
	b	.L136
	b	.L137
	b	.L138
	b	.L139
.L132:
	ldr	lr, [r0, #8]
	ldr	r8, [r0, #12]
	cmp	lr, #7
	bgt	.L297
	ldr	r4, .L303+8
	ldr	r3, [sl, r4]
	ldr	r2, [r3, lr, asl #2]
	add	r1, r2, #1
	mvn	r2, r2
	and	r2, r2, r1
	cmp	r2, #8
	ble	.L143
	cmp	r2, #32
	ble	.L145
	cmp	r2, #128
	movne	r2, #6
	moveq	r2, #7
.L149:
	add	r7, r2, lr, asl #3
	and	r3, r7, #7
	mov	lr, #1
	mov	r0, lr, asl r3
	ldr	r2, [sl, r4]
	mov	r6, r7, asr #3
	ldr	r3, [r2, r6, asl #2]
	cmn	r7, #1
	orr	r3, r0, r3
	str	r3, [r2, r6, asl #2]
	beq	.L298
	ldr	r3, .L303+12
	str	r3, [sp, #8]
	ldr	r3, [sl, r3]
	ldr	ip, [r3, r6, asl #2]
	cmp	ip, #0
	bne	.L278
	ldr	r3, .L303+16
	ldr	r4, .L303+20
	ldr	r1, [sl, r3]
	str	r4, [sp, #12]
	ldr	r3, [r1, #0]
	ldr	r4, [sl, r4]
	orr	r3, r3, lr, asl r6
	ldr	r2, [r4, #0]
	str	r3, [r1, #0]
	cmp	r6, r2
	strlt	r6, [r4, #0]
.L158:
	ldr	r2, .L303+24
	ldr	r3, .L303+28
	ldr	lr, [sl, r2]
	ldr	r1, [sp, #8]
	str	r2, [sp, #0]
	ldr	r2, [lr, r6, asl #2]
	ldr	r4, [sl, r1]
	str	r3, [sp, #4]
	ldr	r1, [sl, r3]
	mov	r3, r7, asl #16
	orr	r2, r0, r2
	rsb	r3, r3, #17825792
	orr	r0, r0, ip
	rsb	ip, r7, r7, asl #5
	str	r0, [r4, r6, asl #2]
	str	r2, [lr, r6, asl #2]
	add	r1, r1, ip, asl #2
	str	r8, [r3], #-56
	str	r3, [r1, #8]
	ldr	r0, [r5, #8]
	ldr	r3, [r5, #0]
	mov	r2, #0
	str	r3, [r1, #4]
	str	r2, [r1, #12]
	ldr	r4, [sp, #8]
	str	r7, [r0, #0]
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #0]
	b	.L131
.L139:
	ldr	r0, [r0, #8]
	mov	ip, #1
	cmp	r0, #2
	ldreq	r2, .L303+32
	mov	lr, #4
	ldreq	r3, [r2, #0]
	orreq	r3, r3, #32
	streq	r3, [r2, #0]
	ldr	r3, .L303+36
	ldr	r1, [r5, #0]
	ldr	r2, [sl, r3]
	str	r1, [r2, r0, asl #2]
	ldr	r0, [r5, #0]
	ldr	r1, .L303+12
	and	r2, r0, #7
	mov	r2, ip, asl r2
	str	r1, [sp, #8]
	ldr	r1, [sl, r1]
	str	lr, [r5, #12]
	mov	r0, r0, asr #3
	ldr	r3, [r1, r0, asl #2]
	mvn	r2, r2
	and	r3, r3, r2
	cmp	r3, #0
	str	r3, [r1, r0, asl #2]
	bne	.L283
	mov	r3, ip, asl r0
	ldr	r2, .L303+16
	mvn	r3, r3
	ldr	r0, [sl, r2]
	ldr	r1, [r0, #0]
	and	r3, r3, r1
	rsb	r2, r3, #0
	and	r2, r3, r2
	cmp	r2, #8
	str	r3, [r0, #0]
	ble	.L247
	cmp	r2, #32
	ble	.L249
	cmp	r2, #128
	movne	r2, #6
	moveq	r2, #7
.L253:
	ldr	r3, .L303+20
	ldr	r4, .L303+24
	ldr	r0, .L303+28
	str	r3, [sp, #12]
	str	r4, [sp, #0]
	ldr	r3, [sl, r3]
	str	r0, [sp, #4]
	ldr	r1, [sp, #12]
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	str	r2, [r3, #0]
	b	.L131
.L138:
	ldr	r6, [r0, #8]
	ldr	r1, [r0, #16]
	cmp	r6, #63
	str	r1, [sp, #20]
	ldr	fp, [r0, #12]
	bls	.L227
	ldr	r2, .L303+12
	ldr	r3, .L303+20
	ldr	r4, .L303+24
	ldr	r0, .L303+28
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	str	r4, [sp, #0]
	str	r0, [sp, #4]
	mvn	ip, #0
.L229:
	ldr	r3, [r5, #8]
	ldr	r1, [sp, #12]
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	str	ip, [r3, #0]
.L131:
	ldr	r3, [sl, r1]
	ldr	lr, [sl, r0]
	ldr	ip, [r3, #0]
	ldr	r2, [sl, r4]
	ldr	r1, [lr, ip, asl #2]
	ldr	r2, [r2, ip, asl #2]
	ands	r0, r2, r1
	rsbeq	r3, r2, #0
	rsbne	r3, r0, #0
	andeq	r3, r2, r3
	andne	r3, r0, r3
	rsbeq	r2, r3, r2
	rsbne	r2, r3, r1
	streq	r2, [lr, ip, asl #2]
	strne	r2, [lr, ip, asl #2]
	cmp	r3, #8
	ble	.L263
	cmp	r3, #32
	ble	.L265
	cmp	r3, #128
	movne	r3, #6
	moveq	r3, #7
.L269:
	ldr	r1, [sp, #4]
	add	r3, r3, ip, asl #3
	ldr	r2, [sl, r1]
	rsb	r3, r3, r3, asl #5
	ldr	ip, [sl, r9]
	add	r2, r2, r3, asl #2
	ldr	r0, [r2, #8]
	ldr	r1, [sp, #16]
	str	r2, [ip, #0]
	bl	Dispatch(PLT)
.L137:
	ldr	ip, [r5, #116]
	ldr	lr, [r0, #16]
	ldr	r4, [ip, #4]
	ldr	r8, [r0, #8]
	cmn	r4, #1
	ldr	r6, [r0, #12]
	beq	.L299
	ldr	r0, .L303+28
	mov	r7, r4, asl #5
	ldr	r1, [sl, r0]
	rsb	r3, r4, r7
	add	r1, r1, r3, asl #2
	ldr	r2, [r1, #20]
	mov	r3, #1
	cmp	lr, r2
	movge	lr, r2
	cmp	lr, #0
	str	r3, [r1, #12]
	str	r0, [sp, #4]
	moveq	r1, r0
	beq	.L224
	ldr	r3, [r1, #16]
	mov	r0, #0
.L226:
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	strb	r2, [r6, r0]
	ldr	r3, [r1, #16]
	add	r0, r0, #1
	add	r3, r3, #1
	cmp	lr, r0
	str	r3, [r1, #16]
	bne	.L226
	ldr	ip, [r5, #116]
	ldr	r1, [sp, #4]
.L224:
	str	r4, [r8, #0]
	rsb	r2, r4, r7
	ldr	r3, [sl, r1]
	ldr	r4, .L303+12
	add	r3, r3, r2, asl #2
	str	r4, [sp, #8]
	ldr	r4, .L303+24
	ldr	r1, [r3, #20]
	ldr	r0, .L303+20
	ldr	r3, [r5, #8]
	str	r4, [sp, #0]
	str	r1, [r3, #0]
	ldr	r2, [ip, #0]
	str	r0, [sp, #12]
	mov	r1, r0
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	mvn	r3, #0
	str	r2, [r5, #116]
	str	r3, [ip, #4]
	b	.L131
.L136:
	ldr	lr, [r0, #8]
	ldr	r4, [r0, #24]
	cmp	lr, #63
	ldr	r7, [r0, #12]
	ldr	fp, [r0, #16]
	ldr	r6, [r0, #20]
	bls	.L178
	ldr	r3, .L303+20
	ldr	r4, .L303+24
	ldr	r0, .L303+28
	ldr	r2, .L303+12
	str	r3, [sp, #12]
	str	r4, [sp, #0]
	str	r0, [sp, #4]
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #0]
	mvn	r3, #0
	mov	r4, r2
	str	r2, [sp, #8]
	str	r3, [ip, #0]
	b	.L131
.L135:
	ldr	r3, [r5, #0]
.L296:
	ldr	r2, .L303+12
	ldr	r4, .L303+20
	ldr	r1, .L303+28
	str	r2, [sp, #8]
	str	r4, [sp, #12]
	ldr	r0, .L303+24
	str	r1, [sp, #4]
	mov	r1, r4
	ldr	r4, [sp, #8]
	str	r0, [sp, #0]
	str	r3, [ip, #0]
	b	.L131
.L133:
	ldr	r0, [r5, #0]
	mov	r4, #1
	and	r1, r0, #7
	mov	r1, r4, asl r1
	ldr	r2, .L303+12
	ldr	r3, .L303+8
	ldr	lr, [sl, r2]
	mov	r0, r0, asr #3
	ldr	ip, [sl, r3]
	str	r2, [sp, #8]
	ldr	r2, [lr, r0, asl #2]
	mvn	r1, r1
	ldr	r3, [ip, r0, asl #2]
	and	r2, r1, r2
	and	r3, r3, r1
	cmp	r2, #0
	str	r3, [ip, r0, asl #2]
	str	r2, [lr, r0, asl #2]
	bne	.L279
	mov	r3, r4, asl r0
	ldr	r2, .L303+16
	mvn	r3, r3
	ldr	r0, [sl, r2]
	ldr	r1, [r0, #0]
	and	r3, r3, r1
	rsb	r2, r3, #0
	and	r2, r3, r2
	cmp	r2, #8
	str	r3, [r0, #0]
	ble	.L163
	cmp	r2, #32
	ble	.L165
	cmp	r2, #128
	movne	r2, #6
	moveq	r2, #7
.L169:
	ldr	r3, .L303+20
	str	r3, [sp, #12]
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	b	.L161
.L277:
	ldr	r1, .L303+12
	ldr	r4, .L303+28
	str	r1, [sp, #8]
	ldr	r2, .L303+20
	ldr	r3, .L303+24
	str	r4, [sp, #4]
	ldr	r4, [sp, #8]
	mov	r1, r2
	mov	r0, r3
	str	r2, [sp, #12]
	str	r3, [sp, #0]
	b	.L131
.L134:
	ldr	r3, [r5, #4]
	b	.L296
.L263:
	cmp	r3, #2
	suble	r3, r3, #1
	ble	.L269
	cmp	r3, #8
	movne	r3, #2
	moveq	r3, #3
	b	.L269
.L265:
	moveq	r3, #5
	movne	r3, #4
	b	.L269
.L227:
	ldr	r1, .L303+28
	mov	r8, r6, asl #5
	ldr	r2, [sl, r1]
	rsb	r3, r6, r8
	str	r1, [sp, #4]
	add	r1, r2, r3, asl #2
	ldr	r0, [r1, #12]
	cmn	r0, #1
	beq	.L300
	cmp	r0, #1
	beq	.L232
	ldr	r0, .L303+12
	ldr	r1, .L303+20
	ldr	r2, .L303+24
	mvn	ip, #2
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	str	r2, [sp, #0]
	b	.L229
.L283:
	ldr	r4, .L303+24
	ldr	r0, .L303+28
	ldr	r3, .L303+20
	str	r4, [sp, #0]
	str	r0, [sp, #4]
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	mov	r1, r3
	str	r3, [sp, #12]
	b	.L131
.L279:
	ldr	r4, .L303+20
	str	r4, [sp, #12]
.L161:
	mov	r3, #0
	mvn	r2, #0
	stmib	r5, {r2, r3}	@ phole stm
	str	r2, [r5, #12]
	str	r3, [r5, #16]
	str	r3, [r5, #24]
	mov	r1, r5
.L176:
	add	r3, r3, #1
	cmp	r3, #10
	str	r2, [r1, #40]
	add	r1, r1, #8
	bne	.L176
	ldr	r1, .L303+28
	ldr	r0, .L303+24
	str	r1, [sp, #4]
	ldr	r4, [sp, #8]
	ldr	r1, [sp, #12]
	add	ip, r5, #36
	str	r0, [sp, #0]
	str	ip, [r5, #120]
	str	ip, [r5, #116]
	b	.L131
.L178:
	ldr	r1, .L303+28
	mov	r8, lr, asl #5
	ldr	r3, [sl, r1]
	rsb	r2, lr, r8
	add	r3, r3, r2, asl #2
	str	r1, [sp, #4]
	ldr	r1, [r3, #12]
	cmn	r1, #1
	beq	.L301
	ldr	r1, [r5, #0]
	mov	ip, #1
	and	r2, r1, #7
	mov	r2, ip, asl r2
	ldr	r0, .L303+12
	str	r4, [r5, #28]
	str	r0, [sp, #8]
	ldr	r0, [sl, r0]
	mov	r1, r1, asr #3
	ldr	r3, [r0, r1, asl #2]
	mvn	r2, r2
	and	r3, r3, r2
	cmp	r3, #0
	str	r6, [r5, #24]
	str	r3, [r0, r1, asl #2]
	bne	.L280
	mov	r3, ip, asl r1
	ldr	r2, .L303+16
	mvn	r3, r3
	ldr	r0, [sl, r2]
	ldr	r1, [r0, #0]
	and	r3, r3, r1
	rsb	r2, r3, #0
	and	r2, r3, r2
	cmp	r2, #8
	str	r3, [r0, #0]
	ble	.L184
	cmp	r2, #32
	ble	.L186
	cmp	r2, #128
	movne	r2, #6
	moveq	r2, #7
.L190:
	ldr	r4, .L303+20
	ldr	r3, [sl, r4]
	str	r4, [sp, #12]
	str	r2, [r3, #0]
.L182:
	ldr	r1, [sp, #4]
	rsb	r2, lr, r8
	ldr	r3, [sl, r1]
	add	ip, r3, r2, asl #2
	ldr	r1, [ip, #12]
	cmp	r1, #3
	beq	.L302
	ldr	r3, .L303+24
	ldr	r1, [ip, #120]
	ldr	r0, [r5, #0]
	str	r3, [sp, #0]
	mov	r3, #2
	ldr	r2, [r1, #0]
	str	r3, [r5, #12]
	str	fp, [r5, #20]
	ldr	r4, [sp, #8]
	str	r0, [r1, #4]
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #0]
	str	r2, [ip, #120]
	str	r7, [r5, #16]
	b	.L131
.L143:
	cmp	r2, #2
	suble	r2, r2, #1
	ble	.L149
	cmp	r2, #8
	movne	r2, #2
	moveq	r2, #3
	b	.L149
.L163:
	cmp	r2, #2
	suble	r2, r2, #1
	ble	.L169
	cmp	r2, #8
	movne	r2, #2
	moveq	r2, #3
	b	.L169
.L247:
	cmp	r2, #2
	suble	r2, r2, #1
	ble	.L253
	cmp	r2, #8
	movne	r2, #2
	moveq	r2, #3
	b	.L253
.L301:
	ldr	r3, .L303+20
	ldr	r4, .L303+24
	ldr	r2, .L303+12
	str	r3, [sp, #12]
	str	r4, [sp, #0]
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #0]
	mvn	r3, #1
	mov	r4, r2
	str	r2, [sp, #8]
	str	r3, [ip, #0]
	b	.L131
.L300:
	ldr	r2, .L303+12
	ldr	r3, .L303+20
	ldr	r4, .L303+24
	mvn	ip, #1
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	str	r4, [sp, #0]
	b	.L229
.L297:
	ldr	r1, .L303+40
	mov	r2, lr
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, [sl, r9]
	ldr	r1, .L303+20
	ldr	r2, [r3, #0]
	str	r1, [sp, #12]
	ldr	r3, .L303+28
	ldr	r1, [r2, #8]
	ldr	r2, .L303+24
	ldr	r0, .L303+12
	stmia	sp, {r2, r3}	@ phole stm
	mvn	r3, #0
	str	r0, [sp, #8]
	str	r3, [r1, #0]
	mov	r4, r0
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #0]
	b	.L131
.L299:
	ldr	r1, [r5, #0]
	mov	r3, #3
	and	r2, r1, #7
	mov	ip, #1
	mov	r1, r1, asr r3
	mov	r2, ip, asl r2
	ldr	r4, .L303+12
	str	lr, [r5, #28]
	ldr	r0, [sl, r4]
	str	r3, [r5, #12]
	ldr	r3, [r0, r1, asl #2]
	mvn	r2, r2
	and	r3, r3, r2
	cmp	r3, #0
	str	r4, [sp, #8]
	str	r6, [r5, #24]
	str	r8, [r5, #32]
	str	r3, [r0, r1, asl #2]
	bne	.L281
	mov	r3, ip, asl r1
	ldr	r2, .L303+16
	mvn	r3, r3
	ldr	r0, [sl, r2]
	ldr	r1, [r0, #0]
	and	r3, r3, r1
	rsb	r2, r3, #0
	and	r2, r3, r2
	cmp	r2, #8
	str	r3, [r0, #0]
	ble	.L209
	cmp	r2, #32
	ble	.L211
	cmp	r2, #128
	movne	r2, #6
	moveq	r2, #7
.L215:
	ldr	r1, .L303+24
	ldr	r0, .L303+20
	ldr	r4, .L303+28
	str	r1, [sp, #0]
	ldr	r3, [sl, r0]
	str	r0, [sp, #12]
	str	r4, [sp, #4]
	mov	r1, r0
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	str	r2, [r3, #0]
	b	.L131
.L278:
	ldr	r1, .L303+20
	str	r1, [sp, #12]
	b	.L158
.L298:
	ldr	r1, .L303+24
	ldr	r0, .L303+20
	str	r1, [sp, #0]
	ldr	r4, .L303+12
	str	r0, [sp, #12]
	ldr	r2, .L303+28
	mov	r1, r0
	ldr	r0, [sp, #0]
	mvn	r3, #1
	stmib	sp, {r2, r4}	@ phole stm
	str	r3, [ip, #0]
	b	.L131
.L280:
	ldr	r0, .L303+20
	str	r0, [sp, #12]
	b	.L182
.L145:
	moveq	r2, #5
	movne	r2, #4
	b	.L149
.L281:
	ldr	r1, .L303+24
	ldr	r0, .L303+20
	str	r1, [sp, #0]
	str	r0, [sp, #12]
	ldr	r2, .L303+28
	mov	r1, r0
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	str	r2, [sp, #4]
	b	.L131
.L249:
	moveq	r2, #5
	movne	r2, lr
	b	.L253
.L165:
	moveq	r2, #5
	movne	r2, #4
	b	.L169
.L302:
	ldr	r2, [ip, #28]
	mov	r3, #1
	cmp	fp, r2
	movlt	r2, fp
	str	r3, [r5, #12]
	sub	r3, r2, #1
	strlt	fp, [ip, #28]
	cmn	r3, #1
	str	r3, [ip, #28]
	beq	.L201
	ldr	r3, [ip, #24]
	mov	r0, ip
.L202:
	ldrb	r1, [r7], #1	@ zero_extendqisi2
	strb	r1, [r3, #0]
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #24]
	sub	r2, r2, #1
	add	r3, r3, #1
	cmn	r2, #1
	str	r3, [r0, #24]
	str	r2, [r0, #28]
	bne	.L202
.L201:
	ldr	r3, [sp, #4]
	ldr	r0, [r5, #0]
	ldr	r2, [sl, r3]
	rsb	r3, lr, r8
	add	r2, r2, r3, asl #2
	ldr	r3, [r2, #32]
	ldr	r4, [sp, #8]
	ldr	r1, [r2, #8]
	str	r0, [r3, #0]
	ldr	ip, [sl, r4]
	mov	r3, #0
	str	fp, [r1, #0]
	mov	r4, lr, asr #3
	str	r3, [r2, #12]
	ldr	r5, [ip, r4, asl #2]
	cmp	r5, r3
	bne	.L203
	ldr	r3, .L303+16
	ldr	r1, [sp, #12]
	ldr	r0, [sl, r3]
	mov	r3, #1
	ldr	r2, [r0, #0]
	ldr	ip, [sl, r1]
	orr	r2, r2, r3, asl r4
	ldr	r1, [ip, #0]
	str	r2, [r0, #0]
	cmp	r4, r1
	strlt	r4, [ip, #0]
.L203:
	and	r2, lr, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r0, [sp, #8]
	ldr	r2, .L303+24
	ldr	ip, [sl, r0]
	ldr	r0, [sl, r2]
	str	r2, [sp, #0]
	ldr	r1, [r0, r4, asl #2]
	orr	r2, r5, r3
	orr	r3, r3, r1
	str	r3, [r0, r4, asl #2]
	str	r2, [ip, r4, asl #2]
	ldr	r1, [sp, #12]
	ldr	r4, [sp, #8]
	ldr	r0, [sp, #0]
	b	.L131
.L232:
	ldr	r3, .L303+12
	mov	r7, r6, asr #3
	ldr	r2, [sl, r3]
	str	r3, [sp, #8]
	mov	r3, #0
	str	r3, [r1, #12]
	ldr	ip, [r2, r7, asl #2]
	cmp	ip, r3
	bne	.L282
	ldr	r3, .L303+16
	ldr	r4, .L303+20
	ldr	r1, [sl, r3]
	ldr	lr, [sl, r4]
	ldr	r3, [r1, #0]
	ldr	r2, [lr, #0]
	orr	r3, r3, r0, asl r7
	cmp	r7, r2
	str	r4, [sp, #12]
	str	r3, [r1, #0]
	strlt	r7, [lr, #0]
.L234:
	and	r2, r6, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	ldr	r1, .L303+24
	ldr	r2, [sp, #8]
	ldr	r0, [sl, r1]
	str	r1, [sp, #0]
	ldr	r1, [sp, #4]
	ldr	r4, [sl, r2]
	ldr	r2, [r0, r7, asl #2]
	ldr	lr, [sl, r1]
	orr	ip, ip, r3
	rsb	r1, r6, r8
	orr	r3, r3, r2
	str	ip, [r4, r7, asl #2]
	str	r3, [r0, r7, asl #2]
	add	r2, lr, r1, asl #2
	ldr	r3, [r2, #28]
	ldr	r4, [sp, #20]
	cmp	r4, r3
	mvngt	ip, #3
	bgt	.L239
	ldrlt	r0, [sp, #20]
	mov	ip, #0
	strlt	r0, [r2, #28]
.L239:
	ldr	r2, [sp, #4]
	ldr	r1, [sl, r2]
	rsb	r2, r6, r8
	add	r2, r1, r2, asl #2
	ldr	r3, [r2, #28]
	sub	r3, r3, #1
	cmn	r3, #1
	str	r3, [r2, #28]
	beq	.L242
	ldr	r3, [r2, #24]
	mov	r0, r2
.L243:
	ldrb	r1, [fp], #1	@ zero_extendqisi2
	strb	r1, [r3, #0]
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #24]
	sub	r2, r2, #1
	add	r3, r3, #1
	cmn	r2, #1
	str	r3, [r0, #24]
	str	r2, [r0, #28]
	bne	.L243
.L242:
	ldr	r4, [sp, #4]
	rsb	r2, r6, r8
	ldr	r3, [sl, r4]
	ldr	r0, [sp, #20]
	add	r3, r3, r2, asl #2
	ldr	r1, [r3, #8]
	str	r0, [r1, #0]
	b	.L229
.L184:
	cmp	r2, #2
	suble	r2, r2, #1
	ble	.L190
	cmp	r2, #8
	movne	r2, #2
	moveq	r2, #3
	b	.L190
.L209:
	cmp	r2, #2
	suble	r2, r2, #1
	ble	.L215
	cmp	r2, #8
	movne	r2, #2
	moveq	r2, #3
	b	.L215
.L282:
	ldr	r0, .L303+20
	str	r0, [sp, #12]
	b	.L234
.L186:
	moveq	r2, #5
	movne	r2, #4
	b	.L190
.L211:
	moveq	r2, #5
	movne	r2, #4
	b	.L215
.L304:
	.align	2
.L303:
	.word	_GLOBAL_OFFSET_TABLE_-(.L294+8)
	.word	cur_task(GOT)
	.word	tds_exist(GOT)
	.word	tds_active(GOT)
	.word	priorities_active(GOT)
	.word	min_priority(GOT)
	.word	tds_queue(GOT)
	.word	tds(GOT)
	.word	-2138243052
	.word	event_waiter(GOT)
	.word	.LC2(GOTOFF)
	.size	kernel, .-kernel
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"enabling IRQ and starting first task\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L357
	ldr	r3, .L357+4
.L349:
	add	sl, pc, sl
	ldr	r4, [sl, r3]
	sub	sp, sp, #8
	str	r0, [sp, #4]
	mov	r0, r4
	bl	init_tracka(PLT)
	ldr	r3, .L357+8
	mov	r1, r4
	ldr	r0, [sl, r3]
	bl	init_distance(PLT)
	bl	init_kernel(PLT)
	bl	init_schedule(PLT)
	bl	enable_SWI(PLT)
	mov	r0, #0
	mov	r1, #2400
	mov	r2, #25
	bl	init_uart(PLT)
	mov	r0, #1
	ldr	r1, .L357+12
	mov	r2, #17
	bl	init_uart(PLT)
	ldr	r2, .L357+16
	ldr	r0, .L357+20
	mov	r1, #200
	bl	start_clock(PLT)
	ldr	r1, .L357+24
	ldr	r9, .L357+28
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r2, [sl, r9]
	ldr	r3, [r2, #0]
	add	r1, r3, #1
	mvn	r3, r3
	and	r1, r3, r1
	cmp	r1, #8
	ble	.L306
	cmp	r1, #32
	bgt	.L350
	moveq	r2, #0
	streq	r2, [sp, #0]
	movne	r3, #0
	moveq	r7, #5
	movne	r7, #4
	ldreq	lr, [sp, #0]
	moveq	r2, r7
	strne	r3, [sp, #0]
	movne	r2, r7
	movne	lr, r3
.L312:
	mov	r0, #1
	mov	r6, r0, asl r2
	ldr	r2, [sl, r9]
	cmn	r7, #1
	ldr	r3, [r2, lr, asl #2]
	orr	r3, r6, r3
	str	r3, [r2, lr, asl #2]
	beq	.L351
.L319:
	ldr	r4, .L357+32
	ldr	r3, [sl, r4]
	ldr	r8, [r3, lr, asl #2]
	cmp	r8, #0
	movne	r0, lr
	movne	r4, r3
	beq	.L352
.L322:
	ldr	r3, .L357+36
	ldr	fp, .L357+40
	ldr	lr, [sl, r3]
	ldr	r3, .L357+44
	ldr	r2, [lr, r0, asl #2]
	ldr	ip, [sl, r3]
	rsb	r0, r7, r7, asl #5
	add	ip, ip, r0, asl #2
	ldr	r0, [sp, #0]
	orr	r3, r6, r8
	str	r3, [r4, r0, asl #2]
	ldr	r3, .L357+48
	orr	r2, r6, r2
	ldr	r5, [sl, fp]
	str	r2, [lr, r0, asl #2]
	mov	r1, r7, asl #16
	ldr	r2, [sl, r3]
	rsb	r1, r1, #17825792
	ldr	r0, [r5, #0]
	str	r1, [ip, #8]
	str	r2, [r1], #-56
	ldr	r3, [r0, #0]
	str	r1, [ip, #8]
	ldr	lr, [r0, #8]
	str	r3, [ip, #4]
	mov	r2, #0
	ldr	r3, [sl, r9]
	str	r2, [ip, #12]
	str	r7, [lr, #0]
	ldr	r2, [r3, #28]
	add	r1, r2, #1
	mvn	r2, r2
	and	r1, r2, r1
	cmp	r1, #8
	ble	.L325
.L356:
	cmp	r1, #32
	bgt	.L353
	moveq	r7, #61
	movne	r7, #60
.L331:
	and	r3, r7, #7
	mov	r0, #1
	mov	r8, r0, asl r3
	ldr	r2, [sl, r9]
	mov	r6, r7, asr #3
	ldr	r3, [r2, r6, asl #2]
	cmn	r7, #1
	orr	r3, r8, r3
	str	r3, [r2, r6, asl #2]
	beq	.L354
	ldr	r4, .L357+32
	ldr	r3, [sl, r4]
	ldr	r9, [r3, r6, asl #2]
	cmp	r9, #0
	movne	r4, r3
	beq	.L355
.L341:
	ldr	r3, .L357+36
	rsb	r0, r7, r7, asl #5
	ldr	lr, [sl, r3]
	ldr	r3, .L357+44
	ldr	r2, [lr, r6, asl #2]
	ldr	ip, [sl, r3]
	orr	r3, r8, r9
	str	r3, [r4, r6, asl #2]
	ldr	r3, .L357+52
	orr	r2, r8, r2
	str	r2, [lr, r6, asl #2]
	mov	r1, r7, asl #16
	ldr	r2, [sl, r3]
	ldr	r5, [sl, fp]
	add	ip, ip, r0, asl #2
	rsb	r1, r1, #17825792
	str	r1, [ip, #8]
	ldr	r0, [r5, #0]
	str	r2, [r1], #-56
	str	r1, [ip, #8]
	ldr	r3, [r0, #0]
	ldr	lr, [r0, #8]
	mov	r2, #0
	str	r3, [ip, #4]
	str	r2, [ip, #12]
	str	r7, [lr, #0]
.L340:
	mov	r0, #0
	mov	r1, #2400
	mov	r2, #25
	bl	init_uart(PLT)
	mov	r0, #1
	ldr	r1, .L357+12
	mov	r2, #17
	bl	init_uart(PLT)
	ldr	r1, .L357+56
	ldr	r0, .L357+60
	mov	r2, #32
	mov	r3, #5242880
	bl	enable_IRQ(PLT)
	ldr	r3, [sl, fp]
	ldr	r2, [r3, #0]
	ldr	r0, [r2, #8]
	bl	Dispatch_First(PLT)
	mov	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L306:
	cmp	r1, #2
	suble	r7, r1, #1
	movle	r1, r7, asr #3
	strle	r1, [sp, #0]
	andle	r2, r7, #7
	movle	lr, r1
	ble	.L312
	cmp	r1, #8
	movne	r0, #0
	moveq	r7, #3
	movne	r7, #2
	movne	lr, r0
	moveq	r2, r7
	movne	r2, r7
	strne	r0, [sp, #0]
	mov	r0, #1
	mov	r6, r0, asl r2
	ldr	r2, [sl, r9]
	moveq	lr, #0
	ldr	r3, [r2, lr, asl #2]
	streq	lr, [sp, #0]
	orr	r3, r6, r3
	cmn	r7, #1
	str	r3, [r2, lr, asl #2]
	bne	.L319
.L351:
	ldr	fp, .L357+40
	ldr	r3, [sl, fp]
	ldr	r2, [r3, #0]
	mvn	r3, #1
	ldr	r1, [r2, #8]
	str	r3, [r1, #0]
	ldr	r3, [sl, r9]
	ldr	r2, [r3, #28]
	add	r1, r2, #1
	mvn	r2, r2
	and	r1, r2, r1
	cmp	r1, #8
	bgt	.L356
.L325:
	cmp	r1, #2
	addle	r7, r1, #55
	ble	.L331
	cmp	r1, #8
	movne	r7, #58
	moveq	r7, #59
	b	.L331
.L355:
	ldr	r3, .L357+64
	ldr	r2, .L357+68
	ldr	r1, [sl, r3]
	ldr	ip, [sl, r2]
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #0]
	orr	r3, r3, r0, asl r6
	cmp	r6, r2
	ldrlt	r4, [sl, r4]
	ldrge	r4, [sl, r4]
	str	r3, [r1, #0]
	strlt	r6, [ip, #0]
	b	.L341
.L352:
	ldr	r3, .L357+64
	ldr	r2, .L357+68
	ldr	r1, [sl, r3]
	ldr	ip, [sl, r2]
	ldr	r3, [r1, #0]
	ldr	r2, [ip, #0]
	orr	r3, r3, r0, asl lr
	cmp	lr, r2
	ldrlt	r0, [sp, #0]
	ldrlt	r4, [sl, r4]
	ldrge	r4, [sl, r4]
	movge	r0, lr
	str	r3, [r1, #0]
	strlt	lr, [ip, #0]
	b	.L322
.L353:
	cmp	r1, #128
	movne	r7, #62
	moveq	r7, #63
	b	.L331
.L350:
	cmp	r1, #128
	moveq	r0, #0
	movne	r1, #0
	moveq	r7, #7
	movne	r7, #6
	moveq	r2, r7
	moveq	lr, r0
	movne	r2, r7
	movne	lr, r1
	streq	r0, [sp, #0]
	strne	r1, [sp, #0]
	b	.L312
.L354:
	ldr	r3, [sl, fp]
	ldr	r2, [r3, #0]
	mvn	r3, #1
	ldr	r1, [r2, #8]
	str	r3, [r1, #0]
	b	.L340
.L358:
	.align	2
.L357:
	.word	_GLOBAL_OFFSET_TABLE_-(.L349+8)
	.word	trackData(GOT)
	.word	distances(GOT)
	.word	115200
	.word	50800
	.word	-2139029472
	.word	.LC3(GOTOFF)
	.word	tds_exist(GOT)
	.word	tds_active(GOT)
	.word	tds_queue(GOT)
	.word	cur_task(GOT)
	.word	tds(GOT)
	.word	first(GOT)
	.word	meatspin(GOT)
	.word	-2146697216
	.word	-2146762752
	.word	priorities_active(GOT)
	.word	min_priority(GOT)
	.size	main, .-main
	.bss
	.align	2
tds_queue:
	.space	32
	.align	2
tds_active:
	.space	32
	.align	2
tds_exist:
	.space	32
	.align	2
priorities_active:
	.space	4
	.align	2
min_priority:
	.space	4
	.align	2
cts_state:
	.space	4
	.align	2
event_waiter:
	.space	24
	.align	2
cur_task:
	.space	4
	.align	2
tds:
	.space	7936
	.ident	"GCC: (GNU) 4.0.2"
