	.file	"commandLine.c"
	.text
	.align	2
	.global	getWord
	.type	getWord, %function
getWord:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	mov	r5, #19
	b	.L2
.L3:
	subs	r5, r5, #1
	add	r4, r4, #1
	beq	.L9
.L2:
	mov	r0, #1
	bl	getc(PLT)
	mov	r1, r0
	strb	r0, [r4, #0]
	mov	r0, #1
	bl	putc(PLT)
	ldrb	r3, [r4, #0]	@ zero_extendqisi2
	cmp	r3, #13
	cmpne	r3, #32
	bne	.L3
	mov	r3, #0
	strb	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, pc}
.L9:
	ldmfd	sp!, {r4, r5, pc}
	.size	getWord, .-getWord
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"commandLine ready\012\000"
	.align	2
.LC1:
	.ascii	"tr\000"
	.align	2
.LC2:
	.ascii	"got tr %d %d, sending to %d\012\000"
	.align	2
.LC3:
	.ascii	"invalid speed\012\000"
	.align	2
.LC4:
	.ascii	"invalid train\012\000"
	.align	2
.LC5:
	.ascii	"goto\000"
	.align	2
.LC6:
	.ascii	"got goto %d %d\012\000"
	.align	2
.LC7:
	.ascii	"invalid dest\012\000"
	.align	2
.LC8:
	.ascii	"create\000"
	.align	2
.LC9:
	.ascii	"creating %d sent to %d\012\000"
	.align	2
.LC10:
	.ascii	"locate\000"
	.align	2
.LC11:
	.ascii	"invalid command\012\000"
	.text
	.align	2
	.global	commandLine
	.type	commandLine, %function
commandLine:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L46
	sub	sp, sp, #64
.L38:
	add	sl, pc, sl
	mov	r0, #0
	bl	RegisterAs(PLT)
	mov	r1, #0
	mov	r2, r1
	add	r0, sp, #60
	bl	Receive(PLT)
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #60]
	bl	Reply(PLT)
	mov	r0, #3
	bl	WhoIs(PLT)
	ldr	r1, .L46+4
	str	r0, [sp, #60]
	add	r1, sl, r1
	mov	r0, #1
	bl	kprintf(PLT)
	ldr	r0, .L46+8
	ldr	r2, .L46+12
	ldr	r3, .L46+16
	str	r0, [sp, #24]
	str	r2, [sp, #20]
	ldr	r0, .L46+20
	ldr	r2, .L46+24
	str	r3, [sp, #16]
	str	r0, [sp, #12]
	str	r2, [sp, #8]
	ldr	r3, .L46+28
	ldr	r0, .L46+32
	ldr	r2, .L46+36
	ldr	r7, .L46+40
	ldr	r8, .L46+44
	ldr	r9, .L46+48
	str	r3, [sp, #4]
	str	r0, [sp, #32]
	str	r2, [sp, #28]
	add	r4, sp, #36
	add	fp, sp, #56
.L41:
	mov	r0, r4
	bl	getWord(PLT)
	mov	r0, r4
	add	r1, sl, r7
	bl	strcmp(PLT)
	subs	r6, r0, #0
	bne	.L42
.L12:
	mov	r0, r4
	add	r1, sl, r9
	bl	strcmp(PLT)
	subs	r5, r0, #0
	bne	.L43
	ldr	r2, [sp, #8]
	mov	r0, r4
	add	r1, sl, r2
	bl	strcmp(PLT)
	subs	r6, r0, #0
	bne	.L44
	ldr	r2, [sp, #32]
	mov	r0, r4
	add	r1, sl, r2
	bl	strcmp(PLT)
	cmp	r0, #0
	bne	.L45
	ldr	r3, [sp, #28]
	mov	r0, #1
	add	r1, sl, r3
	bl	kprintf(PLT)
	mov	r0, r4
	bl	getWord(PLT)
	mov	r0, r4
	add	r1, sl, r7
	bl	strcmp(PLT)
	subs	r6, r0, #0
	beq	.L12
.L42:
	mov	r5, #0
	mov	r0, r4
	strb	r5, [sp, #56]
	bl	getWord(PLT)
	mov	r0, r4
	bl	stringtoint(PLT)
	and	r0, r0, #255
	cmp	r0, r5
	strb	r0, [sp, #57]
	beq	.L30
	mov	r0, r4
	bl	getWord(PLT)
	mov	r0, r4
	bl	stringtoint(PLT)
	and	r3, r0, #255
	cmp	r3, r5
	strb	r3, [sp, #58]
	beq	.L16
	ldr	r0, [sp, #24]
	ldr	ip, [sp, #60]
	add	r1, sl, r0
	ldrb	r2, [sp, #57]	@ zero_extendqisi2
	mov	r0, #1
	str	ip, [sp, #0]
	bl	kprintf(PLT)
.L39:
	mov	r3, r5
	ldr	r0, [sp, #60]
	mov	r1, fp
	mov	r2, #4
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L41
.L45:
	mov	r3, #3
	mov	r0, r4
	strb	r3, [sp, #56]
	bl	getWord(PLT)
	mov	r0, r4
	bl	stringtoint(PLT)
	and	r0, r0, #255
	cmp	r0, #0
	strb	r0, [sp, #57]
	bne	.L40
.L30:
	mov	r0, #1
	add	r1, sl, r8
	bl	kprintf(PLT)
	b	.L41
.L43:
	mov	r0, r4
	mov	r5, #1
	strb	r5, [sp, #56]
	bl	getWord(PLT)
	mov	r0, r4
	bl	stringtoint(PLT)
	and	r0, r0, #255
	cmp	r0, #0
	strb	r0, [sp, #57]
	beq	.L20
	mov	r0, r4
	bl	getWord(PLT)
	mov	r0, r4
	bl	locationtoint(PLT)
	and	r3, r0, #255
	cmp	r3, #0
	strb	r3, [sp, #58]
	beq	.L22
	ldr	r2, [sp, #16]
	mov	r0, r5
	add	r1, sl, r2
	ldrb	r2, [sp, #57]	@ zero_extendqisi2
	bl	kprintf(PLT)
.L40:
	mov	r3, r6
	ldr	r0, [sp, #60]
	mov	r1, fp
	mov	r2, #4
	str	r6, [sp, #0]
	bl	Send(PLT)
	b	.L41
.L44:
	mov	r3, #2
	mov	r0, r4
	strb	r3, [sp, #56]
	bl	getWord(PLT)
	mov	r0, r4
	bl	stringtoint(PLT)
	and	r2, r0, #255
	cmp	r2, #0
	strb	r2, [sp, #57]
	beq	.L30
	ldr	r3, [sp, #4]
	mov	r0, #1
	add	r1, sl, r3
	ldr	r3, [sp, #60]
	bl	kprintf(PLT)
	b	.L39
.L20:
	mov	r0, r5
	add	r1, sl, r8
	bl	kprintf(PLT)
	b	.L41
.L16:
	ldr	r2, [sp, #20]
	mov	r0, #1
	add	r1, sl, r2
	bl	kprintf(PLT)
	b	.L41
.L22:
	ldr	r3, [sp, #12]
	mov	r0, r5
	add	r1, sl, r3
	bl	kprintf(PLT)
	b	.L41
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	.LC0(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	commandLine, .-commandLine
	.ident	"GCC: (GNU) 4.0.2"
