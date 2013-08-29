	.file	"track_data.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"error\012\000"
	.text
	.align	2
	.global	pointertoint
	.type	pointertoint, %function
pointertoint:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L7
	ldr	r3, .L7+4
.L5:
	add	sl, pc, sl
	ldr	r2, [sl, r3]
	ldr	r3, .L7+8
	rsb	r0, r2, r0
	umull	r1, r2, r3, r0
	mov	r4, r2, lsr #5
	ldr	r1, .L7+12
	cmp	r4, #143
	add	r1, sl, r1
	mov	r0, #1
	blgt	bwprintf(PLT)
.L2:
	mov	r0, r4
	ldmfd	sp!, {r4, sl, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	trackData(GOT)
	.word	-1431655765
	.word	.LC0(GOTOFF)
	.size	pointertoint, .-pointertoint
	.align	2
	.global	it_distance
	.type	it_distance, %function
it_distance:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L23
	cmp	r0, r1
.L20:
	add	sl, pc, sl
	add	r2, r0, r0, asl #1
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	ldr	r3, .L23+4
	ldr	r3, [sl, r3]
	add	r2, r3, r2, asl #4
	ldr	ip, [r2, #4]
	cmp	ip, #4
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	add	r2, r1, r1, asl #1
	add	r6, r3, r2, asl #4
	cmp	r0, #143
	movle	r3, #0
	movgt	r3, #1
	cmp	ip, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	ldmnefd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	ldr	ip, [r6, #4]
	cmp	ip, #5
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	add	r3, r0, r0, asl #3
	mov	r7, r3, asl #4
	cmp	r1, #143
	movle	r3, #0
	movgt	r3, #1
	cmp	ip, #0
	orreq	r3, r3, #1
	cmp	r3, #0
	add	r8, r7, r1
	ldmnefd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	ldr	r3, .L23+8
	ldr	r9, [sl, r3]
	ldr	r3, .L23+12
	ldr	r2, [r9, r8, asl #2]
	cmp	r2, r3
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	cmp	ip, #2
	beq	.L22
	ldr	r0, [r6, #24]
	bl	pointertoint(PLT)
	ldr	r4, [r9, r8, asl #2]
	mov	r5, r0
	ldr	r3, [r6, #28]
	ldr	r0, [r6, #24]
.L21:
	add	r4, r4, r3
	bl	pointertoint(PLT)
	add	r0, r7, r0
	ldr	r1, [r9, r0, asl #2]
	mov	r0, r4
	bl	min(PLT)
	add	r5, r7, r5
	str	r0, [r9, r5, asl #2]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L22:
	ldr	r0, [r6, #24]
	bl	pointertoint(PLT)
	ldr	r3, [r6, #28]
	ldr	r4, [r9, r8, asl #2]
	mov	r5, r0
	ldr	r0, [r6, #24]
	add	r4, r4, r3
	bl	pointertoint(PLT)
	add	r0, r7, r0
	ldr	r1, [r9, r0, asl #2]
	mov	r0, r4
	bl	min(PLT)
	add	r5, r7, r5
	str	r0, [r9, r5, asl #2]
	ldr	r0, [r6, #40]
	bl	pointertoint(PLT)
	ldr	r4, [r9, r8, asl #2]
	mov	r5, r0
	ldr	r3, [r6, #44]
	ldr	r0, [r6, #40]
	b	.L21
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	trackData(GOT)
	.word	distances(GOT)
	.word	2000000000
	.size	it_distance, .-it_distance
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"%d out of %d have no paths\012\000"
	.text
	.align	2
	.global	init_distance
	.type	init_distance, %function
init_distance:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L77
	ldr	lr, .L77+4
	mov	r7, r0
	mov	ip, r0
	mov	r0, #0
.L74:
	add	sl, pc, sl
.L26:
	mov	r3, ip
	mov	r2, #0
.L27:
	cmp	r0, r2
	add	r2, r2, #1
	strne	lr, [r3, #0]
	cmp	r2, #144
	add	r3, r3, #4
	bne	.L27
	add	r0, r0, #1
	cmp	r0, #144
	add	ip, ip, #576
	bne	.L26
	mov	r4, r1
	mov	r5, r7
	mov	r6, #0
	b	.L32
.L33:
	cmp	r3, #5
	cmpne	r3, #0
	bne	.L75
.L35:
	add	r6, r6, #1
	cmp	r6, #144
	add	r4, r4, #48
	add	r5, r5, #576
	beq	.L76
.L32:
	ldr	r3, [r4, #4]
	cmp	r3, #2
	bne	.L33
	ldr	r0, [r4, #24]
	bl	pointertoint(PLT)
	ldr	r3, [r4, #28]
	str	r3, [r5, r0, asl #2]
	ldr	r0, [r4, #40]
	bl	pointertoint(PLT)
	ldr	r3, [r4, #44]
	str	r3, [r5, r0, asl #2]
	b	.L35
.L76:
	sub	r6, r6, #44
.L38:
	mov	r5, #0
.L39:
	mov	r4, #0
.L40:
	cmp	r5, r4
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	blne	it_distance(PLT)
.L41:
	cmp	r4, #144
	bne	.L40
	add	r5, r5, #1
	cmp	r5, #144
	bne	.L39
	subs	r6, r6, #1
	bne	.L38
	ldr	r3, .L77+8
	ldr	r8, .L77+4
	ldr	r2, [sl, r3]
	mov	r0, r7
	mov	r5, r6
	mov	r4, r6
	mov	r7, r2
.L46:
	mov	r1, r0
	mov	ip, #0
	mov	lr, r7
.L47:
	cmp	r5, ip
	add	ip, ip, #1
	beq	.L48
	ldr	r3, [r2, #4]
	cmp	r3, #4
	beq	.L48
	cmp	r3, #0
	beq	.L48
	ldr	r3, [lr, #4]
	cmp	r3, #5
	beq	.L48
	cmp	r3, #0
	bne	.L53
.L48:
	ldr	r3, [r1, #0]
	add	r4, r4, #1
	cmp	r3, r8
	addeq	r6, r6, #1
.L53:
	cmp	ip, #144
	add	r1, r1, #4
	add	lr, lr, #48
	bne	.L47
	add	r5, r5, #1
	cmp	r5, #144
	add	r2, r2, #48
	add	r0, r0, #576
	bne	.L46
	ldr	r1, .L77+12
	mov	r2, r6
	add	r1, sl, r1
	mov	r3, r4
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	b	bwprintf(PLT)
.L75:
	ldr	r0, [r4, #24]
	bl	pointertoint(PLT)
	ldr	r3, [r4, #28]
	str	r3, [r5, r0, asl #2]
	b	.L35
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	2000000000
	.word	trackData(GOT)
	.word	.LC1(GOTOFF)
	.size	init_distance, .-init_distance
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"A1\000"
	.align	2
.LC3:
	.ascii	"A2\000"
	.align	2
.LC4:
	.ascii	"A3\000"
	.align	2
.LC5:
	.ascii	"A4\000"
	.align	2
.LC6:
	.ascii	"A5\000"
	.align	2
.LC7:
	.ascii	"A6\000"
	.align	2
.LC8:
	.ascii	"A7\000"
	.align	2
.LC9:
	.ascii	"A8\000"
	.align	2
.LC10:
	.ascii	"A9\000"
	.align	2
.LC11:
	.ascii	"A10\000"
	.align	2
.LC12:
	.ascii	"A11\000"
	.align	2
.LC13:
	.ascii	"A12\000"
	.align	2
.LC14:
	.ascii	"A13\000"
	.align	2
.LC15:
	.ascii	"A14\000"
	.align	2
.LC16:
	.ascii	"A15\000"
	.align	2
.LC17:
	.ascii	"A16\000"
	.align	2
.LC18:
	.ascii	"B1\000"
	.align	2
.LC19:
	.ascii	"B2\000"
	.align	2
.LC20:
	.ascii	"B3\000"
	.align	2
.LC21:
	.ascii	"B4\000"
	.align	2
.LC22:
	.ascii	"B5\000"
	.align	2
.LC23:
	.ascii	"B6\000"
	.align	2
.LC24:
	.ascii	"B7\000"
	.align	2
.LC25:
	.ascii	"B8\000"
	.align	2
.LC26:
	.ascii	"B9\000"
	.align	2
.LC27:
	.ascii	"B10\000"
	.align	2
.LC28:
	.ascii	"B11\000"
	.align	2
.LC29:
	.ascii	"B12\000"
	.align	2
.LC30:
	.ascii	"B13\000"
	.align	2
.LC31:
	.ascii	"B14\000"
	.align	2
.LC32:
	.ascii	"B15\000"
	.align	2
.LC33:
	.ascii	"B16\000"
	.align	2
.LC34:
	.ascii	"C1\000"
	.align	2
.LC35:
	.ascii	"C2\000"
	.align	2
.LC36:
	.ascii	"C3\000"
	.align	2
.LC37:
	.ascii	"C4\000"
	.align	2
.LC38:
	.ascii	"C5\000"
	.align	2
.LC39:
	.ascii	"C6\000"
	.align	2
.LC40:
	.ascii	"C7\000"
	.align	2
.LC41:
	.ascii	"C8\000"
	.align	2
.LC42:
	.ascii	"C9\000"
	.align	2
.LC43:
	.ascii	"C10\000"
	.align	2
.LC44:
	.ascii	"C11\000"
	.align	2
.LC45:
	.ascii	"C12\000"
	.align	2
.LC46:
	.ascii	"C13\000"
	.align	2
.LC47:
	.ascii	"C14\000"
	.align	2
.LC48:
	.ascii	"C15\000"
	.align	2
.LC49:
	.ascii	"C16\000"
	.align	2
.LC50:
	.ascii	"D1\000"
	.align	2
.LC51:
	.ascii	"D2\000"
	.align	2
.LC52:
	.ascii	"D3\000"
	.align	2
.LC53:
	.ascii	"D4\000"
	.align	2
.LC54:
	.ascii	"D5\000"
	.align	2
.LC55:
	.ascii	"D6\000"
	.align	2
.LC56:
	.ascii	"D7\000"
	.align	2
.LC57:
	.ascii	"D8\000"
	.align	2
.LC58:
	.ascii	"D9\000"
	.align	2
.LC59:
	.ascii	"D10\000"
	.align	2
.LC60:
	.ascii	"D11\000"
	.align	2
.LC61:
	.ascii	"D12\000"
	.align	2
.LC62:
	.ascii	"D13\000"
	.align	2
.LC63:
	.ascii	"D14\000"
	.align	2
.LC64:
	.ascii	"D15\000"
	.align	2
.LC65:
	.ascii	"D16\000"
	.align	2
.LC66:
	.ascii	"E1\000"
	.align	2
.LC67:
	.ascii	"E2\000"
	.align	2
.LC68:
	.ascii	"E3\000"
	.align	2
.LC69:
	.ascii	"E4\000"
	.align	2
.LC70:
	.ascii	"E5\000"
	.align	2
.LC71:
	.ascii	"E6\000"
	.align	2
.LC72:
	.ascii	"E7\000"
	.align	2
.LC73:
	.ascii	"E8\000"
	.align	2
.LC74:
	.ascii	"E9\000"
	.align	2
.LC75:
	.ascii	"E10\000"
	.align	2
.LC76:
	.ascii	"E11\000"
	.align	2
.LC77:
	.ascii	"E12\000"
	.align	2
.LC78:
	.ascii	"E13\000"
	.align	2
.LC79:
	.ascii	"E14\000"
	.align	2
.LC80:
	.ascii	"E15\000"
	.align	2
.LC81:
	.ascii	"E16\000"
	.align	2
.LC82:
	.ascii	"BR1\000"
	.align	2
.LC83:
	.ascii	"MR1\000"
	.align	2
.LC84:
	.ascii	"BR2\000"
	.align	2
.LC85:
	.ascii	"MR2\000"
	.align	2
.LC86:
	.ascii	"BR3\000"
	.align	2
.LC87:
	.ascii	"MR3\000"
	.align	2
.LC88:
	.ascii	"BR4\000"
	.align	2
.LC89:
	.ascii	"MR4\000"
	.align	2
.LC90:
	.ascii	"BR5\000"
	.align	2
.LC91:
	.ascii	"MR5\000"
	.align	2
.LC92:
	.ascii	"BR6\000"
	.align	2
.LC93:
	.ascii	"MR6\000"
	.align	2
.LC94:
	.ascii	"BR7\000"
	.align	2
.LC95:
	.ascii	"MR7\000"
	.align	2
.LC96:
	.ascii	"BR8\000"
	.align	2
.LC97:
	.ascii	"MR8\000"
	.align	2
.LC98:
	.ascii	"BR9\000"
	.align	2
.LC99:
	.ascii	"MR9\000"
	.align	2
.LC100:
	.ascii	"BR10\000"
	.align	2
.LC101:
	.ascii	"MR10\000"
	.align	2
.LC102:
	.ascii	"BR11\000"
	.align	2
.LC103:
	.ascii	"MR11\000"
	.align	2
.LC104:
	.ascii	"BR12\000"
	.align	2
.LC105:
	.ascii	"MR12\000"
	.align	2
.LC106:
	.ascii	"BR13\000"
	.align	2
.LC107:
	.ascii	"MR13\000"
	.align	2
.LC108:
	.ascii	"BR14\000"
	.align	2
.LC109:
	.ascii	"MR14\000"
	.align	2
.LC110:
	.ascii	"BR15\000"
	.align	2
.LC111:
	.ascii	"MR15\000"
	.align	2
.LC112:
	.ascii	"BR16\000"
	.align	2
.LC113:
	.ascii	"MR16\000"
	.align	2
.LC114:
	.ascii	"BR17\000"
	.align	2
.LC115:
	.ascii	"MR17\000"
	.align	2
.LC116:
	.ascii	"BR18\000"
	.align	2
.LC117:
	.ascii	"MR18\000"
	.align	2
.LC118:
	.ascii	"BR153\000"
	.align	2
.LC119:
	.ascii	"MR153\000"
	.align	2
.LC120:
	.ascii	"BR154\000"
	.align	2
.LC121:
	.ascii	"MR154\000"
	.align	2
.LC122:
	.ascii	"BR155\000"
	.align	2
.LC123:
	.ascii	"MR155\000"
	.align	2
.LC124:
	.ascii	"BR156\000"
	.align	2
.LC125:
	.ascii	"MR156\000"
	.align	2
.LC126:
	.ascii	"EN1\000"
	.align	2
.LC127:
	.ascii	"EX1\000"
	.align	2
.LC128:
	.ascii	"EN2\000"
	.align	2
.LC129:
	.ascii	"EX2\000"
	.align	2
.LC130:
	.ascii	"EN3\000"
	.align	2
.LC131:
	.ascii	"EX3\000"
	.align	2
.LC132:
	.ascii	"EN4\000"
	.align	2
.LC133:
	.ascii	"EX4\000"
	.align	2
.LC134:
	.ascii	"EN5\000"
	.align	2
.LC135:
	.ascii	"EX5\000"
	.align	2
.LC136:
	.ascii	"EN7\000"
	.align	2
.LC137:
	.ascii	"EX7\000"
	.align	2
.LC138:
	.ascii	"EN9\000"
	.align	2
.LC139:
	.ascii	"EX9\000"
	.align	2
.LC140:
	.ascii	"EN10\000"
	.align	2
.LC141:
	.ascii	"EX10\000"
	.text
	.align	2
	.global	init_trackb
	.type	init_trackb, %function
init_trackb:
	@ args = 0, pretend = 0, frame = 1144
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L86
	sub	sp, sp, #1136
	ldr	sl, .L86+4
	sub	sp, sp, #8
	mov	fp, r0
	mov	r2, r0
	mov	r9, #0
.L85:
	add	sl, pc, sl
.L80:
	sub	r3, r3, #1
	cmn	r3, #1
	strb	r9, [r2], #1
	bne	.L80
	add	r1, fp, #5056
	str	r1, [sp, #568]
	add	r1, fp, #5632
	str	r1, [sp, #804]
	add	r3, fp, #5248
	ldr	r1, [sp, #568]
	str	r3, [sp, #716]
	add	r2, fp, #4096
	add	r3, fp, #5824
	str	r2, [sp, #680]
	str	r3, [sp, #1104]
	add	r2, fp, #4672
	ldr	r3, [sp, #716]
	add	r1, r1, #32
	str	r2, [sp, #1000]
	str	r1, [sp, #568]
	ldr	r2, [sp, #680]
	ldr	r1, [sp, #804]
	add	r3, r3, #32
	add	r2, r2, #32
	str	r3, [sp, #716]
	add	r1, r1, #32
	ldr	r3, [sp, #1104]
	str	r2, [sp, #680]
	str	r1, [sp, #804]
	ldr	r2, [sp, #1000]
	add	r1, fp, #5184
	add	r3, r3, #32
	str	r1, [sp, #828]
	add	r1, fp, #4608
	add	r2, r2, #32
	str	r3, [sp, #1104]
	str	r1, [sp, #1024]
	add	r3, fp, #5760
	add	r1, fp, #5120
	str	r2, [sp, #1000]
	str	r3, [sp, #980]
	add	r2, fp, #5568
	add	r3, fp, #4864
	str	r1, [sp, #564]
	add	r1, fp, #6400
	str	r3, [sp, #536]
	str	r2, [sp, #832]
	str	r1, [sp, #772]
	add	r2, fp, #5376
	add	r1, fp, #4288
	str	r2, [sp, #1084]
	add	r3, fp, #5312
	add	r2, fp, #6208
	str	r1, [sp, #884]
	ldr	r1, [sp, #536]
	str	r2, [sp, #692]
	str	r3, [sp, #724]
	add	r2, fp, #6592
	add	r3, fp, #4352
	str	r2, [sp, #788]
	str	r3, [sp, #880]
	add	r2, fp, #5440
	add	r3, fp, #4480
	add	r1, r1, #32
	str	r2, [sp, #900]
	str	r3, [sp, #1060]
	str	r1, [sp, #536]
	ldr	r2, [sp, #884]
	ldr	r3, [sp, #900]
	add	r2, r2, #32
	add	r3, r3, #32
	ldr	r1, [sp, #1060]
	str	r2, [sp, #884]
	str	r3, [sp, #900]
	ldr	r2, [sp, #564]
	ldr	r3, [sp, #724]
	add	r1, r1, #32
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #1060]
	str	r2, [sp, #564]
	ldr	r1, [sp, #880]
	ldr	r2, [sp, #692]
	str	r3, [sp, #724]
	ldr	r3, [sp, #772]
	add	r1, r1, #16
	add	r2, r2, #32
	add	r3, r3, #32
	str	r1, [sp, #880]
	str	r2, [sp, #692]
	ldr	r1, [sp, #788]
	str	r3, [sp, #772]
	add	r2, fp, #4992
	add	r3, fp, #4224
	str	r2, [sp, #760]
	str	r3, [sp, #860]
	add	r2, fp, #6336
	add	r3, fp, #6528
	add	r1, r1, #32
	str	r2, [sp, #548]
	str	r3, [sp, #780]
	ldr	r2, [sp, #680]
	ldr	r3, [sp, #716]
	str	r1, [sp, #788]
	add	r1, fp, #4416
	str	r1, [sp, #1072]
	add	r2, r2, #16
	add	r1, fp, #6144
	add	r3, r3, #16
	str	r1, [sp, #852]
	str	r2, [sp, #684]
	str	r3, [sp, #720]
	ldr	r1, [sp, #804]
	ldr	r2, [sp, #832]
	ldr	r3, [sp, #828]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #808]
	str	r2, [sp, #836]
	str	r3, [sp, #888]
	ldr	r1, [sp, #568]
	ldr	r2, [sp, #980]
	add	r1, r1, #16
	str	r1, [sp, #928]
	ldr	r3, [sp, #1000]
	ldr	r1, [sp, #1024]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #984]
	str	r3, [sp, #1004]
	str	r1, [sp, #1028]
	ldr	r2, [sp, #1084]
	ldr	r3, [sp, #1104]
	add	r1, fp, #4928
	str	r1, [sp, #544]
	add	r1, fp, #6272
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #696]
	add	r1, fp, #6528
	str	r2, [sp, #1088]
	str	r3, [sp, #1108]
	add	r2, fp, #6336
	add	r3, fp, #4160
	str	r1, [sp, #784]
	add	r1, fp, #5184
	str	r2, [sp, #552]
	str	r3, [sp, #688]
	add	r2, fp, #4992
	add	r3, fp, #6464
	str	r1, [sp, #824]
	add	r1, fp, #4224
	str	r2, [sp, #768]
	str	r3, [sp, #776]
	add	r2, fp, #6656
	add	r3, fp, #5696
	str	r1, [sp, #868]
	add	r1, fp, #4736
	str	r2, [sp, #792]
	str	r3, [sp, #812]
	add	r2, fp, #5568
	add	r3, fp, #6144
	str	r1, [sp, #1008]
	add	r1, fp, #4416
	str	r2, [sp, #840]
	str	r3, [sp, #856]
	add	r2, fp, #5504
	add	r3, fp, #5760
	str	r1, [sp, #1080]
	ldr	r1, [sp, #544]
	str	r2, [sp, #908]
	str	r3, [sp, #988]
	add	r2, fp, #4608
	add	r3, fp, #4544
	str	r2, [sp, #1032]
	str	r3, [sp, #1068]
	add	r2, fp, #5376
	add	r3, fp, #5888
	add	r1, r1, #16
	str	r2, [sp, #1092]
	str	r3, [sp, #1112]
	str	r1, [sp, #544]
	ldr	r2, [sp, #688]
	ldr	r3, [sp, #812]
	add	r2, r2, #16
	add	r3, r3, #16
	ldr	r1, [sp, #840]
	str	r2, [sp, #688]
	str	r3, [sp, #812]
	ldr	r2, [sp, #868]
	ldr	r3, [sp, #908]
	add	r1, r1, #48
	add	r2, r2, #48
	add	r3, r3, #16
	str	r1, [sp, #840]
	str	r2, [sp, #868]
	ldr	r1, [sp, #988]
	ldr	r2, [sp, #1008]
	str	r3, [sp, #908]
	ldr	r3, [sp, #1032]
	add	r1, r1, #48
	add	r2, r2, #16
	add	r3, r3, #48
	str	r1, [sp, #988]
	str	r2, [sp, #1008]
	ldr	r1, [sp, #1112]
	ldr	r2, [sp, #768]
	str	r3, [sp, #1032]
	ldr	r3, [sp, #824]
	add	r1, r1, #16
	add	r2, r2, #48
	add	r3, r3, #48
	str	r1, [sp, #1112]
	str	r2, [sp, #768]
	ldr	r1, [sp, #1068]
	ldr	r2, [sp, #1080]
	str	r3, [sp, #824]
	ldr	r3, [sp, #1092]
	add	r1, r1, #16
	add	r2, r2, #48
	add	r3, r3, #48
	str	r1, [sp, #1068]
	str	r2, [sp, #1080]
	ldr	r1, [sp, #552]
	ldr	r2, [sp, #696]
	str	r3, [sp, #1092]
	ldr	r3, [sp, #776]
	add	r1, r1, #48
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #552]
	str	r2, [sp, #696]
	str	r3, [sp, #776]
	ldr	r1, [sp, #784]
	ldr	r2, [sp, #792]
	ldr	r3, [sp, #856]
	add	r1, r1, #48
	str	r1, [sp, #784]
	ldr	r1, [sp, #720]
	add	r2, r2, #16
	add	r3, r3, #48
	str	r2, [sp, #792]
	str	r3, [sp, #856]
	add	r1, r1, #16
	ldr	r2, [sp, #888]
	ldr	r3, [sp, #1088]
	str	r1, [sp, #472]
	ldr	r1, [sp, #1004]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #404]
	str	r3, [sp, #336]
	add	r1, r1, #16
	add	r2, fp, #4800
	add	r3, fp, #4032
	str	r1, [sp, #320]
	str	r2, [sp, #948]
	str	r3, [sp, #588]
	add	r1, fp, #3984
	add	r2, fp, #3888
	add	r3, fp, #4080
	str	r1, [sp, #628]
	str	r2, [sp, #652]
	str	r3, [sp, #596]
	add	r1, fp, #3312
	add	r2, fp, #48
	add	r3, fp, #96
	str	r1, [sp, #1020]
	str	r2, [sp, #532]
	str	r3, [sp, #556]
	add	r1, fp, #192
	add	r2, fp, #336
	add	r3, fp, #432
	str	r1, [sp, #580]
	str	r2, [sp, #612]
	str	r3, [sp, #636]
	add	r1, fp, #480
	add	r2, fp, #720
	add	r3, fp, #576
	str	r1, [sp, #656]
	str	r2, [sp, #668]
	str	r3, [sp, #672]
	add	r1, fp, #624
	add	r2, fp, #816
	add	r3, fp, #912
	str	r1, [sp, #676]
	str	r2, [sp, #704]
	str	r3, [sp, #732]
	add	r1, fp, #3408
	add	r2, fp, #3360
	add	r3, fp, #144
	str	r1, [sp, #940]
	str	r2, [sp, #944]
	add	r1, fp, #240
	str	r3, [sp, #560]
	add	r3, fp, #384
	str	r1, [sp, #584]
	add	r2, fp, #288
	str	r3, [sp, #632]
	add	r1, fp, #528
	add	r3, fp, #768
	str	r2, [sp, #608]
	str	r1, [sp, #660]
	add	r2, fp, #672
	str	r3, [sp, #700]
	add	r1, fp, #864
	add	r3, fp, #1008
	str	r2, [sp, #664]
	str	r1, [sp, #728]
	add	r2, fp, #960
	str	r3, [sp, #748]
	add	r1, fp, #3216
	add	r3, fp, #1200
	str	r2, [sp, #744]
	str	r1, [sp, #996]
	add	r2, fp, #1488
	str	r3, [sp, #604]
	add	r1, fp, #1296
	add	r3, fp, #2928
	str	r2, [sp, #576]
	str	r1, [sp, #620]
	add	r2, fp, #1104
	str	r3, [sp, #712]
	add	r1, fp, #1584
	add	r3, fp, #1344
	str	r2, [sp, #644]
	str	r1, [sp, #740]
	add	r2, fp, #2400
	str	r3, [sp, #796]
	add	r1, fp, #3024
	add	r3, fp, #1680
	str	r2, [sp, #756]
	str	r1, [sp, #820]
	add	r2, fp, #1632
	str	r3, [sp, #848]
	add	r1, fp, #1728
	add	r3, fp, #1824
	str	r2, [sp, #844]
	str	r1, [sp, #872]
	add	r2, fp, #1776
	str	r3, [sp, #892]
	add	r1, fp, #1872
	add	r3, fp, #1968
	str	r2, [sp, #876]
	str	r1, [sp, #896]
	add	r2, fp, #1920
	str	r3, [sp, #916]
	add	r1, fp, #2016
	add	r3, fp, #2112
	str	r2, [sp, #912]
	str	r1, [sp, #920]
	add	r2, fp, #2064
	str	r3, [sp, #932]
	add	r1, fp, #2160
	add	r3, fp, #2832
	str	r2, [sp, #924]
	str	r1, [sp, #936]
	add	r2, fp, #2256
	str	r3, [sp, #964]
	add	r1, fp, #2304
	add	r3, fp, #2544
	str	r2, [sp, #956]
	str	r1, [sp, #972]
	str	r3, [sp, #1016]
	add	r1, fp, #2592
	add	r3, fp, #2688
	add	r2, fp, #2496
	str	r1, [sp, #1036]
	str	r3, [sp, #1044]
	add	r1, fp, #3072
	add	r3, fp, #1152
	str	r2, [sp, #1012]
	str	r1, [sp, #1096]
	add	r2, fp, #2640
	str	r3, [sp, #600]
	add	r1, fp, #1248
	add	r3, fp, #2880
	str	r2, [sp, #1040]
	str	r1, [sp, #616]
	add	r2, fp, #1440
	str	r3, [sp, #708]
	add	r1, fp, #1536
	add	r3, fp, #1392
	str	r2, [sp, #572]
	str	r1, [sp, #736]
	add	r2, fp, #1056
	str	r3, [sp, #800]
	add	r1, fp, #2976
	add	r3, fp, #2784
	str	r2, [sp, #640]
	str	r1, [sp, #816]
	add	r2, fp, #2448
	str	r3, [sp, #960]
	add	r1, fp, #2352
	add	r3, fp, #2736
	str	r2, [sp, #752]
	str	r1, [sp, #976]
	add	r2, fp, #2208
	str	r3, [sp, #1048]
	add	r1, fp, #3600
	add	r3, fp, #3744
	str	r2, [sp, #952]
	str	r1, [sp, #1056]
	add	r2, fp, #3168
	str	r3, [sp, #1120]
	ldr	r1, [sp, #536]
	ldr	r3, [sp, #760]
	str	r2, [sp, #992]
	add	r2, fp, #3120
	str	r2, [sp, #1100]
	add	r1, r1, #16
	add	r2, fp, #4048
	add	r3, r3, #16
	str	r1, [sp, #540]
	str	r2, [sp, #592]
	str	r3, [sp, #764]
	ldr	r1, [sp, #860]
	ldr	r2, [sp, #900]
	ldr	r3, [sp, #884]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #864]
	str	r2, [sp, #904]
	str	r3, [sp, #968]
	ldr	r1, [sp, #1060]
	ldr	r2, [sp, #1072]
	add	r1, r1, #16
	str	r1, [sp, #1064]
	ldr	r1, [sp, #564]
	add	r2, r2, #16
	add	r1, r1, #16
	str	r1, [sp, #524]
	add	r1, fp, #1264
	str	r2, [sp, #1076]
	ldr	r3, [sp, #548]
	add	r2, fp, #1456
	str	r1, [sp, #512]
	add	r1, fp, #3856
	str	r2, [sp, #520]
	str	r1, [sp, #648]
	add	r2, fp, #3968
	ldr	r1, [sp, #684]
	add	r3, r3, #16
	str	r2, [sp, #508]
	add	r2, fp, #3872
	str	r3, [sp, #528]
	str	r2, [sp, #500]
	add	r3, fp, #1168
	add	r1, r1, #16
	ldr	r2, [sp, #692]
	str	r3, [sp, #516]
	str	r1, [sp, #492]
	add	r3, fp, #1072
	add	r1, fp, #2896
	str	r3, [sp, #504]
	add	r2, r2, #16
	add	r3, fp, #688
	str	r1, [sp, #480]
	add	r1, fp, #400
	str	r3, [sp, #496]
	str	r2, [sp, #488]
	add	r3, fp, #544
	add	r2, fp, #1552
	str	r1, [sp, #464]
	ldr	r1, [sp, #780]
	str	r3, [sp, #484]
	str	r2, [sp, #476]
	add	r3, fp, #2464
	ldr	r2, [sp, #772]
	str	r3, [sp, #468]
	add	r1, r1, #16
	add	r3, fp, #256
	add	r2, r2, #16
	str	r3, [sp, #456]
	str	r1, [sp, #452]
	ldr	r3, [sp, #788]
	ldr	r1, [sp, #808]
	str	r2, [sp, #460]
	add	r2, fp, #304
	str	r2, [sp, #448]
	add	r3, r3, #16
	add	r1, r1, #16
	add	r2, fp, #2992
	str	r3, [sp, #444]
	str	r1, [sp, #440]
	str	r2, [sp, #436]
	add	r1, fp, #5248
	add	r2, fp, #880
	add	r3, fp, #160
	str	r1, [sp, #428]
	str	r2, [sp, #424]
	ldr	r1, [sp, #852]
	ldr	r2, [sp, #880]
	str	r3, [sp, #432]
	ldr	r3, [sp, #836]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #416]
	str	r2, [sp, #412]
	ldr	r1, [sp, #724]
	add	r2, fp, #5056
	str	r3, [sp, #420]
	str	r2, [sp, #396]
	add	r3, fp, #4096
	add	r2, fp, #4864
	str	r3, [sp, #408]
	add	r1, r1, #16
	ldr	r3, [sp, #928]
	str	r2, [sp, #384]
	add	r2, fp, #3184
	str	r1, [sp, #400]
	str	r2, [sp, #372]
	add	r1, fp, #3424
	ldr	r2, [sp, #1028]
	add	r3, r3, #16
	str	r1, [sp, #388]
	ldr	r1, [sp, #984]
	str	r3, [sp, #392]
	add	r2, r2, #16
	add	r3, fp, #2800
	str	r3, [sp, #380]
	add	r1, r1, #16
	add	r3, fp, #976
	str	r2, [sp, #360]
	add	r2, fp, #2224
	str	r1, [sp, #376]
	str	r3, [sp, #368]
	add	r1, fp, #3280
	add	r3, fp, #3376
	str	r2, [sp, #348]
	ldr	r2, [sp, #1108]
	str	r1, [sp, #364]
	str	r3, [sp, #356]
	add	r1, fp, #3568
	add	r3, fp, #784
	str	r1, [sp, #352]
	str	r3, [sp, #344]
	add	r1, fp, #1408
	add	r2, r2, #16
	add	r3, fp, #3808
	str	r1, [sp, #340]
	str	r2, [sp, #332]
	str	r3, [sp, #328]
	ldr	r3, .L86+8
	add	r1, fp, #2368
	add	r2, sl, r3
	ldr	r3, .L86+12
	str	r2, [fp, #0]
	add	r2, sl, r3
	ldr	r3, .L86+16
	str	r2, [fp, #48]
	add	r2, sl, r3
	ldr	r3, .L86+20
	str	r2, [fp, #96]
	add	r2, sl, r3
	ldr	r3, .L86+24
	str	r1, [sp, #324]
	str	r2, [fp, #144]
	mov	r1, #218
	add	r2, sl, r3
	ldr	r3, [sp, #544]
	str	r1, [fp, #28]
	str	r2, [fp, #192]
	ldr	r1, [sp, #552]
	ldr	r2, [sp, #532]
	str	r3, [fp, #24]
	mov	r3, #1
	str	r2, [fp, #12]
	str	r9, [fp, #8]
	str	r1, [r2, #24]
	str	r3, [r2, #8]
	mov	r1, #1
	mov	r3, #500
	str	fp, [fp, #20]
	str	r3, [r2, #28]
	str	fp, [r2, #12]
	str	r2, [r2, #20]
	ldr	r3, [sp, #532]
	ldr	r2, [sp, #540]
	str	r1, [fp, #4]
	ldr	r1, [sp, #528]
	str	r2, [fp, #16]
	str	r1, [r3, #16]
	ldr	r2, [sp, #556]
	ldr	r3, [sp, #524]
	ldr	r1, [sp, #560]
	str	r3, [r2, #16]
	ldr	r3, [sp, #556]
	ldr	r2, [sp, #520]
	str	r1, [r3, #12]
	str	r2, [r1, #16]
	ldr	r1, [sp, #532]
	mov	r2, #1
	str	r2, [r1, #4]
	ldr	r2, [sp, #568]
	mov	r1, #2
	str	r1, [r3, #8]
	str	r2, [r3, #24]
	add	r1, r1, #60
	mov	r2, #1
	str	r1, [r3, #28]
	str	r3, [r3, #20]
	str	r2, [r3, #4]
	ldr	r3, [sp, #560]
	sub	r1, r1, #59
	str	r2, [r3, #4]
	ldr	r2, [sp, #556]
	str	r1, [r3, #8]
	ldr	r1, [sp, #576]
	str	r2, [r3, #12]
	mov	r2, #440
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	str	r3, [r3, #20]
	ldr	r3, [sp, #580]
	mov	r1, #1
	str	r1, [r3, #4]
	ldr	r3, .L86+28
	add	r1, r1, #3
	add	r2, sl, r3
	ldr	r3, .L86+32
	str	r2, [fp, #240]
	add	r2, sl, r3
	ldr	r3, .L86+36
	str	r2, [fp, #288]
	add	r2, sl, r3
	ldr	r3, .L86+40
	str	r2, [fp, #336]
	add	r2, sl, r3
	str	r2, [fp, #384]
	ldr	r2, [sp, #580]
	ldr	r3, [sp, #584]
	str	r1, [r2, #8]
	ldr	r1, [sp, #596]
	str	r3, [r2, #12]
	mov	r3, #216
	str	r3, [r2, #28]
	str	r1, [r2, #24]
	str	r2, [r2, #20]
	ldr	r2, [sp, #584]
	ldr	r1, [sp, #580]
	sub	r3, r3, #211
	str	r3, [r2, #8]
	add	r3, r3, #644
	str	r1, [r2, #12]
	str	r3, [r2, #28]
	ldr	r1, [sp, #604]
	str	r2, [r2, #20]
	str	r1, [r2, #24]
	ldr	r3, [sp, #592]
	ldr	r2, [sp, #580]
	ldr	r1, [sp, #584]
	str	r3, [r2, #16]
	ldr	r2, [sp, #516]
	ldr	r3, [sp, #608]
	str	r2, [r1, #16]
	ldr	r1, [sp, #512]
	ldr	r2, [sp, #612]
	str	r1, [r3, #16]
	ldr	r3, [sp, #508]
	ldr	r1, [sp, #584]
	str	r3, [r2, #16]
	ldr	r3, [sp, #608]
	mov	r2, #1
	str	r2, [r1, #4]
	mov	r1, #6
	str	r1, [r3, #8]
	ldr	r1, .L86+132
	ldr	r2, [sp, #612]
	str	r1, [r3, #28]
	ldr	r1, [sp, #620]
	str	r2, [r3, #12]
	mov	r2, #1
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	str	r1, [r3, #24]
	ldr	r3, [sp, #612]
	mov	r1, #7
	str	r2, [r3, #4]
	add	r2, r2, #210
	str	r1, [r3, #8]
	str	r2, [r3, #28]
	ldr	r1, [sp, #608]
	ldr	r2, [sp, #628]
	str	r1, [r3, #12]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #632]
	mov	r1, #1
	mov	r2, #8
	stmib	r3, {r1, r2}	@ phole stm
	ldr	r2, [sp, #504]
	ldr	r1, [sp, #636]
	str	r2, [r3, #16]
	str	r1, [r3, #12]
	ldr	r3, .L86+44
	ldr	r0, .L86+48
	add	r2, sl, r3
	ldr	r3, [sp, #500]
	str	r2, [fp, #432]
	str	r3, [r1, #16]
	ldr	r3, .L86+52
	ldr	r1, [sp, #656]
	add	r2, sl, r3
	str	r2, [fp, #480]
	ldr	r3, .L86+56
	ldr	r2, [sp, #648]
	mov	ip, fp
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r1, [sp, #496]
	ldr	r3, [sp, #660]
	str	r2, [fp, #528]
	str	r1, [r3, #16]
	ldr	r3, .L86+60
	ldr	r1, [sp, #632]
	add	r2, sl, r3
	str	r2, [fp, #576]
	ldr	r3, [sp, #492]
	ldr	r2, [sp, #672]
	str	r1, [r1, #20]
	str	r3, [r2, #16]
	ldr	r2, [sp, #644]
	ldr	r3, .L86+64
	str	r2, [r1, #24]
	ldr	r2, [sp, #636]
	str	r3, [r1, #28]
	str	r1, [r2, #12]
	sub	r3, r3, #280
	ldr	r1, [sp, #652]
	str	r3, [r2, #8]
	add	r3, r3, #201
	str	r1, [r2, #24]
	str	r2, [r2, #20]
	str	r3, [r2, #28]
	ldr	r2, [sp, #660]
	ldr	r1, [sp, #656]
	ldr	r3, [sp, #636]
	str	r2, [r1, #12]
	mov	r1, #1
	ldr	r2, [sp, #656]
	str	r1, [r3, #4]
	ldr	r1, [sp, #652]
	mov	r3, #10
	str	r3, [r2, #8]
	str	r1, [r2, #24]
	add	r3, r3, #255
	mov	r1, #1
	str	r1, [r2, #4]
	str	r2, [r2, #20]
	str	r3, [r2, #28]
	ldr	r2, [sp, #660]
	sub	r3, r3, #254
	str	r1, [r2, #4]
	ldr	r1, [sp, #656]
	str	r3, [r2, #8]
	str	r1, [r2, #12]
	ldr	r3, [sp, #668]
	ldr	r1, .L86+68
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	str	r1, [r2, #28]
	ldr	r2, [sp, #672]
	mov	r3, #1
	mov	r1, #12
	str	r3, [r2, #4]
	str	r1, [r2, #8]
	ldr	r3, [sp, #676]
	ldr	r1, [sp, #488]
	str	r3, [r2, #12]
	str	r1, [r3, #16]
	ldr	r3, .L86+72
	str	r2, [r2, #20]
	add	r2, sl, r3
	str	r2, [fp, #624]
	ldr	r3, [sp, #484]
	ldr	r2, [sp, #664]
	add	lr, fp, #3456
	str	r3, [r2, #16]
	ldr	r3, .L86+76
	add	r4, fp, #3648
	add	r2, sl, r3
	str	r2, [fp, #672]
	ldr	r3, .L86+80
	ldr	r2, [sp, #684]
	ldr	r1, [sp, #668]
	add	r7, fp, #3136
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, .L86+84
	ldr	r1, [sp, #480]
	str	r2, [fp, #720]
	add	r2, sl, r3
	ldr	r3, [sp, #700]
	str	r2, [fp, #768]
	str	r1, [r3, #16]
	ldr	r2, [sp, #672]
	ldr	r3, [sp, #688]
	mov	r1, #215
	str	r3, [r2, #24]
	ldr	r3, [sp, #676]
	str	r1, [r2, #28]
	ldr	r1, [sp, #696]
	str	r2, [r3, #12]
	mov	r2, #13
	str	r2, [r3, #8]
	str	r1, [r3, #24]
	str	r3, [r3, #20]
	ldr	r1, [sp, #668]
	ldr	r3, [sp, #664]
	ldr	r2, [sp, #676]
	str	r1, [r3, #12]
	mov	r3, #320
	str	r3, [r2, #28]
	ldr	r1, [sp, #664]
	ldr	r3, [sp, #656]
	ldr	r2, .L86+68
	str	r3, [r1, #24]
	str	r2, [r1, #28]
	str	r1, [r1, #20]
	ldr	r1, [sp, #676]
	ldr	r3, [sp, #664]
	mov	r2, #1
	str	r2, [r1, #4]
	ldr	r2, [sp, #668]
	mov	r1, #14
	str	r1, [r3, #8]
	sub	r1, r1, #13
	str	r3, [r2, #12]
	str	r1, [r3, #4]
	ldr	r3, [sp, #688]
	str	r1, [r2, #4]
	add	r1, r1, #14
	str	r1, [r2, #8]
	str	r3, [r2, #24]
	ldr	r1, [sp, #700]
	mov	r3, #260
	str	r2, [r2, #20]
	str	r3, [r2, #28]
	mov	r2, #1
	sub	r3, r3, #244
	stmib	r1, {r2, r3}	@ phole stm
	ldr	r3, [sp, #712]
	ldr	r2, [sp, #704]
	str	r3, [r1, #24]
	str	r2, [r1, #12]
	ldr	r3, .L86+88
	ldr	r2, .L86+308
	str	r1, [r1, #20]
	str	r2, [r1, #28]
	add	r2, sl, r3
	ldr	r3, .L86+92
	str	r2, [fp, #816]
	add	r2, sl, r3
	ldr	r3, .L86+96
	str	r2, [fp, #864]
	add	r2, sl, r3
	ldr	r3, .L86+100
	str	r2, [fp, #912]
	add	r2, sl, r3
	ldr	r3, .L86+104
	str	r2, [fp, #960]
	add	r2, sl, r3
	ldr	r3, [sp, #704]
	str	r2, [fp, #1008]
	str	r1, [r3, #12]
	ldr	r2, [sp, #724]
	mov	r1, #17
	str	r1, [r3, #8]
	add	r1, r1, #208
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	str	r1, [r3, #28]
	ldr	r2, [sp, #728]
	ldr	r3, [sp, #732]
	sub	r1, r1, #207
	str	r3, [r2, #12]
	ldr	r3, [sp, #740]
	str	r1, [r2, #8]
	add	r1, r1, #212
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	str	r1, [r2, #28]
	ldr	r2, [sp, #732]
	mov	r3, #19
	str	r3, [r2, #8]
	ldr	r3, [sp, #704]
	ldr	r2, [sp, #720]
	sub	r1, r1, #229
	str	r1, [r3, #4]
	str	r2, [r3, #16]
	ldr	r1, [sp, #476]
	ldr	r3, [sp, #728]
	ldr	r2, [sp, #732]
	str	r1, [r3, #16]
	ldr	r3, [sp, #472]
	ldr	r1, [sp, #744]
	str	r3, [r2, #16]
	ldr	r2, [sp, #468]
	ldr	r3, [sp, #732]
	str	r2, [r1, #16]
	ldr	r1, [sp, #728]
	mov	r2, #1
	str	r1, [r3, #12]
	str	r2, [r1, #4]
	ldr	r1, [sp, #724]
	add	r2, r2, #219
	str	r1, [r3, #24]
	ldr	r1, [sp, #744]
	str	r3, [r3, #20]
	str	r2, [r3, #28]
	ldr	r2, [sp, #732]
	mov	r3, #20
	str	r3, [r1, #8]
	sub	r3, r3, #19
	str	r3, [r2, #4]
	ldr	r2, [sp, #748]
	str	r3, [r1, #4]
	ldr	r3, [sp, #756]
	str	r2, [r1, #12]
	str	r1, [r1, #20]
	str	r3, [r1, #24]
	mov	r3, #1
	str	r3, [r2, #4]
	add	r3, r3, #20
	str	r0, [r1, #28]
	str	r3, [r2, #8]
	ldr	r2, .L86+108
	ldr	r1, [sp, #1064]
	add	r3, sl, r2
	str	r3, [fp, #1056]
	ldr	r3, .L86+112
	mov	r2, #22
	str	r2, [fp, #1064]
	add	r2, sl, r3
	str	r2, [fp, #1104]
	ldr	r2, .L86+116
	mov	r3, #23
	str	r3, [fp, #1112]
	add	r3, sl, r2
	add	r1, r1, #16
	str	r3, [fp, #1152]
	ldr	r2, .L86+120
	ldr	r3, .L86+124
	str	r1, [sp, #308]
	ldr	r1, .L86+64
	str	r2, [fp, #1180]
	add	r2, sl, r3
	mov	r3, #25
	str	r1, [fp, #1084]
	str	r2, [fp, #1200]
	ldr	r1, [sp, #744]
	ldr	r2, [sp, #764]
	str	r3, [fp, #1208]
	ldr	r3, [sp, #748]
	add	r5, fp, #5952
	str	r2, [r3, #16]
	str	r1, [r3, #12]
	ldr	r1, [sp, #464]
	ldr	r3, [sp, #640]
	ldr	r2, [sp, #644]
	str	r1, [r3, #16]
	ldr	r3, [sp, #460]
	ldr	r1, [sp, #600]
	str	r3, [r2, #16]
	ldr	r2, [sp, #456]
	ldr	r3, [sp, #748]
	str	r2, [r1, #16]
	ldr	r1, [sp, #768]
	str	r3, [fp, #1028]
	mov	r2, #214
	mov	r3, #1
	str	r1, [fp, #1032]
	str	r2, [fp, #1036]
	str	r3, [fp, #1060]
	ldr	r2, [sp, #640]
	ldr	r3, [sp, #636]
	str	r2, [fp, #1076]
	str	r3, [fp, #1080]
	str	r2, [fp, #1116]
	ldr	r3, [sp, #776]
	ldr	r2, [sp, #644]
	str	r3, [fp, #1128]
	str	r2, [fp, #1124]
	mov	r3, #24
	mov	r2, #1
	ldr	r1, [sp, #644]
	str	r2, [fp, #1156]
	str	r3, [fp, #1160]
	ldr	r2, [sp, #600]
	ldr	r3, [sp, #580]
	str	r1, [fp, #1068]
	str	r2, [fp, #1172]
	mov	r1, #1
	str	r3, [fp, #1176]
	str	r2, [fp, #1212]
	ldr	r3, [sp, #452]
	ldr	r2, [sp, #604]
	str	r1, [fp, #1108]
	add	r1, r1, #59
	str	r3, [r2, #16]
	str	r1, [fp, #1132]
	ldr	r3, .L86+128
	ldr	r1, [sp, #604]
	add	r2, sl, r3
	str	r1, [fp, #1164]
	mov	r1, #1
	str	r1, [fp, #1204]
	str	r2, [fp, #1248]
	b	.L87
.L88:
	.align	2
.L86:
	.word	6911
	.word	_GLOBAL_OFFSET_TABLE_-(.L85+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	405
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	289
	.word	774
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	649
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	473
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	410
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	411
	.word	305
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	314
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	290
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	291
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	398
	.word	.LC66(GOTOFF)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.word	375
	.word	785
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	275
	.word	.LC79(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC83(GOTOFF)
	.word	.LC84(GOTOFF)
.L87:
	ldr	r1, [sp, #616]
	ldr	r2, [sp, #448]
	mov	r3, #26
	str	r2, [r1, #16]
	str	r3, [fp, #1256]
	ldr	r1, [sp, #444]
	ldr	r3, [sp, #620]
	ldr	r2, .L86+132
	str	r1, [r3, #16]
	ldr	r1, [sp, #440]
	ldr	r3, [sp, #796]
	str	r2, [fp, #1276]
	str	r1, [r3, #16]
	ldr	r3, .L86+136
	ldr	r1, [sp, #604]
	add	r2, sl, r3
	str	r2, [fp, #1296]
	ldr	r2, .L86+140
	mov	r3, #27
	str	r3, [fp, #1304]
	add	r3, sl, r2
	str	r3, [fp, #1344]
	ldr	r3, .L86+144
	mov	r2, #28
	str	r2, [fp, #1352]
	add	r2, sl, r3
	mov	r3, #29
	str	r2, [fp, #1392]
	str	r3, [fp, #1400]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #436]
	str	r1, [fp, #1220]
	mov	r1, #1
	str	r3, [r2, #16]
	str	r1, [fp, #1252]
	ldr	r2, [sp, #784]
	ldr	r1, [sp, #612]
	mov	r3, #70
	str	r3, [fp, #1228]
	ldr	r3, [sp, #616]
	str	r2, [fp, #1224]
	str	r1, [fp, #1272]
	ldr	r2, [sp, #620]
	ldr	r1, [sp, #792]
	str	r3, [fp, #1268]
	str	r3, [fp, #1308]
	ldr	r3, [sp, #620]
	str	r2, [fp, #1260]
	str	r1, [fp, #1320]
	mov	r2, #1
	ldr	r1, [sp, #800]
	str	r2, [fp, #1300]
	str	r3, [fp, #1316]
	add	r2, r2, #69
	mov	r3, #1
	str	r2, [fp, #1324]
	str	r3, [fp, #1348]
	str	r1, [fp, #1356]
	ldr	r3, [sp, #812]
	ldr	r2, [sp, #796]
	str	r3, [fp, #1368]
	ldr	r3, [sp, #796]
	str	r2, [fp, #1364]
	mov	r2, #1
	str	r2, [fp, #1396]
	str	r3, [fp, #1404]
	ldr	r2, [sp, #572]
	ldr	r3, [sp, #432]
	mov	r1, #224
	str	r3, [r2, #16]
	ldr	r3, .L86+148
	str	r1, [fp, #1372]
	ldr	r1, [sp, #800]
	add	r2, sl, r3
	str	r1, [fp, #1412]
	str	r2, [fp, #1440]
	ldr	r1, [sp, #576]
	ldr	r2, [sp, #428]
	mov	r3, #30
	str	r2, [r1, #16]
	str	r3, [fp, #1448]
	ldr	r1, [sp, #424]
	ldr	r3, [sp, #736]
	mov	r2, #440
	str	r1, [r3, #16]
	ldr	r3, .L86+152
	str	r2, [fp, #1468]
	add	r2, sl, r3
	str	r2, [fp, #1488]
	ldr	r2, .L86+156
	mov	r3, #31
	str	r3, [fp, #1496]
	add	r3, sl, r2
	ldr	r2, .L86+160
	str	r3, [fp, #1536]
	add	r3, sl, r2
	ldr	r1, [sp, #420]
	str	r3, [fp, #1584]
	mov	r2, #33
	ldr	r3, [sp, #740]
	str	r2, [fp, #1592]
	ldr	r2, [sp, #820]
	str	r1, [r3, #16]
	mov	r3, #202
	mov	r1, #1
	str	r2, [fp, #1416]
	str	r3, [fp, #1420]
	str	r1, [fp, #1444]
	ldr	r3, [sp, #572]
	ldr	r2, [sp, #576]
	str	r3, [fp, #1460]
	str	r3, [fp, #1500]
	ldr	r3, [sp, #576]
	str	r2, [fp, #1452]
	mov	r2, #1
	str	r2, [fp, #1492]
	str	r3, [fp, #1508]
	add	r2, r2, #69
	mov	r3, #1
	ldr	r1, [sp, #556]
	str	r2, [fp, #1516]
	str	r3, [fp, #1540]
	ldr	r2, [sp, #740]
	ldr	r3, [sp, #736]
	str	r1, [fp, #1464]
	str	r2, [fp, #1548]
	ldr	r1, [sp, #828]
	str	r3, [fp, #1556]
	mov	r2, #230
	mov	r3, #1
	str	r2, [fp, #1564]
	str	r3, [fp, #1588]
	ldr	r2, [sp, #740]
	ldr	r3, [sp, #840]
	str	r1, [fp, #1512]
	mov	r1, #32
	str	r1, [fp, #1544]
	str	r2, [fp, #1604]
	ldr	r1, [sp, #732]
	ldr	r2, [sp, #844]
	str	r3, [fp, #1608]
	ldr	r3, [sp, #416]
	str	r1, [fp, #1560]
	str	r3, [r2, #16]
	ldr	r1, [sp, #736]
	ldr	r3, .L86+164
	str	r1, [fp, #1596]
	add	r2, sl, r3
	mov	r1, #228
	str	r1, [fp, #1612]
	str	r2, [fp, #1632]
	ldr	r2, .L86+168
	mov	r3, #34
	str	r3, [fp, #1640]
	add	r3, sl, r2
	str	r3, [fp, #1680]
	ldr	r3, .L86+172
	mov	r2, #35
	str	r2, [fp, #1688]
	add	r2, sl, r3
	str	r2, [fp, #1728]
	ldr	r2, .L86+176
	mov	r3, #36
	str	r3, [fp, #1736]
	add	r3, sl, r2
	str	r3, [fp, #1776]
	ldr	r3, .L86+180
	mov	r2, #37
	str	r2, [fp, #1784]
	add	r2, sl, r3
	ldr	r1, [sp, #848]
	str	r2, [fp, #1824]
	ldr	r2, [sp, #864]
	ldr	r3, [sp, #872]
	str	r2, [r1, #16]
	ldr	r1, [sp, #412]
	mov	r2, #1
	str	r1, [r3, #16]
	str	r2, [fp, #1636]
	ldr	r3, [sp, #848]
	ldr	r1, [sp, #844]
	ldr	r2, [sp, #856]
	str	r3, [fp, #1644]
	str	r1, [fp, #1652]
	str	r2, [fp, #1656]
	ldr	r3, .L86+184
	ldr	r2, [sp, #844]
	mov	r1, #1
	str	r1, [fp, #1684]
	ldr	r1, [sp, #868]
	str	r3, [fp, #1660]
	str	r2, [fp, #1692]
	ldr	r3, [sp, #848]
	mov	r2, #226
	str	r1, [fp, #1704]
	str	r2, [fp, #1708]
	ldr	r1, [sp, #876]
	ldr	r2, [sp, #872]
	str	r3, [fp, #1700]
	mov	r3, #1
	str	r3, [fp, #1732]
	str	r1, [fp, #1740]
	str	r2, [fp, #1748]
	ldr	r3, [sp, #884]
	mov	r1, #79
	mov	r2, #1
	str	r3, [fp, #1752]
	str	r1, [fp, #1756]
	ldr	r3, [sp, #872]
	ldr	r1, [sp, #876]
	str	r2, [fp, #1780]
	ldr	r2, [sp, #888]
	str	r3, [fp, #1788]
	str	r2, [r1, #16]
	ldr	r3, [sp, #824]
	mov	r2, #1
	str	r2, [fp, #1828]
	ldr	r2, .L86+188
	str	r3, [fp, #1800]
	mov	r3, #38
	str	r3, [fp, #1832]
	add	r3, sl, r2
	str	r3, [fp, #1872]
	ldr	r3, .L86+192
	mov	r2, #39
	str	r2, [fp, #1880]
	add	r2, sl, r3
	str	r2, [fp, #1920]
	ldr	r2, .L86+196
	mov	r3, #40
	str	r3, [fp, #1928]
	add	r3, sl, r2
	str	r3, [fp, #1968]
	ldr	r3, .L86+200
	str	r1, [fp, #1796]
	mov	r2, #41
	ldr	r1, .L86+204
	str	r2, [fp, #1976]
	add	r2, sl, r3
	mov	r3, #42
	str	r1, [fp, #1804]
	str	r3, [fp, #2024]
	ldr	r1, [sp, #904]
	ldr	r3, [sp, #892]
	str	r2, [fp, #2016]
	str	r1, [r3, #16]
	ldr	r2, [sp, #896]
	ldr	r3, [sp, #408]
	ldr	r1, [sp, #912]
	str	r3, [r2, #16]
	ldr	r2, [sp, #404]
	ldr	r3, [sp, #916]
	str	r2, [r1, #16]
	ldr	r1, [sp, #400]
	add	r6, fp, #6016
	str	r1, [r3, #16]
	ldr	r3, [sp, #892]
	ldr	r1, [sp, #908]
	ldr	r2, [sp, #896]
	str	r3, [fp, #1844]
	str	r1, [fp, #1848]
	mov	r3, #1
	ldr	r1, [sp, #892]
	str	r2, [fp, #1836]
	str	r3, [fp, #1876]
	mov	r2, #215
	ldr	r3, [sp, #588]
	str	r2, [fp, #1852]
	str	r1, [fp, #1884]
	ldr	r2, [sp, #896]
	mov	r1, #145
	str	r3, [fp, #1896]
	str	r1, [fp, #1900]
	ldr	r3, [sp, #916]
	ldr	r1, [sp, #912]
	str	r2, [fp, #1892]
	mov	r2, #1
	str	r2, [fp, #1924]
	str	r3, [fp, #1932]
	ldr	r2, [sp, #824]
	str	r1, [fp, #1940]
	ldr	r3, .L86+208
	mov	r1, #1
	str	r1, [fp, #1972]
	ldr	r1, [sp, #716]
	str	r2, [fp, #1944]
	str	r3, [fp, #1948]
	ldr	r2, [sp, #912]
	ldr	r3, [sp, #916]
	str	r1, [fp, #1992]
	ldr	r1, [sp, #924]
	str	r2, [fp, #1980]
	str	r3, [fp, #1988]
	mov	r2, #146
	mov	r3, #1
	str	r2, [fp, #1996]
	str	r3, [fp, #2020]
	str	r1, [fp, #2028]
	ldr	r3, [sp, #396]
	ldr	r2, [sp, #920]
	add	r6, r6, #32
	str	r3, [r2, #16]
	ldr	r3, .L86+212
	add	r8, fp, #4800
	add	r2, sl, r3
	str	r2, [fp, #2064]
	ldr	r2, [sp, #392]
	mov	r3, #43
	str	r2, [r1, #16]
	str	r3, [fp, #2072]
	ldr	r1, [sp, #388]
	ldr	r3, [sp, #932]
	add	r8, r8, #48
	str	r1, [r3, #16]
	ldr	r3, .L86+216
	ldr	r1, [sp, #952]
	add	r2, sl, r3
	str	r2, [fp, #2112]
	ldr	r3, [sp, #384]
	ldr	r2, [sp, #936]
	str	r3, [r2, #16]
	ldr	r2, .L86+220
	mov	r3, #44
	str	r3, [fp, #2120]
	add	r3, sl, r2
	str	r3, [fp, #2160]
	ldr	r3, .L86+224
	mov	r2, #45
	str	r2, [fp, #2168]
	add	r2, sl, r3
	str	r2, [fp, #2208]
	mov	r3, #46
	ldr	r2, [sp, #380]
	str	r3, [fp, #2216]
	ldr	r3, [sp, #920]
	str	r2, [r1, #16]
	ldr	r1, [sp, #760]
	str	r3, [fp, #2036]
	mov	r2, #140
	mov	r3, #1
	str	r1, [fp, #2040]
	str	r2, [fp, #2044]
	ldr	r1, [sp, #920]
	ldr	r2, [sp, #924]
	str	r3, [fp, #2068]
	ldr	r3, [sp, #564]
	str	r1, [fp, #2076]
	str	r2, [fp, #2084]
	str	r3, [fp, #2088]
	ldr	r3, [sp, #936]
	mov	r2, #1
	str	r2, [fp, #2116]
	str	r3, [fp, #2124]
	ldr	r2, [sp, #944]
	ldr	r3, .L86+352
	str	r2, [fp, #2136]
	str	r3, [fp, #2140]
	ldr	r2, [sp, #932]
	ldr	r3, [sp, #936]
	str	r2, [fp, #2172]
	str	r3, [fp, #2180]
	mov	r2, #60
	mov	r3, #1
	str	r2, [fp, #2188]
	str	r3, [fp, #2212]
	ldr	r2, [sp, #952]
	ldr	r3, .L86+228
	str	r2, [fp, #2228]
	add	r2, sl, r3
	str	r2, [fp, #2256]
	ldr	r2, .L86+232
	mov	r3, #47
	ldr	r1, .L86+236
	str	r3, [fp, #2264]
	add	r3, sl, r2
	str	r3, [fp, #2304]
	ldr	r3, .L86+240
	str	r1, [fp, #2092]
	mov	r2, #48
	ldr	r1, [sp, #932]
	str	r2, [fp, #2312]
	add	r2, sl, r3
	str	r1, [fp, #2132]
	str	r2, [fp, #2352]
	mov	r1, #1
	ldr	r2, .L86+244
	str	r1, [fp, #2164]
	mov	r3, #49
	ldr	r1, [sp, #948]
	str	r3, [fp, #2360]
	add	r3, sl, r2
	str	r1, [fp, #2184]
	str	r3, [fp, #2400]
	ldr	r1, [sp, #956]
	ldr	r3, [sp, #968]
	mov	r2, #50
	str	r3, [r1, #16]
	str	r1, [fp, #2220]
	str	r2, [fp, #2408]
	ldr	r1, [sp, #972]
	ldr	r2, [sp, #376]
	str	r2, [r1, #16]
	ldr	r1, [sp, #372]
	ldr	r3, [sp, #976]
	ldr	r2, [sp, #964]
	str	r1, [r3, #16]
	mov	r3, #1
	ldr	r1, [sp, #952]
	str	r2, [fp, #2232]
	str	r3, [fp, #2260]
	ldr	r2, [sp, #956]
	ldr	r3, [sp, #880]
	str	r1, [fp, #2268]
	str	r2, [fp, #2276]
	str	r3, [fp, #2280]
	mov	r1, #223
	ldr	r3, [sp, #976]
	mov	r2, #1
	str	r1, [fp, #2284]
	str	r2, [fp, #2308]
	ldr	r1, [sp, #972]
	ldr	r2, [sp, #988]
	str	r3, [fp, #2316]
	mov	r3, #227
	str	r1, [fp, #2324]
	str	r2, [fp, #2328]
	str	r3, [fp, #2332]
	ldr	r2, [sp, #972]
	ldr	r3, [sp, #976]
	mov	r1, #1
	str	r1, [fp, #2356]
	ldr	r1, [sp, #996]
	str	r2, [fp, #2364]
	str	r3, [fp, #2372]
	mov	r2, #200
	mov	r3, #1
	str	r1, [fp, #2376]
	str	r2, [fp, #2380]
	ldr	r1, [sp, #752]
	ldr	r2, [sp, #756]
	str	r3, [fp, #2404]
	ldr	r3, [sp, #1004]
	str	r0, [fp, #2236]
	str	r1, [fp, #2412]
	str	r3, [r2, #16]
	ldr	r1, [sp, #1008]
	ldr	r3, [sp, #752]
	str	r1, [fp, #2424]
	ldr	r1, [sp, #368]
	str	r2, [fp, #2420]
	str	r1, [r3, #16]
	ldr	r3, .L86+248
	mov	r2, #223
	str	r2, [fp, #2428]
	add	r2, sl, r3
	str	r2, [fp, #2448]
	ldr	r3, [sp, #364]
	ldr	r2, [sp, #1012]
	ldr	r1, [sp, #1016]
	str	r3, [r2, #16]
	mov	r3, #51
	ldr	r2, [sp, #360]
	str	r3, [fp, #2456]
	ldr	r3, .L86+252
	str	r2, [r1, #16]
	add	r2, sl, r3
	str	r2, [fp, #2496]
	ldr	r2, .L86+256
	mov	r3, #52
	str	r3, [fp, #2504]
	add	r3, sl, r2
	str	r3, [fp, #2544]
	ldr	r3, .L86+260
	mov	r2, #53
	str	r2, [fp, #2552]
	add	r2, sl, r3
	mov	r3, #54
	ldr	r1, [sp, #1028]
	str	r3, [fp, #2600]
	ldr	r3, [sp, #1036]
	str	r2, [fp, #2592]
	str	r1, [r3, #16]
	ldr	r3, .L86+264
	ldr	r1, [sp, #752]
	add	r2, sl, r3
	str	r2, [fp, #2640]
	ldr	r3, [sp, #756]
	mov	r2, #1
	str	r2, [fp, #2452]
	ldr	r2, [sp, #748]
	str	r3, [fp, #2460]
	mov	r3, #1
	str	r1, [fp, #2468]
	str	r2, [fp, #2472]
	str	r0, [fp, #2476]
	str	r3, [fp, #2500]
	ldr	r1, [sp, #1016]
	ldr	r2, [sp, #1012]
	ldr	r3, [sp, #1020]
	str	r1, [fp, #2508]
	str	r2, [fp, #2516]
	ldr	r1, .L86+376
	mov	r2, #1
	str	r2, [fp, #2548]
	ldr	r2, [sp, #1032]
	str	r3, [fp, #2520]
	str	r1, [fp, #2524]
	ldr	r3, [sp, #1012]
	ldr	r1, [sp, #1016]
	str	r2, [fp, #2568]
	ldr	r2, [sp, #1040]
	str	r3, [fp, #2556]
	str	r1, [fp, #2564]
	mov	r3, #213
	mov	r1, #1
	str	r3, [fp, #2572]
	str	r1, [fp, #2596]
	ldr	r3, [sp, #1036]
	ldr	r1, [sp, #1032]
	str	r2, [fp, #2604]
	ldr	r2, .L86+268
	str	r3, [fp, #2612]
	str	r1, [fp, #2616]
	str	r2, [fp, #2620]
	ldr	r1, [sp, #1040]
	ldr	r2, [sp, #356]
	mov	r3, #1
	str	r3, [fp, #2644]
	add	r3, r3, #54
	str	r2, [r1, #16]
	str	r3, [fp, #2648]
	ldr	r1, [sp, #352]
	ldr	r3, [sp, #1044]
	str	r1, [r3, #16]
	ldr	r3, .L86+272
	add	r2, sl, r3
	str	r2, [fp, #2688]
	ldr	r2, .L86+276
	mov	r3, #56
	str	r3, [fp, #2696]
	add	r3, sl, r2
	str	r3, [fp, #2736]
	ldr	r3, .L86+280
	mov	r2, #57
	str	r2, [fp, #2744]
	add	r2, sl, r3
	mov	r3, #58
	str	r3, [fp, #2792]
	ldr	r3, .L86+284
	str	r2, [fp, #2784]
	add	r2, sl, r3
	mov	r3, #59
	str	r2, [fp, #2832]
	str	r3, [fp, #2840]
	ldr	r2, [sp, #1048]
	ldr	r3, [sp, #1064]
	ldr	r1, [sp, #960]
	str	r3, [r2, #16]
	ldr	r2, [sp, #348]
	ldr	r3, [sp, #1036]
	str	r2, [r1, #16]
	str	r3, [fp, #2652]
	ldr	r1, [sp, #1040]
	ldr	r2, [sp, #940]
	ldr	r3, .L86+348
	str	r1, [fp, #2660]
	str	r2, [fp, #2664]
	str	r3, [fp, #2668]
	ldr	r2, [sp, #1048]
	ldr	r3, [sp, #1044]
	mov	r1, #1
	str	r1, [fp, #2692]
	ldr	r1, [sp, #1056]
	str	r2, [fp, #2700]
	str	r3, [fp, #2708]
	mov	r2, #284
	mov	r3, #1
	str	r1, [fp, #2712]
	str	r2, [fp, #2716]
	ldr	r1, [sp, #1044]
	ldr	r2, [sp, #1048]
	str	r3, [fp, #2740]
	ldr	r3, [sp, #1068]
	str	r0, [fp, #2812]
	str	r1, [fp, #2748]
	str	r2, [fp, #2756]
	str	r3, [fp, #2760]
	ldr	r3, [sp, #964]
	mov	r2, #1
	str	r3, [fp, #2796]
	mov	r3, #1
	str	r2, [fp, #2788]
	str	r3, [fp, #2836]
	ldr	r2, [sp, #956]
	ldr	r3, .L86+288
	str	r2, [fp, #2808]
	add	r2, sl, r3
	ldr	r3, .L86+292
	str	r2, [fp, #2880]
	add	r2, sl, r3
	ldr	r1, .L86+296
	str	r2, [fp, #2928]
	ldr	r2, .L86+300
	mov	r3, #61
	str	r1, [fp, #2764]
	str	r3, [fp, #2936]
	ldr	r1, [sp, #960]
	add	r3, sl, r2
	str	r3, [fp, #2976]
	ldr	r3, .L86+304
	str	r1, [fp, #2804]
	str	r1, [fp, #2844]
	mov	r2, #202
	ldr	r1, .L86+308
	str	r2, [fp, #3004]
	add	r2, sl, r3
	mov	r3, #63
	str	r1, [fp, #2908]
	str	r3, [fp, #3032]
	ldr	r1, [sp, #1076]
	ldr	r3, [sp, #964]
	str	r2, [fp, #3024]
	str	r1, [r3, #16]
	ldr	r2, [sp, #708]
	ldr	r3, [sp, #344]
	ldr	r1, [sp, #964]
	str	r3, [r2, #16]
	ldr	r3, [sp, #1088]
	ldr	r2, [sp, #712]
	str	r1, [fp, #2852]
	str	r3, [r2, #16]
	ldr	r1, [sp, #816]
	ldr	r2, [sp, #340]
	ldr	r3, [sp, #820]
	str	r2, [r1, #16]
	ldr	r1, [sp, #336]
	str	r1, [r3, #16]
	ldr	r2, [sp, #1080]
	mov	r3, #220
	str	r2, [fp, #2856]
	mov	r2, #60
	str	r3, [fp, #2860]
	str	r2, [fp, #2888]
	ldr	r3, [sp, #712]
	ldr	r2, [sp, #704]
	mov	r1, #1
	str	r3, [fp, #2892]
	str	r2, [fp, #2904]
	mov	r3, #1
	ldr	r2, [sp, #1092]
	str	r1, [fp, #2884]
	str	r3, [fp, #2932]
	ldr	r1, [sp, #708]
	add	r3, r3, #224
	str	r2, [fp, #2952]
	str	r3, [fp, #2956]
	mov	r2, #62
	ldr	r3, [sp, #820]
	str	r1, [fp, #2900]
	str	r1, [fp, #2940]
	str	r2, [fp, #2984]
	ldr	r1, [sp, #712]
	ldr	r2, [sp, #796]
	str	r3, [fp, #2988]
	mov	r3, #1
	str	r1, [fp, #2948]
	str	r2, [fp, #3000]
	mov	r1, #1
	ldr	r2, [sp, #1096]
	str	r3, [fp, #3028]
	ldr	r3, [sp, #332]
	str	r1, [fp, #2980]
	ldr	r1, [sp, #816]
	str	r3, [r2, #16]
	ldr	r3, .L86+312
	str	r1, [fp, #2996]
	str	r1, [fp, #3036]
	ldr	r1, [sp, #820]
	add	r2, sl, r3
	str	r1, [fp, #3044]
	str	r2, [fp, #3072]
	ldr	r2, [sp, #328]
	ldr	r1, [sp, #1100]
	mov	r3, #64
	str	r2, [r1, #16]
	str	r3, [fp, #3080]
	ldr	r1, [sp, #324]
	ldr	r3, [sp, #992]
	str	r1, [r3, #16]
	ldr	r3, .L86+316
	ldr	r1, [sp, #320]
	add	r2, sl, r3
	ldr	r3, .L86+320
	str	r2, [fp, #3120]
	add	r2, sl, r3
	mov	r3, #66
	str	r3, [fp, #3176]
	ldr	r3, .L86+324
	str	r2, [fp, #3168]
	mov	r2, #200
	str	r2, [fp, #3196]
	add	r2, sl, r3
	mov	r3, #67
	str	r3, [fp, #3224]
	ldr	r3, [sp, #996]
	str	r2, [fp, #3216]
	str	r1, [r3, #16]
	ldr	r2, [sp, #1100]
	ldr	r3, [sp, #1096]
	ldr	r1, [sp, #996]
	str	r2, [fp, #3084]
	str	r3, [fp, #3132]
	ldr	r2, [sp, #992]
	ldr	r3, [sp, #1092]
	str	r1, [fp, #3180]
	ldr	r1, [sp, #1096]
	str	r2, [fp, #3228]
	str	r3, [fp, #3048]
	ldr	r2, [sp, #1112]
	ldr	r3, [sp, #1100]
	str	r1, [fp, #3092]
	ldr	r1, [sp, #1120]
	str	r2, [fp, #3096]
	str	r3, [fp, #3140]
	str	r1, [fp, #3144]
	ldr	r3, [sp, #972]
	ldr	r2, [sp, #992]
	mov	r1, #230
	str	r1, [fp, #3052]
	str	r3, [fp, #3192]
	sub	r1, r1, #165
	mov	r3, #222
	str	r3, [fp, #3100]
	str	r1, [fp, #3128]
	str	r2, [fp, #3188]
	ldr	r1, [sp, #996]
	mov	r2, #1
	sub	r3, r3, #221
	str	r2, [fp, #3076]
	str	r2, [fp, #3124]
	str	r3, [fp, #3172]
	add	r2, r2, #202
	str	r3, [fp, #3220]
	add	r3, r3, #219
	str	r2, [fp, #3148]
	str	r3, [r1, #28]
	ldr	r2, [sp, #1008]
	ldr	r3, .L86+328
	str	r2, [r1, #24]
	add	r2, sl, r3
	add	r3, fp, #3696
	str	r3, [sp, #1128]
	ldr	r3, [sp, #1008]
	str	r1, [r1, #20]
	add	r0, r3, #16
	ldr	r3, [sp, #932]
	add	r1, fp, #3552
	add	r3, r3, #16
	str	r3, [sp, #312]
	ldr	r3, [sp, #1044]
	str	r1, [sp, #1052]
	ldr	r1, [sp, #1012]
	str	r2, [ip, #3264]!
	add	r3, r3, #16
	add	r2, fp, #3504
	str	r2, [sp, #1124]
	str	r3, [sp, #300]
	add	r2, r1, #16
	mov	r3, #68
	ldr	r1, [sp, #1040]
	str	r3, [ip, #8]
	ldr	r3, .L86+332
	add	r1, r1, #16
	str	r1, [sp, #316]
	str	r2, [ip, #16]
	add	r1, fp, #3712
	add	r2, sl, r3
	ldr	r3, [sp, #1020]
	str	r1, [sp, #304]
	add	r1, fp, #4480
	str	r1, [sp, #296]
	str	r2, [r3, #0]
	str	r0, [r3, #16]
	ldr	r3, .L86+336
	ldr	r1, [sp, #944]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, .L86+340
	ldr	r2, [sp, #316]
	str	ip, [ip, #20]
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r1, [sp, #312]
	ldr	r3, [sp, #940]
	mov	r0, fp
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L86+344
	ldr	r1, .L86+376
	add	r2, sl, r3
	ldr	r3, [sp, #1016]
	str	r2, [fp, #3456]
	ldr	r2, [sp, #1020]
	str	r3, [ip, #24]
	mov	r3, #69
	str	r1, [ip, #28]
	str	r3, [r2, #8]
	ldr	r3, [sp, #1000]
	sub	r1, r1, #201
	str	r2, [ip, #12]
	str	r1, [r2, #28]
	str	ip, [r2, #12]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	ldr	r3, .L86+348
	ldr	r2, [sp, #944]
	sub	r1, r1, #73
	str	r3, [r2, #28]
	ldr	r3, [sp, #940]
	str	r1, [ip, #4]
	str	r3, [r2, #12]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #944]
	str	r1, [r2, #4]
	add	r1, r1, #69
	str	r1, [r3, #8]
	ldr	r2, [sp, #940]
	ldr	r3, .L86+352
	str	r3, [r2, #28]
	mov	r3, #71
	str	r3, [r2, #8]
	ldr	r1, [sp, #944]
	ldr	r2, [sp, #1036]
	ldr	r3, [sp, #940]
	str	r2, [r1, #24]
	str	r1, [r1, #20]
	mov	r2, #1
	str	r1, [r3, #12]
	ldr	r3, [sp, #948]
	str	r2, [r1, #4]
	ldr	r1, [sp, #940]
	add	r3, r3, #16
	str	r2, [r1, #4]
	str	r3, [sp, #1132]
	ldr	r2, [sp, #936]
	mov	r3, #1
	str	r3, [fp, #3460]
	add	r3, r3, #71
	str	r2, [r1, #24]
	str	r1, [r1, #20]
	ldr	r2, [sp, #1124]
	ldr	r1, [sp, #308]
	str	r3, [fp, #3464]
	ldr	r3, [sp, #304]
	str	r1, [lr, #16]
	str	r3, [r2, #16]
	ldr	r3, .L86+356
	ldr	r1, [sp, #1052]
	add	r2, sl, r3
	str	r2, [fp, #3504]
	ldr	r2, [sp, #300]
	mov	r3, #73
	str	r2, [r1, #16]
	ldr	r2, .L86+360
	str	r3, [fp, #3512]
	add	r3, sl, r2
	str	r3, [fp, #3552]
	ldr	r3, [sp, #1048]
	mov	r1, #284
	str	r3, [fp, #3576]
	ldr	r3, .L86+364
	str	r1, [fp, #3580]
	add	r2, sl, r3
	mov	r3, #75
	str	r2, [fp, #3600]
	str	r3, [fp, #3608]
	ldr	r2, [sp, #1056]
	ldr	r3, [sp, #296]
	str	r3, [r2, #16]
	ldr	r3, .L86+368
	str	r2, [fp, #3620]
	add	r2, sl, r3
	str	r2, [fp, #3648]
	ldr	r2, [sp, #1068]
	mov	r3, #76
	str	r2, [fp, #3480]
	ldr	r2, [sp, #1124]
	ldr	r1, [sp, #1124]
	str	r3, [fp, #3656]
	add	r3, r3, #139
	str	r3, [fp, #3484]
	str	r2, [fp, #3524]
	add	r3, r3, #60
	ldr	r2, [sp, #1056]
	str	r1, [fp, #3468]
	str	r3, [fp, #3532]
	mov	r1, #1
	ldr	r3, [sp, #1052]
	str	r1, [fp, #3508]
	str	r1, [fp, #3556]
	str	r2, [fp, #3564]
	add	r1, r1, #73
	ldr	r2, [sp, #1072]
	str	r1, [fp, #3560]
	str	r3, [fp, #3572]
	sub	r1, r1, #73
	str	r3, [fp, #3612]
	mov	r3, #65
	str	r1, [fp, #3604]
	str	r2, [fp, #3624]
	str	r3, [fp, #3628]
	ldr	r2, [sp, #764]
	str	r1, [fp, #3652]
	ldr	r3, .L86+372
	ldr	r1, [sp, #1128]
	str	lr, [fp, #3476]
	str	r1, [fp, #3660]
	add	r1, r2, #16
	add	r2, sl, r3
	ldr	r3, [sp, #656]
	str	r2, [r0, #3840]!
	add	r3, r3, #16
	str	r3, [sp, #288]
	add	r2, fp, #3792
	add	r3, fp, #3520
	str	lr, [fp, #3516]
	str	r4, [fp, #3528]
	str	r2, [sp, #1116]
	str	r3, [sp, #292]
	add	r3, fp, #5952
	str	r3, [sp, #1136]
	add	r3, fp, #6080
	str	r3, [sp, #1140]
	add	r2, fp, #5440
	mov	r3, #77
	str	r2, [r4, #16]
	str	r3, [fp, #3704]
	ldr	r2, [sp, #1128]
	ldr	r3, [sp, #292]
	str	r4, [fp, #3708]
	str	r3, [r2, #16]
	ldr	r3, .L86+376
	ldr	r2, [sp, #1120]
	str	r3, [fp, #3724]
	sub	r3, r3, #197
	str	r3, [fp, #3752]
	ldr	r3, .L86+380
	str	r1, [r2, #16]
	str	r2, [fp, #3804]
	mov	r2, #203
	str	r2, [fp, #3820]
	add	r2, sl, r3
	ldr	r3, .L86+384
	str	r2, [fp, #3696]
	add	r2, sl, r3
	ldr	r3, .L86+388
	ldr	r1, [sp, #1116]
	str	r2, [fp, #3744]
	add	r2, sl, r3
	ldr	r3, [sp, #288]
	str	r7, [r1, #16]
	str	r2, [fp, #3792]
	str	r3, [r0, #16]
	ldr	r2, [sp, #1140]
	ldr	r3, [sp, #1084]
	add	r1, r5, #48
	add	r2, r2, #16
	str	r3, [fp, #3672]
	ldr	r3, [sp, #1128]
	str	r1, [sp, #1136]
	str	r2, [sp, #1140]
	mov	r1, #62
	mov	r2, #1
	str	r1, [fp, #3676]
	str	r2, [fp, #3700]
	str	r3, [fp, #3716]
	str	lr, [fp, #3720]
	str	r4, [fp, #3668]
	str	r2, [fp, #3748]
	ldr	r3, [sp, #768]
	ldr	r2, [sp, #1120]
	ldr	r1, [sp, #1116]
	str	r3, [fp, #3768]
	mov	r3, #79
	str	r2, [fp, #3764]
	str	r3, [fp, #3800]
	mov	r2, #1
	sub	r3, r3, #77
	str	r1, [fp, #3756]
	str	r2, [fp, #3796]
	mov	r1, #230
	str	r3, [r0, #4]
	ldr	r3, [sp, #636]
	str	r1, [fp, #3772]
	ldr	r2, [sp, #1096]
	ldr	r1, [sp, #1116]
	add	r3, r3, #16
	str	r1, [fp, #3812]
	str	r2, [fp, #3816]
	mov	r1, #1
	ldr	r2, [sp, #652]
	str	r3, [r0, #32]
	ldr	r3, .L86+392
	str	r1, [r0, #8]
	ldr	r1, [sp, #652]
	str	r2, [r0, #12]
	add	r2, sl, r3
	ldr	r3, .L86+396
	str	r2, [r1, #0]
	add	r2, r1, #16
	str	r2, [sp, #284]
	add	r2, sl, r3
	mov	r3, fp
	str	r2, [r3, #3936]!
	ldr	r1, [sp, #612]
	ldr	r2, [sp, #592]
	add	r1, r1, #16
	add	r2, r2, #16
	str	r3, [sp, #624]
	str	r1, [sp, #280]
	str	r2, [sp, #276]
	ldr	r3, [sp, #580]
	ldr	r1, [sp, #628]
	ldr	r2, [sp, #668]
	add	r3, r3, #16
	add	r1, r1, #16
	add	r2, r2, #16
	str	r3, [sp, #272]
	str	r1, [sp, #268]
	str	r0, [r0, #20]
	str	r2, [sp, #260]
	ldr	r3, [sp, #540]
	ldr	r1, [sp, #1076]
	add	r3, r3, #16
	add	r1, r1, #16
	str	r3, [sp, #252]
	str	r1, [sp, #244]
	ldr	r2, [sp, #956]
	ldr	r3, [sp, #904]
	ldr	r1, [sp, #964]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #236]
	str	r3, [sp, #232]
	str	r1, [sp, #224]
	ldr	r2, [sp, #864]
	ldr	r3, [sp, #1036]
	ldr	r1, [sp, #1016]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #220]
	str	r3, [sp, #188]
	str	r1, [sp, #184]
	ldr	r2, [sp, #1068]
	ldr	r3, [sp, #756]
	ldr	r1, [sp, #996]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #180]
	str	r3, [sp, #176]
	str	r1, [sp, #172]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #936]
	ldr	r1, [sp, #688]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #168]
	str	r3, [sp, #160]
	str	r1, [sp, #152]
	ldr	r2, [sp, #748]
	ldr	r3, [sp, #1132]
	ldr	r1, [sp, #924]
	add	r2, r2, #16
	add	r3, r3, #16
	add	r1, r1, #16
	str	r2, [sp, #148]
	str	r3, [sp, #136]
	str	r1, [sp, #132]
	ldr	r2, [sp, #556]
	ldr	r3, [sp, #876]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #128]
	str	r3, [sp, #124]
	ldr	r1, [sp, #576]
	ldr	r2, [sp, #704]
	ldr	r3, [sp, #732]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #116]
	str	r2, [sp, #112]
	str	r3, [sp, #108]
	ldr	r1, [sp, #916]
	ldr	r2, [sp, #712]
	ldr	r3, [sp, #820]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #104]
	str	r2, [sp, #100]
	str	r3, [sp, #96]
	ldr	r1, [sp, #892]
	ldr	r2, [sp, #968]
	ldr	r3, [sp, #868]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #84]
	str	r2, [sp, #80]
	str	r3, [sp, #76]
	ldr	r1, [sp, #740]
	ldr	r2, [sp, #796]
	ldr	r3, [sp, #972]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #68]
	str	r2, [sp, #60]
	str	r3, [sp, #48]
	ldr	r1, [sp, #1096]
	ldr	r2, [sp, #812]
	ldr	r3, [sp, #844]
	add	r1, r1, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	r1, [sp, #40]
	str	r2, [sp, #36]
	str	r3, [sp, #20]
	ldr	r1, [sp, #676]
	ldr	r3, [sp, #644]
	add	r1, r1, #16
	str	r1, [sp, #16]
	add	r3, r3, #16
	ldr	r1, [sp, #604]
	str	r3, [sp, #8]
	ldr	r3, [sp, #896]
	add	r1, r1, #16
	str	r1, [sp, #4]
	add	r3, r3, #16
	ldr	r1, [sp, #672]
	str	r3, [sp, #264]
	ldr	r3, [sp, #848]
	add	r1, r1, #16
	str	r1, [sp, #256]
	add	r3, r3, #16
	ldr	r1, [sp, #908]
	str	r3, [sp, #248]
	ldr	r3, [sp, #872]
	add	r1, r1, #16
	str	r1, [sp, #240]
	add	r3, r3, #16
	add	r1, fp, #3616
	str	r3, [sp, #228]
	str	r1, [sp, #212]
	add	r3, fp, #2752
	add	r1, fp, #3472
	str	r3, [sp, #204]
	str	r1, [sp, #200]
	ldr	r3, [sp, #1032]
	ldr	r1, [sp, #544]
	ldr	r2, [sp, #532]
	add	r3, r3, #16
	add	r1, r1, #16
	str	r3, [sp, #192]
	str	r1, [sp, #164]
	add	r3, fp, #16
	add	r1, fp, #3760
	add	r2, r2, #16
	str	r3, [sp, #156]
	str	r1, [sp, #144]
	ldr	r3, [sp, #920]
	ldr	r1, [sp, #912]
	str	r2, [sp, #12]
	ldr	r2, [sp, #620]
	add	r3, r3, #16
	add	r1, r1, #16
	add	r2, r2, #16
	str	r3, [sp, #140]
	str	r1, [sp, #120]
	add	r3, fp, #3664
	add	r1, r5, #16
	str	r2, [sp, #0]
	str	r3, [sp, #88]
	str	r1, [sp, #72]
	ldr	r3, [sp, #840]
	ldr	r1, [sp, #1112]
	add	r3, r3, #16
	add	r1, r1, #16
	str	r3, [sp, #64]
	str	r1, [sp, #56]
	add	r3, r6, #16
	ldr	r1, [sp, #988]
	str	r3, [sp, #52]
	ldr	r3, [sp, #660]
	add	r1, r1, #16
	str	r3, [r0, #24]
	str	r1, [sp, #44]
	ldr	r3, .L89
	ldr	r1, [sp, #632]
	str	r3, [r0, #28]
	str	r1, [r0, #40]
	ldr	r3, [sp, #652]
	mov	r1, #210
	str	r1, [r0, #44]
	add	r2, fp, #3952
	sub	r1, r1, #209
	str	r2, [r3, #16]
	str	r1, [r3, #8]
	ldr	r3, .L89+4
	ldr	r1, [sp, #624]
	add	r2, sl, r3
	ldr	r3, [sp, #628]
	str	r0, [r0, #36]
	str	r2, [r3, #0]
	ldr	r2, [sp, #284]
	ldr	r3, [sp, #280]
	str	r2, [r1, #16]
	str	r3, [r1, #32]
	ldr	r2, [sp, #276]
	ldr	r3, [sp, #652]
	ldr	r1, [sp, #628]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r2, [r1, #16]
	ldr	r1, [sp, #624]
	ldr	r2, [sp, #608]
	str	r0, [r1, #24]
	str	r2, [r1, #40]
	ldr	r2, [sp, #624]
	mov	r1, #191
	str	r1, [r3, #28]
	str	r1, [r2, #28]
	ldr	r1, [sp, #628]
	str	r3, [r3, #20]
	mov	r3, #211
	str	r1, [r2, #12]
	str	r3, [r2, #44]
	ldr	r2, [sp, #652]
	ldr	r1, [sp, #624]
	sub	r3, r3, #208
	str	r3, [r2, #4]
	mov	r2, #2
	str	r2, [r1, #8]
	str	r2, [r1, #4]
	str	r1, [r1, #20]
	str	r1, [r1, #36]
	ldr	r1, [sp, #628]
	str	r2, [r1, #8]
	ldr	r2, [sp, #624]
	str	r3, [r1, #4]
	ldr	r3, [sp, #596]
	str	r2, [r1, #12]
	mov	r2, #182
	str	r3, [r1, #24]
	str	r2, [r1, #28]
	ldr	r3, [sp, #588]
	str	r1, [r1, #20]
	ldr	r1, [sp, #584]
	add	r2, r2, #34
	str	r1, [r3, #24]
	ldr	r1, [sp, #624]
	str	r2, [r3, #28]
	sub	r2, r2, #34
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	ldr	r3, .L89+8
	ldr	r1, [sp, #272]
	add	r2, sl, r3
	ldr	r3, [sp, #588]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r2, [sp, #268]
	ldr	r1, [sp, #264]
	str	r2, [r3, #32]
	ldr	r3, .L89+12
	add	r2, sl, r3
	ldr	r3, [sp, #596]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L89+16
	ldr	r1, [sp, #260]
	add	r2, sl, r3
	ldr	r3, [sp, #680]
	str	r2, [r3, #0]
	ldr	r2, [sp, #256]
	str	r1, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L89+20
	ldr	r1, [sp, #588]
	add	r2, sl, r3
	ldr	r3, [sp, #688]
	str	r2, [r3, #0]
	ldr	r2, [sp, #596]
	mov	r3, #3
	str	r2, [r1, #12]
	str	r3, [r1, #8]
	mov	r1, #145
	str	r1, [r2, #28]
	ldr	r3, [sp, #596]
	ldr	r2, [sp, #588]
	sub	r1, r1, #142
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r2, [sp, #680]
	str	r1, [r3, #8]
	mov	r3, #260
	ldr	r1, [sp, #596]
	str	r3, [r2, #28]
	ldr	r2, [sp, #892]
	str	r1, [r1, #20]
	str	r2, [r1, #24]
	ldr	r3, [sp, #680]
	ldr	r1, [sp, #664]
	str	r1, [r3, #24]
	ldr	r2, [sp, #588]
	ldr	r1, [sp, #680]
	mov	r3, #2
	str	r3, [r2, #4]
	ldr	r3, [sp, #596]
	mov	r2, #4
	str	r2, [r1, #8]
	mov	r1, #3
	ldr	r2, [sp, #680]
	str	r1, [r3, #4]
	ldr	r3, [sp, #688]
	sub	r1, r1, #1
	str	r3, [r2, #12]
	ldr	r3, [sp, #676]
	str	r1, [r2, #4]
	add	r1, r1, #213
	str	r3, [r2, #40]
	str	r1, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	ldr	r2, [sp, #688]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r1, [sp, #252]
	ldr	r3, .L89+24
	str	r1, [r2, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #860]
	ldr	r1, [sp, #248]
	str	r2, [r3, #0]
	ldr	r2, [sp, #244]
	str	r1, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L89+28
	ldr	r1, [sp, #240]
	add	r2, sl, r3
	ldr	r3, [sp, #868]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L89+32
	ldr	r1, [sp, #236]
	add	r2, sl, r3
	ldr	r3, [sp, #884]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r2, [sp, #688]
	ldr	r3, [sp, #680]
	str	r3, [r2, #12]
	ldr	r1, [sp, #544]
	mov	r3, #4
	str	r1, [r2, #24]
	mov	r1, #185
	str	r3, [r2, #8]
	str	r1, [r2, #28]
	str	r2, [r2, #20]
	ldr	r1, [sp, #868]
	ldr	r2, [sp, #860]
	add	r3, r3, #222
	str	r1, [r2, #12]
	str	r3, [r2, #28]
	ldr	r1, [sp, #1080]
	ldr	r3, [sp, #844]
	str	r1, [r2, #40]
	str	r3, [r2, #24]
	ldr	r1, .L89+36
	mov	r3, #5
	str	r3, [r2, #8]
	ldr	r3, [sp, #868]
	str	r1, [r2, #44]
	sub	r1, r1, #332
	str	r1, [r2, #4]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r2, [sp, #900]
	ldr	r1, [sp, #952]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	ldr	r3, [sp, #884]
	ldr	r2, [sp, #868]
	str	r1, [r3, #24]
	mov	r3, #3
	mov	r1, #5
	str	r3, [r2, #4]
	str	r1, [r2, #8]
	add	r3, r3, #184
	ldr	r1, [sp, #884]
	str	r3, [r2, #28]
	mov	r2, #2
	str	r2, [r1, #4]
	sub	r3, r3, #181
	ldr	r2, [sp, #880]
	str	r3, [r1, #8]
	add	r3, r3, #217
	str	r2, [r1, #12]
	str	r3, [r1, #28]
	ldr	r2, [sp, #232]
	ldr	r3, .L89+40
	str	r1, [r1, #20]
	str	r2, [r1, #32]
	add	r2, sl, r3
	ldr	r1, [sp, #228]
	ldr	r3, [sp, #880]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L89+44
	ldr	r1, [sp, #1072]
	add	r2, sl, r3
	ldr	r3, [sp, #1072]
	str	r2, [r3, #0]
	ldr	r3, .L89+48
	ldr	r2, .L89+52
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L89+56
	add	r2, r2, #48
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r2, [sp, #224]
	ldr	r3, [sp, #220]
	str	r2, [r1, #16]
	str	r3, [r1, #32]
	ldr	r2, [sp, #212]
	ldr	r1, [sp, #1080]
	ldr	r3, [sp, #884]
	str	r2, [r1, #16]
	ldr	r1, [sp, #908]
	ldr	r2, [sp, #880]
	str	r1, [r3, #40]
	ldr	r1, .L89+60
	str	r3, [r3, #36]
	str	r1, [r3, #44]
	str	r3, [r2, #12]
	mov	r1, #79
	mov	r3, #6
	str	r3, [r2, #8]
	str	r1, [r2, #28]
	ldr	r2, [sp, #1072]
	add	r3, r3, #328
	str	r3, [r2, #44]
	ldr	r1, [sp, #880]
	ldr	r2, [sp, #876]
	str	r1, [r1, #20]
	str	r2, [r1, #24]
	ldr	r3, [sp, #1072]
	ldr	r1, [sp, #960]
	ldr	r2, [sp, #1080]
	str	r1, [r3, #24]
	str	r2, [r3, #12]
	ldr	r3, [sp, #880]
	ldr	r2, [sp, #1072]
	mov	r1, #3
	str	r1, [r3, #4]
	mov	r3, #7
	add	r1, r1, #217
	str	r3, [r2, #8]
	str	r1, [r2, #28]
	str	r2, [r2, #20]
	ldr	r2, [sp, #1080]
	add	r3, r3, #58
	sub	r1, r1, #213
	str	r3, [r2, #28]
	str	r1, [r2, #8]
	ldr	r3, [sp, #868]
	ldr	r2, [sp, #1072]
	ldr	r1, [sp, #1080]
	str	r3, [r2, #40]
	str	r2, [r2, #36]
	str	r2, [r1, #12]
	ldr	r2, [sp, #1052]
	ldr	r3, [sp, #1072]
	str	r2, [r1, #24]
	ldr	r2, [sp, #1080]
	mov	r1, #2
	str	r1, [r3, #4]
	mov	r3, #3
	str	r3, [r2, #4]
	str	r2, [r2, #20]
	ldr	r2, [sp, #1060]
	ldr	r3, .L89+64
	str	r1, [r2, #4]
	ldr	r2, .L89+68
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r1, .L89+72
	ldr	r3, [sp, #1060]
	ldr	r2, [sp, #1044]
	str	r1, [r3, #28]
	str	r2, [r3, #24]
	ldr	r1, [sp, #1124]
	ldr	r2, [sp, #204]
	str	r1, [r3, #40]
	ldr	r1, [sp, #200]
	str	r2, [r3, #16]
	str	r1, [r3, #32]
	ldr	r3, .L89+76
	ldr	r1, [sp, #1068]
	add	r2, sl, r3
	ldr	r3, [sp, #1024]
	str	r2, [r3, #0]
	ldr	r2, [sp, #192]
	ldr	r3, .L89+80
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #1032]
	ldr	r1, [sp, #1024]
	str	r2, [r3, #0]
	ldr	r2, [sp, #188]
	ldr	r3, [sp, #184]
	str	r2, [r1, #16]
	str	r3, [r1, #32]
	ldr	r2, [sp, #1068]
	ldr	r1, [sp, #1060]
	mov	r3, #8
	str	r2, [r1, #12]
	mov	r2, #215
	str	r3, [r1, #8]
	str	r2, [r1, #44]
	ldr	r1, [sp, #1068]
	ldr	r2, [sp, #1060]
	str	r3, [r1, #8]
	add	r3, r3, #185
	str	r3, [r1, #28]
	str	r2, [r2, #20]
	ldr	r1, [sp, #1024]
	str	r2, [r2, #36]
	ldr	r2, .L89+84
	add	r3, r3, #20
	str	r2, [r1, #28]
	str	r3, [r1, #44]
	ldr	r2, [sp, #1060]
	ldr	r1, [sp, #1068]
	str	r2, [r1, #12]
	ldr	r3, [sp, #1024]
	str	r1, [r1, #20]
	str	r3, [r1, #24]
	ldr	r2, [sp, #1012]
	ldr	r1, [sp, #1040]
	str	r2, [r3, #40]
	str	r1, [r3, #24]
	ldr	r3, [sp, #1068]
	mov	r1, #3
	ldr	r2, [sp, #1024]
	str	r1, [r3, #4]
	ldr	r1, [sp, #1032]
	mov	r3, #9
	str	r3, [r2, #8]
	str	r3, [r1, #8]
	sub	r3, r3, #7
	str	r1, [r2, #12]
	str	r3, [r2, #4]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	ldr	r3, [sp, #1024]
	mov	r2, #3
	str	r2, [r1, #4]
	add	r2, r2, #190
	str	r3, [r1, #12]
	str	r2, [r1, #28]
	ldr	r3, [sp, #1060]
	ldr	r2, [sp, #180]
	str	r3, [r1, #24]
	str	r2, [r1, #16]
	ldr	r3, [sp, #1000]
	ldr	r1, [sp, #752]
	mov	r2, #223
	str	r1, [r3, #24]
	ldr	r1, [sp, #992]
	str	r2, [r3, #28]
	str	r1, [r3, #40]
	ldr	r2, [sp, #176]
	ldr	r1, [sp, #172]
	str	r2, [r3, #16]
	str	r1, [r3, #32]
	ldr	r3, .L89+88
	ldr	r1, [sp, #1008]
	add	r2, sl, r3
	ldr	r3, [sp, #1000]
	str	r2, [r3, #0]
	ldr	r2, [sp, #168]
	ldr	r3, .L89+92
	str	r2, [r1, #16]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #948]
	ldr	r1, [sp, #164]
	str	r1, [r3, #16]
	ldr	r3, .L89+96
	ldr	r1, [sp, #928]
	add	r2, sl, r3
	ldr	r3, [sp, #948]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1032]
	str	r1, [r3, #32]
	ldr	r3, [sp, #1000]
	str	r2, [r2, #20]
	mov	r1, #10
	ldr	r2, [sp, #1008]
	str	r1, [r3, #8]
	add	r1, r1, #210
	str	r2, [r3, #12]
	str	r1, [r3, #44]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	sub	r1, r1, #210
	str	r3, [r2, #12]
	mov	r3, #74
	str	r3, [r2, #28]
	str	r1, [r2, #8]
	str	ip, [r2, #24]
	ldr	r2, [sp, #1000]
	ldr	r1, [sp, #1008]
	sub	r3, r3, #72
	str	r3, [r2, #4]
	ldr	r3, [sp, #948]
	mov	r2, #3
	str	r2, [r1, #4]
	str	r1, [r1, #20]
	sub	r2, r2, #1
	mov	r1, #11
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	ldr	r1, [sp, #536]
	add	r2, r2, #188
	str	r2, [r3, #28]
	str	r8, [r3, #12]
	str	r1, [r3, #24]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	ldr	r3, .L89+100
	str	r8, [r8, #20]
	add	r2, sl, r3
	ldr	r3, [sp, #160]
	str	r2, [r8, #0]
	str	r3, [r8, #16]
	ldr	r3, .L89+104
	add	r2, sl, r3
	ldr	r3, [sp, #152]
	str	r2, [r1, #0]
	str	r3, [r1, #32]
	ldr	r2, [sp, #156]
	ldr	r3, .L89+108
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r1, [sp, #544]
	ldr	r3, .L89+112
	str	r2, [r1, #0]
	add	r2, sl, r3
	ldr	r3, [sp, #760]
	ldr	r1, [sp, #948]
	str	r2, [r3, #0]
	ldr	r2, .L89+116
	mov	r3, #11
	str	r2, [r1, #44]
	ldr	r2, [sp, #564]
	str	r3, [r8, #8]
	ldr	r3, [sp, #932]
	str	r2, [r1, #40]
	str	r1, [r8, #12]
	ldr	r2, [sp, #680]
	ldr	r1, [sp, #536]
	str	r3, [r8, #24]
	mov	r3, #60
	str	r3, [r8, #28]
	str	r2, [r1, #40]
	add	r3, r3, #125
	mov	r2, #218
	str	r2, [r1, #28]
	str	r3, [r1, #44]
	mov	r1, #3
	str	r1, [r8, #4]
	ldr	r1, [sp, #544]
	ldr	r2, [sp, #536]
	sub	r3, r3, #173
	str	r3, [r2, #8]
	str	r3, [r1, #8]
	ldr	r3, [sp, #536]
	mov	r2, #190
	str	r1, [r3, #12]
	str	r2, [r1, #28]
	mov	r1, #2
	str	r1, [r3, #4]
	ldr	r2, [sp, #532]
	ldr	r1, [sp, #544]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r1, #12]
	ldr	r3, [sp, #1132]
	mov	r2, #3
	str	r2, [r1, #4]
	str	r3, [r1, #16]
	str	r8, [r1, #24]
	str	r1, [r1, #20]
	ldr	r1, [sp, #760]
	mov	r3, #13
	str	r3, [r1, #8]
	ldr	r3, [sp, #744]
	sub	r2, r2, #1
	str	r2, [r1, #4]
	str	r3, [r1, #24]
	ldr	r2, [sp, #768]
	ldr	r3, [sp, #1116]
	str	r2, [r1, #12]
	str	r3, [r1, #40]
	mov	r2, #214
	ldr	r3, [sp, #144]
	str	r2, [r1, #28]
	ldr	r2, [sp, #148]
	str	r3, [r1, #32]
	ldr	r3, .L89+120
	str	r2, [r1, #16]
	ldr	r1, [sp, #768]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, .L89+124
	ldr	r2, [sp, #140]
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #568]
	ldr	r1, [sp, #136]
	str	r2, [r3, #0]
	ldr	r2, [sp, #132]
	str	r1, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L89+128
	ldr	r1, [sp, #128]
	add	r2, sl, r3
	ldr	r3, [sp, #564]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r2, [sp, #760]
	ldr	r3, [sp, #768]
	mov	r1, #230
	str	r1, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	sub	r1, r1, #217
	str	r2, [r3, #12]
	mov	r2, #140
	str	r2, [r3, #28]
	str	r1, [r3, #8]
	ldr	r2, [sp, #568]
	ldr	r3, .L89+116
	ldr	r1, .L89+132
	str	r3, [r2, #28]
	str	r1, [r2, #44]
	ldr	r3, [sp, #924]
	ldr	r2, [sp, #768]
	ldr	r1, [sp, #568]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	ldr	r2, [sp, #920]
	ldr	r3, [sp, #768]
	str	r2, [r1, #40]
	str	r8, [r1, #24]
	ldr	r2, [sp, #568]
	mov	r1, #3
	str	r1, [r3, #4]
	mov	r3, #14
	str	r3, [r2, #8]
	ldr	r1, [sp, #564]
	str	r2, [r2, #20]
	str	r3, [r1, #8]
	sub	r3, r3, #12
	str	r1, [r2, #12]
	str	r3, [r2, #4]
	str	r2, [r2, #36]
	ldr	r3, [sp, #560]
	str	r2, [r1, #12]
	mov	r2, #3
	str	r2, [r1, #4]
	add	r2, r2, #59
	str	r2, [r1, #28]
	str	r3, [r1, #24]
	str	r1, [r1, #20]
	ldr	r3, [sp, #828]
	ldr	r1, [sp, #872]
	ldr	r2, .L89+136
	str	r1, [r3, #24]
	ldr	r1, .L89+140
	str	r2, [r3, #28]
	str	r1, [r3, #44]
	ldr	r2, [sp, #124]
	ldr	r1, [sp, #120]
	str	r2, [r3, #16]
	str	r1, [r3, #32]
	ldr	r3, .L89+144
	ldr	r1, [sp, #824]
	add	r2, sl, r3
	ldr	r3, [sp, #828]
	str	r2, [r3, #0]
	ldr	r2, [sp, #116]
	ldr	r3, .L89+148
	str	r2, [r1, #16]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #716]
	ldr	r1, [sp, #112]
	str	r1, [r3, #16]
	ldr	r3, .L89+152
	ldr	r1, [sp, #108]
	add	r2, sl, r3
	ldr	r3, [sp, #716]
	str	r2, [r3, #0]
	str	r1, [r3, #32]
	ldr	r2, [sp, #828]
	ldr	r3, [sp, #824]
	ldr	r1, [sp, #916]
	str	r3, [r2, #12]
	str	r1, [r2, #40]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r2, [sp, #572]
	ldr	r1, [sp, #700]
	str	r2, [r3, #24]
	ldr	r3, [sp, #716]
	ldr	r2, [sp, #728]
	str	r1, [r3, #24]
	str	r2, [r3, #40]
	ldr	r2, [sp, #824]
	ldr	r3, [sp, #828]
	mov	r1, #15
	str	r1, [r3, #8]
	str	r1, [r2, #8]
	mov	r3, #70
	ldr	r1, [sp, #828]
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	ldr	r3, [sp, #716]
	mov	r2, #2
	str	r2, [r1, #4]
	ldr	r2, [sp, #824]
	mov	r1, #16
	str	r1, [r3, #8]
	mov	r3, #3
	ldr	r1, [sp, #716]
	str	r3, [r2, #4]
	ldr	r2, [sp, #724]
	sub	r3, r3, #1
	str	r2, [r1, #12]
	str	r3, [r1, #4]
	mov	r2, #225
	add	r3, r3, #218
	str	r2, [r1, #28]
	str	r1, [r1, #20]
	str	r1, [r1, #36]
	str	r3, [r1, #44]
	ldr	r1, [sp, #724]
	ldr	r3, [sp, #716]
	sub	r2, r2, #79
	str	r3, [r1, #12]
	ldr	r3, [sp, #912]
	str	r2, [r1, #28]
	sub	r2, r2, #130
	str	r3, [r1, #24]
	str	r2, [r1, #8]
	ldr	r3, .L89+156
	ldr	r2, [sp, #104]
	str	r2, [r1, #16]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #1084]
	ldr	r1, [sp, #708]
	mov	r2, #225
	str	r1, [r3, #24]
	ldr	r1, [sp, #816]
	str	r2, [r3, #28]
	str	r1, [r3, #40]
	ldr	r3, .L89+160
	ldr	r1, [sp, #1084]
	add	r2, sl, r3
	ldr	r3, [sp, #1084]
	str	r2, [r3, #0]
	ldr	r3, .L89+164
	ldr	r2, .L89+168
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, [sp, #96]
	ldr	r2, [sp, #100]
	str	r3, [r1, #32]
	ldr	r3, .L89+172
	str	r2, [r1, #16]
	ldr	r1, [sp, #900]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #88]
	ldr	r2, [sp, #1092]
	str	r3, [r2, #16]
	ldr	r2, [sp, #84]
	ldr	r3, [sp, #724]
	str	r2, [r1, #16]
	mov	r1, #3
	str	r3, [r3, #20]
	ldr	r2, [sp, #1084]
	str	r1, [r3, #4]
	ldr	r3, [sp, #1092]
	ldr	r1, [sp, #1128]
	str	r3, [r2, #12]
	str	r1, [r3, #24]
	ldr	r1, [sp, #1092]
	mov	r3, #17
	str	r3, [r2, #8]
	add	r3, r3, #213
	str	r3, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	sub	r3, r3, #213
	str	r2, [r1, #12]
	mov	r2, #62
	str	r2, [r1, #28]
	str	r3, [r1, #8]
	ldr	r1, [sp, #1084]
	ldr	r3, [sp, #1092]
	sub	r2, r2, #60
	str	r2, [r1, #4]
	ldr	r2, [sp, #900]
	mov	r1, #3
	str	r3, [r3, #20]
	str	r1, [r3, #4]
	mov	r3, #18
	str	r3, [r2, #8]
	ldr	r3, [sp, #908]
	sub	r1, r1, #1
	str	r3, [r2, #12]
	ldr	r3, [sp, #880]
	str	r1, [r2, #4]
	ldr	r1, [sp, #896]
	str	r3, [r2, #40]
	ldr	r3, .L89+60
	str	r1, [r2, #24]
	mov	r1, #215
	str	r1, [r2, #28]
	str	r3, [r2, #44]
	ldr	r1, [sp, #908]
	ldr	r3, [sp, #860]
	str	r2, [r2, #20]
	mov	r2, #187
	str	r2, [r1, #28]
	str	r3, [r1, #24]
	ldr	r2, [sp, #80]
	ldr	r1, [sp, #900]
	ldr	r3, [sp, #908]
	str	r2, [r1, #32]
	ldr	r2, [sp, #76]
	mov	r1, #18
	str	r2, [r3, #16]
	str	r1, [r3, #8]
	ldr	r3, .L89+176
	ldr	r1, [sp, #832]
	add	r2, sl, r3
	ldr	r3, [sp, #908]
	str	r2, [r3, #0]
	ldr	r2, [sp, #72]
	ldr	r3, .L89+180
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #68]
	str	r2, [r1, #0]
	str	r3, [r1, #32]
	ldr	r3, .L89+184
	mov	r2, #228
	str	r2, [r1, #44]
	add	r2, sl, r3
	ldr	r1, [sp, #808]
	ldr	r3, [sp, #840]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r2, [sp, #900]
	ldr	r3, [sp, #908]
	str	r2, [r2, #36]
	ldr	r1, [sp, #832]
	str	r2, [r3, #12]
	ldr	r2, [sp, #736]
	str	r3, [r3, #20]
	str	r2, [r1, #40]
	mov	r1, #3
	ldr	r2, [sp, #832]
	str	r1, [r3, #4]
	ldr	r3, [sp, #840]
	ldr	r1, [sp, #1136]
	str	r3, [r2, #12]
	mov	r3, #2
	str	r2, [r2, #20]
	str	r1, [r2, #24]
	str	r3, [r2, #4]
	mov	r1, #153
	add	r3, r3, #228
	str	r1, [r2, #8]
	str	r3, [r2, #28]
	str	r2, [r2, #36]
	ldr	r2, [sp, #840]
	sub	r3, r3, #227
	str	r1, [r2, #8]
	ldr	r1, [sp, #832]
	str	r3, [r2, #4]
	ldr	r3, [sp, #812]
	str	r1, [r2, #12]
	mov	r1, #24
	str	r3, [r2, #24]
	str	r1, [r2, #28]
	ldr	r3, [sp, #832]
	str	r2, [r2, #20]
	ldr	r2, [sp, #804]
	ldr	r1, [sp, #800]
	str	r3, [r2, #24]
	mov	r3, #224
	str	r3, [r2, #44]
	ldr	r3, .L89+188
	str	r1, [r2, #40]
	ldr	r1, [sp, #804]
	add	r2, sl, r3
	ldr	r3, [sp, #60]
	str	r2, [r1, #0]
	ldr	r2, [sp, #64]
	str	r3, [r1, #32]
	ldr	r3, .L89+192
	str	r2, [r1, #16]
	ldr	r1, [sp, #812]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, .L89+196
	ldr	r2, [sp, #56]
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #980]
	ldr	r1, [sp, #52]
	str	r2, [r3, #0]
	ldr	r2, [sp, #48]
	str	r1, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L89+200
	ldr	r1, [sp, #804]
	add	r2, sl, r3
	ldr	r3, [sp, #988]
	str	r1, [r1, #20]
	str	r2, [r3, #0]
	ldr	r2, [sp, #812]
	mov	r3, #154
	str	r2, [r1, #12]
	mov	r2, #24
	str	r3, [r1, #8]
	str	r2, [r1, #28]
	ldr	r1, [sp, #812]
	ldr	r2, [sp, #804]
	str	r3, [r1, #8]
	ldr	r3, [sp, #1104]
	str	r2, [r2, #36]
	str	r3, [r1, #24]
	str	r2, [r1, #12]
	ldr	r2, [sp, #976]
	ldr	r1, [sp, #980]
	ldr	r3, [sp, #812]
	str	r2, [r1, #40]
	ldr	r2, [sp, #980]
	mov	r1, #32
	str	r1, [r3, #28]
	str	r3, [r3, #20]
	ldr	r1, [sp, #804]
	mov	r3, #227
	str	r3, [r2, #44]
	ldr	r3, [sp, #980]
	mov	r2, #2
	str	r2, [r1, #4]
	ldr	r2, [sp, #812]
	mov	r1, #155
	str	r1, [r3, #8]
	mov	r3, #3
	ldr	r1, [sp, #980]
	str	r3, [r2, #4]
	ldr	r2, [sp, #988]
	sub	r3, r3, #1
	str	r2, [r1, #12]
	str	r3, [r1, #4]
	str	r1, [r1, #20]
	ldr	r2, [sp, #1140]
	add	r3, r3, #245
	str	r2, [r1, #24]
	str	r3, [r1, #28]
	str	r1, [r1, #36]
	ldr	r1, [sp, #988]
	mov	r2, #3
	sub	r3, r3, #92
	stmib	r1, {r2, r3}	@ phole stm
	ldr	r2, [sp, #1108]
	ldr	r3, .L89+204
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #1104]
	mov	r1, #2
	str	r2, [r3, #0]
	str	r1, [r3, #4]
	ldr	r2, [sp, #44]
	ldr	r1, [sp, #40]
	str	r2, [r3, #16]
	str	r1, [r3, #32]
	ldr	r3, .L89+208
	mov	r1, #3
	add	r2, sl, r3
	ldr	r3, [sp, #1112]
	str	r2, [r3, #0]
	ldr	r2, [sp, #36]
	str	r1, [r3, #4]
	str	r2, [r3, #16]
	ldr	r3, .L89+212
	ldr	r1, [sp, #988]
	add	r2, sl, r3
	ldr	r3, [sp, #836]
	str	r2, [r5, #0]
	str	r3, [r5, #16]
	ldr	r2, [sp, #980]
	ldr	r3, [sp, #1112]
	str	r2, [r1, #12]
	str	r3, [r1, #24]
	str	r1, [r1, #20]
	ldr	r1, [sp, #1104]
	str	r2, [r1, #24]
	ldr	r2, [sp, #1100]
	str	r2, [r1, #40]
	ldr	r2, [sp, #1104]
	ldr	r3, [sp, #988]
	mov	r1, #24
	str	r1, [r3, #28]
	str	r1, [r2, #28]
	ldr	r1, [sp, #1112]
	mov	r3, #222
	str	r1, [r2, #12]
	str	r3, [r2, #44]
	ldr	r3, [sp, #1104]
	ldr	r2, [sp, #804]
	str	r3, [r3, #20]
	str	r2, [r1, #24]
	str	r3, [r3, #36]
	mov	r2, #156
	str	r3, [r1, #12]
	ldr	r1, [sp, #840]
	str	r2, [r3, #8]
	ldr	r3, [sp, #1112]
	str	r1, [r5, #24]
	mov	r1, #32
	str	r3, [r3, #20]
	str	r1, [r3, #28]
	str	r2, [r3, #8]
	mov	r3, #4
	add	r2, r2, #74
	str	r3, [r5, #4]
	ldr	r3, .L89+216
	str	r2, [r5, #28]
	ldr	r2, .L89+220
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L89+224
	add	r2, r2, #48
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L89+228
	add	r2, r2, #48
	add	r3, sl, r3
	ldr	r1, [sp, #1136]
	str	r3, [fp, r2]
	ldr	r2, [sp, #988]
	ldr	r3, .L89+232
	str	r1, [r5, #12]
	str	r5, [r5, #20]
	str	r5, [r1, #12]
	str	r2, [r6, #24]
	add	r2, sl, r3
	ldr	r3, [sp, #852]
	ldr	r1, [sp, #984]
	str	r2, [r3, #0]
	ldr	r3, .L89+236
	str	r1, [r6, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #856]
	mov	r1, #247
	str	r2, [r3, #0]
	ldr	r3, .L89+240
	str	r1, [r6, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #692]
	ldr	r1, [sp, #852]
	str	r2, [r3, #0]
	ldr	r3, .L89+244
	ldr	r2, [sp, #20]
	str	r3, [r1, #28]
	ldr	r3, .L89+248
	str	r2, [r1, #16]
	ldr	r1, [sp, #696]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #692]
	mov	r1, #320
	str	r3, [r2, #16]
	ldr	r3, .L89+252
	str	r1, [r2, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #548]
	ldr	r1, [sp, #1140]
	str	r2, [r3, #0]
	ldr	r3, [sp, #848]
	ldr	r2, [sp, #852]
	str	r1, [r6, #12]
	b	.L90
.L91:
	.align	2
.L89:
	.word	265
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	334
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.word	.LC95(GOTOFF)
	.word	4464
	.word	.LC96(GOTOFF)
	.word	338
	.word	.LC97(GOTOFF)
	.word	4560
	.word	291
	.word	.LC98(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	290
	.word	.LC100(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC103(GOTOFF)
	.word	.LC104(GOTOFF)
	.word	.LC105(GOTOFF)
	.word	.LC106(GOTOFF)
	.word	445
	.word	.LC107(GOTOFF)
	.word	.LC108(GOTOFF)
	.word	.LC109(GOTOFF)
	.word	314
	.word	411
	.word	305
	.word	.LC110(GOTOFF)
	.word	.LC111(GOTOFF)
	.word	.LC112(GOTOFF)
	.word	.LC113(GOTOFF)
	.word	.LC114(GOTOFF)
	.word	.LC115(GOTOFF)
	.word	5424
	.word	.LC116(GOTOFF)
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC119(GOTOFF)
	.word	.LC120(GOTOFF)
	.word	.LC121(GOTOFF)
	.word	.LC122(GOTOFF)
	.word	.LC123(GOTOFF)
	.word	.LC124(GOTOFF)
	.word	.LC125(GOTOFF)
	.word	.LC126(GOTOFF)
	.word	.LC127(GOTOFF)
	.word	6000
	.word	.LC128(GOTOFF)
	.word	.LC129(GOTOFF)
	.word	.LC130(GOTOFF)
	.word	.LC131(GOTOFF)
	.word	.LC132(GOTOFF)
	.word	410
	.word	.LC133(GOTOFF)
	.word	.LC134(GOTOFF)
	.word	.LC135(GOTOFF)
	.word	.LC136(GOTOFF)
	.word	.LC137(GOTOFF)
	.word	.LC138(GOTOFF)
	.word	.LC139(GOTOFF)
	.word	.LC140(GOTOFF)
	.word	.LC141(GOTOFF)
.L90:
	str	r6, [r6, #20]
	str	r6, [r1, #12]
	ldr	r1, [sp, #1136]
	str	r3, [r2, #24]
	mov	r2, #5
	ldr	r3, [sp, #852]
	str	r2, [r1, #4]
	ldr	r1, [sp, #856]
	str	r3, [r3, #20]
	str	r1, [r3, #12]
	str	r3, [r1, #12]
	ldr	r1, [sp, #672]
	ldr	r3, [sp, #692]
	sub	r2, r2, #1
	str	r2, [r6, #4]
	str	r1, [r3, #24]
	ldr	r2, [sp, #1140]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r1, [sp, #692]
	ldr	r2, [sp, #696]
	ldr	r3, [sp, #852]
	str	r2, [r1, #12]
	mov	r1, #4
	str	r1, [r3, #4]
	ldr	r2, [sp, #692]
	ldr	r3, [sp, #696]
	ldr	r1, [sp, #856]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	mov	r2, #5
	ldr	r3, [sp, #692]
	str	r2, [r1, #4]
	mov	r1, #4
	str	r1, [r3, #4]
	ldr	r3, [sp, #696]
	str	r2, [r3, #4]
	ldr	r2, [sp, #548]
	ldr	r3, .L89+256
	str	r1, [r2, #4]
	str	fp, [r2, #24]
	add	r2, sl, r3
	ldr	r3, [sp, #552]
	ldr	r1, [sp, #548]
	str	r2, [r3, #0]
	ldr	r2, [sp, #12]
	ldr	r3, .L89+260
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #772]
	str	r2, [r3, #0]
	ldr	r3, .L89+264
	mov	r2, #500
	str	r2, [r1, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #776]
	ldr	r1, [sp, #772]
	str	r2, [r3, #0]
	ldr	r2, [sp, #8]
	ldr	r3, .L89+268
	str	r2, [r1, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #780]
	str	r2, [r3, #0]
	mov	r2, #60
	str	r2, [r1, #28]
	ldr	r1, [sp, #4]
	str	r1, [r3, #16]
	ldr	r3, .L89+272
	ldr	r1, [sp, #788]
	add	r2, sl, r3
	ldr	r3, [sp, #784]
	str	r2, [r3, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L89+276
	str	r2, [r1, #16]
	add	r2, sl, r3
	str	r2, [r1, #0]
	ldr	r3, [sp, #548]
	ldr	r1, [sp, #552]
	str	r3, [r3, #20]
	str	r1, [r3, #12]
	ldr	r2, [sp, #772]
	str	r3, [r1, #12]
	ldr	r1, [sp, #776]
	ldr	r3, [sp, #640]
	str	r1, [r2, #12]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	ldr	r3, [sp, #600]
	str	r2, [r1, #12]
	ldr	r2, [sp, #780]
	ldr	r1, [sp, #552]
	str	r3, [r2, #24]
	mov	r2, #5
	str	r2, [r1, #4]
	ldr	r3, [sp, #780]
	ldr	r1, [sp, #784]
	ldr	r2, [sp, #772]
	str	r1, [r3, #12]
	mov	r3, #4
	str	r3, [r2, #4]
	ldr	r1, [sp, #780]
	ldr	r2, [sp, #784]
	str	r1, [r1, #20]
	str	r1, [r2, #12]
	ldr	r3, [sp, #776]
	ldr	r2, [sp, #780]
	mov	r1, #5
	str	r1, [r3, #4]
	mov	r3, #70
	sub	r1, r1, #1
	str	r1, [r2, #4]
	str	r3, [r2, #28]
	add	r1, sp, #784
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	str	r3, [r2, #12]
	ldr	r3, [sp, #788]
	mov	r2, #5
	str	r2, [r1, #4]
	mov	r1, #4
	ldr	r2, [sp, #616]
	str	r1, [r3, #4]
	ldr	r1, [sp, #792]
	str	r2, [r3, #24]
	mov	r2, #70
	str	r3, [r3, #20]
	str	r2, [r3, #28]
	str	r3, [r1, #12]
	ldr	r3, .L89+280
	add	r2, sl, r3
	mov	r3, #5
	stmia	r1, {r2, r3}	@ phole stm
	add	sp, sp, #120
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.size	init_trackb, .-init_trackb
	.section	.rodata.str1.4
	.align	2
.LC142:
	.ascii	"EN6\000"
	.align	2
.LC143:
	.ascii	"EX6\000"
	.align	2
.LC144:
	.ascii	"EN8\000"
	.align	2
.LC145:
	.ascii	"EX8\000"
	.text
	.align	2
	.global	init_tracka
	.type	init_tracka, %function
init_tracka:
	@ args = 0, pretend = 0, frame = 1172
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L99
	sub	sp, sp, #1168
	ldr	sl, .L99+4
	sub	sp, sp, #4
	mov	fp, r0
	mov	r2, r0
	mov	r9, #0
.L98:
	add	sl, pc, sl
.L93:
	sub	r3, r3, #1
	cmn	r3, #1
	strb	r9, [r2], #1
	bne	.L93
	add	r2, fp, #5056
	add	r3, fp, #4096
	str	r2, [sp, #580]
	str	r3, [sp, #692]
	add	r2, fp, #5248
	add	r3, fp, #5632
	str	r2, [sp, #744]
	str	r3, [sp, #832]
	add	r2, fp, #4672
	add	r3, fp, #5824
	str	r2, [sp, #1032]
	str	r3, [sp, #1136]
	ldr	r2, [sp, #580]
	ldr	r3, [sp, #692]
	add	r2, r2, #32
	add	r3, r3, #32
	str	r2, [sp, #580]
	str	r3, [sp, #692]
	ldr	r2, [sp, #744]
	ldr	r3, [sp, #832]
	add	r2, r2, #32
	add	r3, r3, #32
	str	r2, [sp, #744]
	str	r3, [sp, #832]
	ldr	r2, [sp, #1032]
	ldr	r3, [sp, #1136]
	add	r2, r2, #32
	add	r3, r3, #32
	str	r2, [sp, #1032]
	str	r3, [sp, #1136]
	add	r2, fp, #5184
	add	r3, fp, #5568
	str	r2, [sp, #856]
	str	r3, [sp, #860]
	add	r2, fp, #5760
	add	r3, fp, #4608
	str	r2, [sp, #1012]
	str	r3, [sp, #1056]
	add	r2, fp, #5376
	add	r3, fp, #4864
	str	r2, [sp, #1116]
	str	r3, [sp, #548]
	add	r2, fp, #5120
	add	r3, fp, #6592
	str	r2, [sp, #576]
	str	r3, [sp, #676]
	add	r2, fp, #6208
	add	r3, fp, #6400
	str	r2, [sp, #704]
	str	r3, [sp, #720]
	add	r2, fp, #5312
	add	r3, fp, #6784
	str	r2, [sp, #752]
	str	r3, [sp, #816]
	add	r2, fp, #4352
	add	r3, fp, #4288
	str	r2, [sp, #908]
	str	r3, [sp, #912]
	add	r2, fp, #5440
	add	r3, fp, #4480
	str	r2, [sp, #928]
	str	r3, [sp, #1092]
	ldr	r2, [sp, #548]
	ldr	r3, [sp, #912]
	add	r2, r2, #32
	str	r2, [sp, #548]
	ldr	r2, [sp, #928]
	add	r3, r3, #32
	add	r2, r2, #32
	str	r2, [sp, #928]
	ldr	r2, [sp, #576]
	str	r3, [sp, #912]
	add	r2, r2, #16
	ldr	r3, [sp, #1092]
	str	r2, [sp, #576]
	ldr	r2, [sp, #908]
	add	r3, r3, #32
	str	r3, [sp, #1092]
	add	r2, r2, #16
	ldr	r3, [sp, #752]
	str	r2, [sp, #908]
	ldr	r2, [sp, #704]
	add	r3, r3, #16
	str	r3, [sp, #752]
	add	r2, r2, #32
	ldr	r3, [sp, #676]
	str	r2, [sp, #704]
	ldr	r2, [sp, #816]
	add	r3, r3, #32
	str	r3, [sp, #676]
	add	r2, r2, #32
	ldr	r3, [sp, #720]
	str	r2, [sp, #816]
	add	r2, fp, #4224
	add	r3, r3, #32
	str	r2, [sp, #888]
	add	r2, fp, #6336
	str	r3, [sp, #720]
	str	r2, [sp, #560]
	add	r3, fp, #4992
	add	r2, fp, #6720
	str	r3, [sp, #788]
	str	r2, [sp, #808]
	add	r3, fp, #4416
	ldr	r2, [sp, #692]
	str	r3, [sp, #1104]
	add	r3, fp, #6528
	str	r3, [sp, #800]
	add	r2, r2, #16
	add	r3, fp, #6144
	str	r3, [sp, #880]
	str	r2, [sp, #696]
	ldr	r3, [sp, #744]
	ldr	r2, [sp, #832]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #748]
	str	r2, [sp, #836]
	ldr	r3, [sp, #860]
	ldr	r2, [sp, #856]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #864]
	str	r2, [sp, #916]
	ldr	r3, [sp, #580]
	ldr	r2, [sp, #1012]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #956]
	str	r2, [sp, #1016]
	ldr	r3, [sp, #1032]
	ldr	r2, [sp, #1056]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #1036]
	str	r2, [sp, #1060]
	ldr	r3, [sp, #1116]
	ldr	r2, [sp, #1136]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #1120]
	str	r2, [sp, #1140]
	add	r3, fp, #4928
	add	r2, fp, #6336
	str	r3, [sp, #556]
	str	r2, [sp, #564]
	add	r3, fp, #6656
	add	r2, fp, #4160
	str	r3, [sp, #680]
	str	r2, [sp, #700]
	add	r3, fp, #6272
	add	r2, fp, #6464
	str	r3, [sp, #708]
	str	r2, [sp, #724]
	add	r3, fp, #4992
	add	r2, fp, #6528
	str	r3, [sp, #796]
	str	r2, [sp, #804]
	add	r3, fp, #6720
	add	r2, fp, #6848
	str	r3, [sp, #812]
	str	r2, [sp, #820]
	add	r3, fp, #5696
	add	r2, fp, #5184
	str	r3, [sp, #840]
	str	r2, [sp, #852]
	add	r3, fp, #5568
	add	r2, fp, #6144
	str	r3, [sp, #868]
	str	r2, [sp, #884]
	add	r3, fp, #4224
	add	r2, fp, #5504
	str	r3, [sp, #896]
	str	r2, [sp, #936]
	add	r3, fp, #5760
	add	r2, fp, #4736
	str	r3, [sp, #1020]
	str	r2, [sp, #1040]
	add	r2, fp, #4544
	str	r2, [sp, #1100]
	add	r2, fp, #5376
	str	r2, [sp, #1124]
	add	r3, fp, #4608
	ldr	r2, [sp, #556]
	str	r3, [sp, #1064]
	add	r3, fp, #4416
	str	r3, [sp, #1112]
	add	r2, r2, #16
	add	r3, fp, #5888
	str	r3, [sp, #1144]
	str	r2, [sp, #556]
	ldr	r3, [sp, #700]
	ldr	r2, [sp, #840]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #700]
	str	r2, [sp, #840]
	ldr	r3, [sp, #868]
	ldr	r2, [sp, #896]
	add	r3, r3, #48
	add	r2, r2, #48
	str	r3, [sp, #868]
	str	r2, [sp, #896]
	ldr	r3, [sp, #936]
	ldr	r2, [sp, #1020]
	add	r3, r3, #16
	add	r2, r2, #48
	str	r3, [sp, #936]
	str	r2, [sp, #1020]
	ldr	r3, [sp, #1040]
	ldr	r2, [sp, #1064]
	add	r3, r3, #16
	add	r2, r2, #48
	str	r3, [sp, #1040]
	str	r2, [sp, #1064]
	ldr	r3, [sp, #1144]
	ldr	r2, [sp, #796]
	add	r3, r3, #16
	add	r2, r2, #48
	str	r3, [sp, #1144]
	str	r2, [sp, #796]
	ldr	r3, [sp, #852]
	ldr	r2, [sp, #1100]
	add	r3, r3, #48
	add	r2, r2, #16
	str	r3, [sp, #852]
	str	r2, [sp, #1100]
	ldr	r3, [sp, #1112]
	ldr	r2, [sp, #1124]
	add	r3, r3, #48
	add	r2, r2, #48
	str	r3, [sp, #1112]
	str	r2, [sp, #1124]
	ldr	r3, [sp, #564]
	ldr	r2, [sp, #680]
	add	r3, r3, #48
	add	r2, r2, #16
	str	r3, [sp, #564]
	str	r2, [sp, #680]
	ldr	r3, [sp, #708]
	ldr	r2, [sp, #724]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #708]
	str	r2, [sp, #724]
	ldr	r3, [sp, #804]
	ldr	r2, [sp, #812]
	add	r3, r3, #48
	add	r2, r2, #48
	str	r3, [sp, #804]
	str	r2, [sp, #812]
	ldr	r3, [sp, #820]
	ldr	r2, [sp, #884]
	add	r3, r3, #16
	add	r2, r2, #48
	str	r3, [sp, #820]
	str	r2, [sp, #884]
	ldr	r3, [sp, #748]
	ldr	r2, [sp, #916]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #484]
	str	r2, [sp, #416]
	ldr	r3, [sp, #1120]
	ldr	r2, [sp, #1036]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #348]
	str	r2, [sp, #332]
	add	r3, fp, #4800
	add	r2, fp, #4032
	str	r3, [sp, #980]
	str	r2, [sp, #600]
	add	r3, fp, #3984
	add	r2, fp, #3888
	str	r3, [sp, #640]
	str	r2, [sp, #664]
	add	r3, fp, #4080
	add	r2, fp, #3312
	str	r3, [sp, #608]
	str	r2, [sp, #1052]
	add	r3, fp, #48
	add	r2, fp, #96
	str	r3, [sp, #544]
	str	r2, [sp, #568]
	add	r3, fp, #192
	add	r2, fp, #336
	str	r3, [sp, #592]
	str	r2, [sp, #624]
	add	r3, fp, #432
	add	r2, fp, #480
	str	r3, [sp, #648]
	str	r2, [sp, #668]
	add	r3, fp, #528
	add	r2, fp, #576
	str	r3, [sp, #672]
	str	r2, [sp, #684]
	add	r3, fp, #624
	add	r2, fp, #672
	str	r3, [sp, #688]
	str	r2, [sp, #712]
	add	r3, fp, #720
	add	r2, fp, #816
	str	r3, [sp, #716]
	str	r2, [sp, #732]
	add	r3, fp, #912
	add	r2, fp, #3408
	str	r3, [sp, #760]
	str	r2, [sp, #968]
	add	r3, fp, #3360
	add	r2, fp, #144
	str	r3, [sp, #972]
	str	r2, [sp, #572]
	add	r3, fp, #240
	add	r2, fp, #288
	str	r3, [sp, #596]
	str	r2, [sp, #620]
	add	r3, fp, #384
	add	r2, fp, #768
	str	r3, [sp, #644]
	str	r2, [sp, #728]
	add	r3, fp, #864
	add	r2, fp, #960
	str	r3, [sp, #756]
	str	r2, [sp, #772]
	add	r3, fp, #1008
	add	r2, fp, #3216
	str	r3, [sp, #776]
	str	r2, [sp, #1028]
	add	r3, fp, #1488
	add	r2, fp, #1200
	str	r3, [sp, #588]
	str	r2, [sp, #616]
	add	r3, fp, #1296
	add	r2, fp, #1104
	str	r3, [sp, #632]
	str	r2, [sp, #656]
	add	r3, fp, #2928
	add	r2, fp, #1584
	str	r3, [sp, #740]
	str	r2, [sp, #768]
	add	r3, fp, #2400
	add	r2, fp, #1344
	str	r3, [sp, #784]
	str	r2, [sp, #824]
	add	r3, fp, #3024
	add	r2, fp, #1632
	str	r3, [sp, #848]
	str	r2, [sp, #872]
	add	r3, fp, #1680
	add	r2, fp, #1728
	str	r3, [sp, #876]
	str	r2, [sp, #900]
	add	r3, fp, #1776
	add	r2, fp, #1824
	str	r3, [sp, #904]
	str	r2, [sp, #920]
	add	r2, fp, #1920
	add	r3, fp, #1872
	str	r2, [sp, #940]
	add	r2, fp, #2016
	str	r3, [sp, #924]
	str	r2, [sp, #948]
	add	r3, fp, #1968
	add	r2, fp, #2112
	str	r3, [sp, #944]
	str	r2, [sp, #960]
	add	r3, fp, #2064
	add	r2, fp, #2256
	str	r3, [sp, #952]
	str	r2, [sp, #988]
	add	r3, fp, #2160
	add	r2, fp, #2304
	str	r3, [sp, #964]
	str	r2, [sp, #1004]
	add	r3, fp, #2832
	add	r2, fp, #2544
	str	r3, [sp, #996]
	str	r2, [sp, #1048]
	add	r3, fp, #2496
	add	r2, fp, #2640
	str	r3, [sp, #1044]
	str	r2, [sp, #1072]
	add	r3, fp, #2592
	add	r2, fp, #1440
	str	r3, [sp, #1068]
	str	r2, [sp, #584]
	add	r3, fp, #3072
	add	r2, fp, #1248
	str	r3, [sp, #1128]
	str	r2, [sp, #628]
	add	r3, fp, #1152
	add	r2, fp, #2880
	str	r3, [sp, #612]
	str	r2, [sp, #736]
	add	r3, fp, #1056
	add	r2, fp, #2448
	str	r3, [sp, #652]
	str	r2, [sp, #780]
	add	r3, fp, #1536
	add	r2, fp, #2976
	str	r3, [sp, #764]
	str	r2, [sp, #844]
	add	r3, fp, #1392
	add	r2, fp, #2784
	str	r3, [sp, #828]
	str	r2, [sp, #992]
	add	r3, fp, #2208
	add	r2, fp, #3168
	str	r3, [sp, #984]
	str	r2, [sp, #1024]
	add	r3, fp, #2352
	add	r2, fp, #2736
	str	r3, [sp, #1008]
	str	r2, [sp, #1080]
	add	r3, fp, #2688
	add	r2, fp, #3120
	str	r3, [sp, #1076]
	str	r2, [sp, #1132]
	add	r3, fp, #3600
	ldr	r2, [sp, #548]
	str	r3, [sp, #1088]
	add	r3, fp, #3744
	str	r3, [sp, #1152]
	add	r2, r2, #16
	add	r3, fp, #4048
	str	r2, [sp, #552]
	str	r3, [sp, #604]
	ldr	r2, [sp, #788]
	ldr	r3, [sp, #888]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #792]
	str	r3, [sp, #892]
	ldr	r2, [sp, #928]
	ldr	r3, [sp, #912]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #932]
	str	r3, [sp, #1000]
	ldr	r2, [sp, #1092]
	ldr	r3, [sp, #1104]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #1096]
	str	r3, [sp, #1108]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #576]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #540]
	str	r3, [sp, #536]
	add	r2, fp, #1456
	add	r3, fp, #1168
	str	r2, [sp, #532]
	str	r3, [sp, #528]
	add	r2, fp, #1264
	add	r3, fp, #3968
	str	r2, [sp, #524]
	str	r3, [sp, #520]
	add	r2, fp, #1072
	add	r3, fp, #3856
	str	r2, [sp, #516]
	str	r3, [sp, #660]
	add	r2, fp, #3872
	ldr	r3, [sp, #676]
	str	r2, [sp, #512]
	ldr	r2, [sp, #696]
	add	r3, r3, #16
	str	r3, [sp, #508]
	add	r2, r2, #16
	ldr	r3, [sp, #704]
	str	r2, [sp, #504]
	ldr	r2, [sp, #720]
	add	r3, r3, #16
	str	r3, [sp, #500]
	add	r2, r2, #16
	add	r3, fp, #2896
	str	r2, [sp, #496]
	str	r3, [sp, #492]
	add	r2, fp, #1552
	add	r3, fp, #2464
	str	r2, [sp, #488]
	str	r3, [sp, #480]
	ldr	r3, [sp, #800]
	add	r2, fp, #400
	add	r3, r3, #16
	str	r3, [sp, #472]
	ldr	r3, [sp, #808]
	str	r2, [sp, #476]
	add	r3, r3, #16
	str	r3, [sp, #464]
	ldr	r3, [sp, #816]
	add	r2, fp, #256
	add	r3, r3, #16
	str	r3, [sp, #456]
	add	r3, fp, #2992
	str	r3, [sp, #448]
	add	r3, fp, #5248
	str	r3, [sp, #440]
	ldr	r3, [sp, #864]
	str	r2, [sp, #468]
	add	r3, r3, #16
	add	r2, fp, #304
	str	r3, [sp, #432]
	ldr	r3, [sp, #908]
	str	r2, [sp, #460]
	ldr	r2, [sp, #836]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #424]
	ldr	r3, [sp, #752]
	str	r2, [sp, #452]
	add	r2, fp, #160
	str	r2, [sp, #444]
	add	r3, r3, #16
	add	r2, fp, #880
	str	r2, [sp, #436]
	str	r3, [sp, #412]
	ldr	r2, [sp, #880]
	ldr	r3, [sp, #956]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #428]
	str	r3, [sp, #404]
	add	r2, fp, #4096
	add	r3, fp, #4864
	str	r2, [sp, #420]
	str	r3, [sp, #396]
	add	r2, fp, #5056
	ldr	r3, [sp, #1016]
	str	r2, [sp, #408]
	add	r2, fp, #3424
	str	r2, [sp, #400]
	add	r3, r3, #16
	add	r2, fp, #2800
	str	r2, [sp, #392]
	str	r3, [sp, #388]
	add	r2, fp, #3184
	add	r3, fp, #976
	str	r2, [sp, #384]
	str	r3, [sp, #380]
	ldr	r3, [sp, #1060]
	add	r2, fp, #3280
	add	r3, r3, #16
	str	r3, [sp, #372]
	add	r3, fp, #3568
	str	r3, [sp, #364]
	add	r3, fp, #784
	str	r3, [sp, #356]
	ldr	r3, [sp, #1140]
	str	r2, [sp, #376]
	add	r3, r3, #16
	add	r2, fp, #3376
	str	r2, [sp, #368]
	str	r3, [sp, #344]
	add	r2, fp, #2224
	add	r3, fp, #2368
	str	r2, [sp, #360]
	str	r3, [sp, #336]
	add	r2, fp, #1408
	ldr	r3, .L99+8
	str	r2, [sp, #352]
	add	r2, fp, #3808
	str	r2, [sp, #340]
	add	r2, sl, r3
	ldr	r3, .L99+12
	str	r2, [fp, #0]
	add	r2, sl, r3
	ldr	r3, .L99+16
	str	r2, [fp, #48]
	add	r2, sl, r3
	ldr	r3, .L99+20
	str	r2, [fp, #96]
	add	r2, sl, r3
	ldr	r3, .L99+24
	str	r2, [fp, #144]
	add	r2, sl, r3
	str	r2, [fp, #192]
	ldr	r3, [sp, #556]
	ldr	r2, [sp, #544]
	str	r3, [fp, #24]
	str	r2, [fp, #12]
	ldr	r3, [sp, #544]
	mov	r2, #218
	str	r2, [fp, #28]
	sub	r2, r2, #217
	str	r9, [fp, #8]
	str	r2, [r3, #8]
	ldr	r2, [sp, #564]
	str	fp, [fp, #20]
	str	r2, [r3, #24]
	mov	r2, #500
	str	r2, [r3, #28]
	ldr	r2, [sp, #552]
	str	fp, [r3, #12]
	str	r3, [r3, #20]
	mov	r3, #1
	str	r3, [fp, #4]
	str	r2, [fp, #16]
	ldr	r2, [sp, #540]
	ldr	r3, [sp, #544]
	ldr	r0, .L99+28
	str	r2, [r3, #16]
	ldr	r2, [sp, #536]
	ldr	r3, [sp, #568]
	mov	ip, fp
	str	r2, [r3, #16]
	ldr	r3, [sp, #572]
	ldr	r2, [sp, #532]
	add	lr, fp, #3456
	str	r2, [r3, #16]
	ldr	r2, [sp, #568]
	add	r4, fp, #3648
	str	r3, [r2, #12]
	ldr	r3, [sp, #544]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #568]
	add	r2, r2, r2
	str	r2, [r3, #8]
	ldr	r2, [sp, #580]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #62
	str	r2, [r3, #28]
	sub	r2, r2, #61
	str	r2, [r3, #4]
	ldr	r3, [sp, #572]
	add	r2, r2, #2
	str	r2, [r3, #8]
	sub	r2, r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #568]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #588]
	add	r8, fp, #3136
	str	r2, [r3, #24]
	mov	r2, #440
	str	r2, [r3, #28]
	ldr	r3, [sp, #592]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, .L99+32
	add	r5, fp, #5952
	add	r2, sl, r3
	ldr	r3, .L99+36
	str	r2, [fp, #240]
	add	r2, sl, r3
	ldr	r3, .L99+40
	str	r2, [fp, #288]
	add	r2, sl, r3
	ldr	r3, .L99+44
	str	r2, [fp, #336]
	add	r2, sl, r3
	str	r2, [fp, #384]
	ldr	r3, [sp, #592]
	ldr	r2, [sp, #596]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	mov	r2, #4
	str	r2, [r3, #8]
	add	r2, r2, #212
	str	r2, [r3, #28]
	ldr	r2, [sp, #608]
	add	r7, fp, #6016
	str	r2, [r3, #24]
	ldr	r3, [sp, #596]
	mov	r2, #5
	str	r2, [r3, #8]
	ldr	r2, [sp, #592]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, .L99+48
	add	r7, r7, #32
	str	r2, [r3, #28]
	ldr	r2, [sp, #616]
	add	r1, fp, #3952
	str	r2, [r3, #24]
	ldr	r2, [sp, #604]
	ldr	r3, [sp, #592]
	add	r6, fp, #5952
	str	r2, [r3, #16]
	ldr	r2, [sp, #528]
	ldr	r3, [sp, #596]
	add	r6, r6, #48
	str	r2, [r3, #16]
	ldr	r2, [sp, #524]
	ldr	r3, [sp, #620]
	str	r2, [r3, #16]
	ldr	r2, [sp, #520]
	ldr	r3, [sp, #624]
	str	r2, [r3, #16]
	ldr	r3, [sp, #596]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #620]
	add	r2, r2, #5
	str	r2, [r3, #8]
	ldr	r2, [sp, #624]
	str	r2, [r3, #12]
	ldr	r2, .L99+132
	str	r3, [r3, #20]
	str	r2, [r3, #28]
	sub	r2, r2, #472
	str	r2, [r3, #4]
	ldr	r2, [sp, #632]
	str	r2, [r3, #24]
	ldr	r3, [sp, #624]
	mov	r2, #1
	str	r2, [r3, #4]
	add	r2, r2, #6
	str	r2, [r3, #8]
	add	r2, r2, #204
	str	r2, [r3, #28]
	ldr	r2, [sp, #620]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #640]
	str	r2, [r3, #24]
	ldr	r3, [sp, #644]
	mov	r2, #1
	str	r2, [r3, #4]
	add	r2, r2, #7
	str	r2, [r3, #8]
	ldr	r2, [sp, #648]
	str	r2, [r3, #12]
	ldr	r2, [sp, #516]
	str	r2, [r3, #16]
	ldr	r3, .L99+52
	add	r2, sl, r3
	str	r2, [fp, #432]
	ldr	r3, [sp, #648]
	ldr	r2, [sp, #512]
	str	r2, [r3, #16]
	ldr	r3, .L99+56
	add	r2, sl, r3
	str	r2, [fp, #480]
	ldr	r3, [sp, #668]
	ldr	r2, [sp, #660]
	str	r2, [r3, #16]
	ldr	r3, .L99+60
	add	r2, sl, r3
	str	r2, [fp, #528]
	ldr	r3, [sp, #672]
	ldr	r2, [sp, #508]
	str	r2, [r3, #16]
	ldr	r3, .L99+64
	add	r2, sl, r3
	str	r2, [fp, #576]
	ldr	r2, [sp, #504]
	ldr	r3, [sp, #684]
	str	r2, [r3, #16]
	ldr	r3, [sp, #644]
	ldr	r2, [sp, #656]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, .L99+68
	str	r2, [r3, #28]
	ldr	r2, [sp, #648]
	str	r3, [r2, #12]
	mov	r3, #9
	str	r3, [r2, #8]
	ldr	r3, [sp, #664]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #210
	str	r3, [r2, #28]
	ldr	r3, [sp, #672]
	ldr	r2, [sp, #668]
	str	r3, [r2, #12]
	ldr	r2, [sp, #648]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r2, [sp, #668]
	add	r3, r3, #9
	str	r3, [r2, #8]
	ldr	r3, [sp, #664]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, .L99+184
	str	r3, [r2, #28]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r2, [sp, #672]
	add	r3, r3, #10
	str	r3, [r2, #8]
	sub	r3, r3, #10
	str	r3, [r2, #4]
	ldr	r3, [sp, #668]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #680]
	str	r3, [r2, #24]
	mov	r3, #60
	str	r3, [r2, #28]
	ldr	r2, [sp, #684]
	sub	r3, r3, #59
	str	r3, [r2, #4]
	add	r3, r3, #11
	str	r3, [r2, #8]
	ldr	r3, [sp, #688]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r2, [sp, #500]
	str	r2, [r3, #16]
	ldr	r3, .L99+72
	add	r2, sl, r3
	str	r2, [fp, #624]
	ldr	r3, [sp, #712]
	ldr	r2, [sp, #496]
	str	r2, [r3, #16]
	ldr	r3, .L99+76
	add	r2, sl, r3
	str	r2, [fp, #672]
	ldr	r3, [sp, #716]
	ldr	r2, [sp, #696]
	str	r2, [r3, #16]
	ldr	r3, .L99+80
	add	r2, sl, r3
	ldr	r3, .L99+84
	str	r2, [fp, #720]
	add	r2, sl, r3
	str	r2, [fp, #768]
	ldr	r3, [sp, #728]
	ldr	r2, [sp, #492]
	str	r2, [r3, #16]
	ldr	r3, [sp, #684]
	ldr	r2, [sp, #700]
	str	r2, [r3, #24]
	mov	r2, #215
	str	r2, [r3, #28]
	ldr	r2, [sp, #688]
	str	r3, [r2, #12]
	ldr	r3, [sp, #708]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #13
	str	r3, [r2, #8]
	ldr	r3, [sp, #716]
	ldr	r2, [sp, #712]
	str	r3, [r2, #12]
	ldr	r2, [sp, #688]
	mov	r3, #320
	str	r3, [r2, #28]
	ldr	r2, [sp, #712]
	ldr	r3, [sp, #724]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r2, [sp, #688]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r2, [sp, #712]
	add	r3, r3, #13
	str	r3, [r2, #8]
	add	r3, r3, #131
	str	r3, [r2, #28]
	ldr	r3, [sp, #716]
	str	r2, [r3, #12]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r2, [sp, #716]
	ldr	r3, [sp, #700]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #1
	str	r3, [r2, #4]
	add	r3, r3, #14
	str	r3, [r2, #8]
	ldr	r3, .L99+88
	str	r3, [r2, #28]
	ldr	r2, [sp, #728]
	mov	r3, #1
	str	r3, [r2, #4]
	add	r3, r3, #15
	str	r3, [r2, #8]
	ldr	r3, [sp, #732]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #740]
	str	r3, [r2, #24]
	ldr	r3, .L99+296
	str	r3, [r2, #28]
	ldr	r3, .L99+92
	add	r2, sl, r3
	ldr	r3, .L99+96
	str	r2, [fp, #816]
	add	r2, sl, r3
	ldr	r3, .L99+100
	str	r2, [fp, #864]
	add	r2, sl, r3
	ldr	r3, .L99+104
	str	r2, [fp, #912]
	add	r2, sl, r3
	ldr	r3, .L99+108
	str	r2, [fp, #960]
	add	r2, sl, r3
	str	r2, [fp, #1008]
	ldr	r3, [sp, #728]
	ldr	r2, [sp, #732]
	str	r3, [r2, #12]
	mov	r3, #17
	str	r3, [r2, #8]
	ldr	r3, [sp, #752]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #225
	str	r3, [r2, #28]
	ldr	r2, [sp, #756]
	ldr	r3, [sp, #760]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	mov	r3, #18
	str	r3, [r2, #8]
	ldr	r3, [sp, #768]
	str	r3, [r2, #24]
	mov	r3, #230
	str	r3, [r2, #28]
	ldr	r2, [sp, #760]
	sub	r3, r3, #211
	str	r3, [r2, #8]
	ldr	r3, [sp, #732]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r2, [sp, #748]
	str	r2, [r3, #16]
	ldr	r2, [sp, #488]
	ldr	r3, [sp, #756]
	str	r2, [r3, #16]
	ldr	r2, [sp, #484]
	ldr	r3, [sp, #760]
	str	r2, [r3, #16]
	ldr	r2, [sp, #480]
	ldr	r3, [sp, #772]
	str	r2, [r3, #16]
	ldr	r2, [sp, #756]
	ldr	r3, [sp, #760]
	str	r2, [r3, #12]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r2, [sp, #760]
	ldr	r3, [sp, #752]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #220
	str	r3, [r2, #28]
	ldr	r2, [sp, #772]
	sub	r3, r3, #200
	str	r3, [r2, #8]
	ldr	r3, [sp, #760]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #772]
	ldr	r2, [sp, #776]
	str	r0, [r3, #28]
	str	r2, [r3, #12]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r2, [sp, #784]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1096]
	ldr	r2, [sp, #776]
	add	r3, r3, #16
	str	r3, [sp, #320]
	mov	r3, #1
	str	r3, [r2, #4]
	add	r3, r3, #20
	str	r3, [r2, #8]
	ldr	r2, .L99+112
	add	r3, sl, r2
	mov	r2, #22
	str	r3, [fp, #1056]
	str	r2, [fp, #1064]
	ldr	r3, .L99+116
	ldr	r2, .L99+68
	str	r2, [fp, #1084]
	add	r2, sl, r3
	str	r2, [fp, #1104]
	ldr	r2, .L99+120
	mov	r3, #23
	str	r3, [fp, #1112]
	add	r3, sl, r2
	str	r3, [fp, #1152]
	ldr	r3, .L99+48
	str	r3, [fp, #1180]
	ldr	r3, .L99+124
	add	r2, sl, r3
	mov	r3, #25
	str	r2, [fp, #1200]
	str	r3, [fp, #1208]
	ldr	r2, [sp, #776]
	ldr	r3, [sp, #772]
	str	r3, [r2, #12]
	ldr	r3, [sp, #792]
	str	r3, [r2, #16]
	ldr	r3, [sp, #476]
	ldr	r2, [sp, #652]
	str	r3, [r2, #16]
	ldr	r3, [sp, #472]
	ldr	r2, [sp, #656]
	str	r3, [r2, #16]
	ldr	r3, [sp, #468]
	ldr	r2, [sp, #612]
	str	r3, [r2, #16]
	ldr	r2, [sp, #776]
	ldr	r3, [sp, #796]
	str	r2, [fp, #1028]
	mov	r2, #214
	str	r2, [fp, #1036]
	b	.L100
.L101:
	.align	2
.L99:
	.word	6911
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	405
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	649
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	289
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	394
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	473
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	410
	.word	411
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	305
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	314
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	290
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	291
	.word	.LC62(GOTOFF)
	.word	398
	.word	.LC63(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.word	877
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	361
	.word	.LC77(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	375
	.word	.LC79(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
.L100:
	ldr	r2, [sp, #656]
	str	r3, [fp, #1032]
	str	r2, [fp, #1068]
	ldr	r2, [sp, #648]
	mov	r3, #1
	str	r3, [fp, #1060]
	str	r2, [fp, #1080]
	ldr	r3, [sp, #652]
	ldr	r2, [sp, #652]
	str	r3, [fp, #1076]
	str	r2, [fp, #1116]
	mov	r3, #1
	ldr	r2, [sp, #804]
	str	r3, [fp, #1108]
	ldr	r3, [sp, #656]
	str	r2, [fp, #1128]
	mov	r2, #1
	str	r3, [fp, #1124]
	str	r2, [fp, #1156]
	mov	r3, #60
	ldr	r2, [sp, #616]
	str	r3, [fp, #1132]
	sub	r3, r3, #36
	str	r3, [fp, #1160]
	str	r2, [fp, #1164]
	ldr	r2, [sp, #592]
	ldr	r3, [sp, #612]
	str	r2, [fp, #1176]
	ldr	r2, [sp, #612]
	str	r3, [fp, #1172]
	mov	r3, #1
	str	r3, [fp, #1204]
	str	r2, [fp, #1212]
	ldr	r3, [sp, #616]
	ldr	r2, [sp, #464]
	str	r2, [r3, #16]
	ldr	r3, .L99+128
	add	r2, sl, r3
	str	r2, [fp, #1248]
	ldr	r3, [sp, #628]
	ldr	r2, [sp, #460]
	str	r2, [r3, #16]
	mov	r3, #26
	ldr	r2, [sp, #456]
	str	r3, [fp, #1256]
	ldr	r3, [sp, #632]
	str	r2, [r3, #16]
	ldr	r3, .L99+132
	ldr	r2, [sp, #824]
	str	r3, [fp, #1276]
	ldr	r3, [sp, #452]
	str	r3, [r2, #16]
	ldr	r3, .L99+136
	add	r2, sl, r3
	str	r2, [fp, #1296]
	ldr	r2, .L99+140
	mov	r3, #27
	str	r3, [fp, #1304]
	add	r3, sl, r2
	str	r3, [fp, #1344]
	ldr	r3, .L99+144
	mov	r2, #28
	str	r2, [fp, #1352]
	add	r2, sl, r3
	mov	r3, #29
	str	r2, [fp, #1392]
	str	r3, [fp, #1400]
	ldr	r2, [sp, #828]
	ldr	r3, [sp, #448]
	str	r3, [r2, #16]
	ldr	r2, [sp, #616]
	ldr	r3, [sp, #812]
	str	r2, [fp, #1220]
	mov	r2, #70
	str	r3, [fp, #1224]
	str	r2, [fp, #1228]
	mov	r3, #1
	ldr	r2, [sp, #632]
	str	r3, [fp, #1252]
	ldr	r3, [sp, #628]
	str	r2, [fp, #1260]
	ldr	r2, [sp, #624]
	str	r3, [fp, #1268]
	mov	r3, #1
	str	r2, [fp, #1272]
	str	r3, [fp, #1300]
	ldr	r2, [sp, #628]
	ldr	r3, [sp, #632]
	str	r2, [fp, #1308]
	str	r3, [fp, #1316]
	ldr	r2, [sp, #820]
	mov	r3, #70
	str	r3, [fp, #1324]
	ldr	r3, [sp, #828]
	str	r2, [fp, #1320]
	mov	r2, #1
	str	r2, [fp, #1348]
	str	r3, [fp, #1356]
	ldr	r2, [sp, #824]
	ldr	r3, [sp, #840]
	str	r2, [fp, #1364]
	str	r3, [fp, #1368]
	mov	r2, #224
	mov	r3, #1
	str	r2, [fp, #1372]
	str	r3, [fp, #1396]
	ldr	r2, [sp, #824]
	ldr	r3, [sp, #828]
	str	r2, [fp, #1404]
	str	r3, [fp, #1412]
	ldr	r2, [sp, #584]
	ldr	r3, [sp, #444]
	str	r3, [r2, #16]
	ldr	r3, .L99+148
	add	r2, sl, r3
	str	r2, [fp, #1440]
	ldr	r3, [sp, #440]
	ldr	r2, [sp, #588]
	str	r3, [r2, #16]
	mov	r3, #30
	ldr	r2, [sp, #764]
	str	r3, [fp, #1448]
	ldr	r3, [sp, #436]
	str	r3, [r2, #16]
	ldr	r3, .L99+152
	mov	r2, #440
	str	r2, [fp, #1468]
	add	r2, sl, r3
	str	r2, [fp, #1488]
	ldr	r2, .L99+156
	mov	r3, #31
	str	r3, [fp, #1496]
	add	r3, sl, r2
	ldr	r2, .L99+160
	str	r3, [fp, #1536]
	add	r3, sl, r2
	mov	r2, #33
	str	r3, [fp, #1584]
	str	r2, [fp, #1592]
	ldr	r3, [sp, #768]
	ldr	r2, [sp, #432]
	str	r2, [r3, #16]
	mov	r2, #202
	str	r2, [fp, #1420]
	ldr	r2, [sp, #588]
	ldr	r3, [sp, #848]
	str	r2, [fp, #1452]
	ldr	r2, [sp, #568]
	str	r3, [fp, #1416]
	mov	r3, #1
	str	r3, [fp, #1444]
	str	r2, [fp, #1464]
	ldr	r3, [sp, #584]
	ldr	r2, [sp, #584]
	str	r3, [fp, #1460]
	str	r2, [fp, #1500]
	mov	r3, #1
	ldr	r2, [sp, #856]
	str	r3, [fp, #1492]
	ldr	r3, [sp, #588]
	str	r2, [fp, #1512]
	mov	r2, #1
	str	r3, [fp, #1508]
	str	r2, [fp, #1540]
	mov	r3, #70
	ldr	r2, [sp, #768]
	str	r3, [fp, #1516]
	sub	r3, r3, #38
	str	r3, [fp, #1544]
	str	r2, [fp, #1548]
	ldr	r3, [sp, #764]
	ldr	r2, [sp, #760]
	str	r3, [fp, #1556]
	mov	r3, #230
	str	r2, [fp, #1560]
	str	r3, [fp, #1564]
	mov	r2, #1
	ldr	r3, [sp, #764]
	str	r2, [fp, #1588]
	ldr	r2, [sp, #768]
	str	r3, [fp, #1596]
	ldr	r3, [sp, #868]
	str	r2, [fp, #1604]
	mov	r2, #228
	str	r3, [fp, #1608]
	str	r2, [fp, #1612]
	ldr	r3, [sp, #872]
	ldr	r2, [sp, #428]
	str	r2, [r3, #16]
	ldr	r3, .L99+164
	add	r2, sl, r3
	str	r2, [fp, #1632]
	ldr	r2, .L99+168
	mov	r3, #34
	str	r3, [fp, #1640]
	add	r3, sl, r2
	str	r3, [fp, #1680]
	ldr	r3, .L99+172
	mov	r2, #35
	str	r2, [fp, #1688]
	add	r2, sl, r3
	str	r2, [fp, #1728]
	ldr	r2, .L99+176
	mov	r3, #36
	str	r3, [fp, #1736]
	add	r3, sl, r2
	str	r3, [fp, #1776]
	ldr	r3, .L99+180
	mov	r2, #37
	str	r2, [fp, #1784]
	add	r2, sl, r3
	str	r2, [fp, #1824]
	ldr	r3, [sp, #876]
	ldr	r2, [sp, #892]
	str	r2, [r3, #16]
	ldr	r2, [sp, #424]
	ldr	r3, [sp, #900]
	str	r2, [r3, #16]
	ldr	r2, [sp, #876]
	mov	r3, #1
	str	r3, [fp, #1636]
	str	r2, [fp, #1644]
	ldr	r3, [sp, #872]
	ldr	r2, [sp, #884]
	str	r3, [fp, #1652]
	ldr	r3, .L99+184
	str	r2, [fp, #1656]
	str	r3, [fp, #1660]
	ldr	r3, [sp, #872]
	mov	r2, #1
	str	r2, [fp, #1684]
	str	r3, [fp, #1692]
	ldr	r2, [sp, #876]
	ldr	r3, [sp, #896]
	str	r2, [fp, #1700]
	str	r3, [fp, #1704]
	mov	r2, #226
	mov	r3, #1
	str	r2, [fp, #1708]
	str	r3, [fp, #1732]
	ldr	r2, [sp, #904]
	ldr	r3, [sp, #900]
	str	r2, [fp, #1740]
	str	r3, [fp, #1748]
	ldr	r2, [sp, #912]
	mov	r3, #79
	str	r3, [fp, #1756]
	ldr	r3, [sp, #900]
	str	r2, [fp, #1752]
	mov	r2, #1
	str	r2, [fp, #1780]
	str	r3, [fp, #1788]
	ldr	r2, [sp, #904]
	ldr	r3, [sp, #916]
	str	r2, [fp, #1796]
	str	r3, [r2, #16]
	ldr	r2, [sp, #852]
	ldr	r3, .L99+188
	str	r2, [fp, #1800]
	mov	r2, #1
	str	r2, [fp, #1828]
	ldr	r2, .L99+192
	str	r3, [fp, #1804]
	mov	r3, #38
	str	r3, [fp, #1832]
	add	r3, sl, r2
	str	r3, [fp, #1872]
	ldr	r3, .L99+196
	mov	r2, #39
	str	r2, [fp, #1880]
	add	r2, sl, r3
	str	r2, [fp, #1920]
	ldr	r2, .L99+200
	mov	r3, #40
	str	r3, [fp, #1928]
	add	r3, sl, r2
	str	r3, [fp, #1968]
	ldr	r3, .L99+204
	mov	r2, #41
	str	r2, [fp, #1976]
	add	r2, sl, r3
	mov	r3, #42
	str	r2, [fp, #2016]
	str	r3, [fp, #2024]
	ldr	r2, [sp, #932]
	ldr	r3, [sp, #920]
	str	r2, [r3, #16]
	ldr	r2, [sp, #420]
	ldr	r3, [sp, #924]
	str	r2, [r3, #16]
	ldr	r2, [sp, #416]
	ldr	r3, [sp, #940]
	str	r2, [r3, #16]
	ldr	r2, [sp, #412]
	ldr	r3, [sp, #944]
	str	r2, [r3, #16]
	ldr	r3, [sp, #924]
	ldr	r2, [sp, #920]
	str	r3, [fp, #1836]
	ldr	r3, [sp, #936]
	str	r2, [fp, #1844]
	mov	r2, #215
	str	r3, [fp, #1848]
	str	r2, [fp, #1852]
	mov	r3, #1
	ldr	r2, [sp, #920]
	str	r3, [fp, #1876]
	ldr	r3, [sp, #924]
	str	r2, [fp, #1884]
	ldr	r2, [sp, #600]
	str	r3, [fp, #1892]
	mov	r3, #145
	str	r2, [fp, #1896]
	str	r3, [fp, #1900]
	mov	r2, #1
	ldr	r3, [sp, #944]
	str	r2, [fp, #1924]
	ldr	r2, [sp, #940]
	str	r3, [fp, #1932]
	ldr	r3, [sp, #852]
	str	r2, [fp, #1940]
	ldr	r2, .L99+208
	str	r3, [fp, #1944]
	mov	r3, #1
	str	r2, [fp, #1948]
	str	r3, [fp, #1972]
	ldr	r2, [sp, #940]
	ldr	r3, [sp, #944]
	str	r2, [fp, #1980]
	str	r3, [fp, #1988]
	ldr	r2, [sp, #744]
	mov	r3, #146
	str	r3, [fp, #1996]
	ldr	r3, [sp, #952]
	str	r2, [fp, #1992]
	mov	r2, #1
	str	r2, [fp, #2020]
	str	r3, [fp, #2028]
	ldr	r2, [sp, #948]
	ldr	r3, [sp, #408]
	str	r3, [r2, #16]
	ldr	r3, .L99+212
	add	r2, sl, r3
	str	r2, [fp, #2064]
	ldr	r3, [sp, #404]
	ldr	r2, [sp, #952]
	str	r3, [r2, #16]
	mov	r3, #43
	ldr	r2, [sp, #960]
	str	r3, [fp, #2072]
	ldr	r3, [sp, #400]
	str	r3, [r2, #16]
	ldr	r3, .L99+216
	add	r2, sl, r3
	str	r2, [fp, #2112]
	ldr	r3, [sp, #396]
	ldr	r2, [sp, #964]
	str	r3, [r2, #16]
	ldr	r2, .L99+220
	mov	r3, #44
	str	r3, [fp, #2120]
	add	r3, sl, r2
	str	r3, [fp, #2160]
	ldr	r3, .L99+224
	mov	r2, #45
	str	r2, [fp, #2168]
	add	r2, sl, r3
	mov	r3, #46
	str	r2, [fp, #2208]
	str	r3, [fp, #2216]
	ldr	r2, [sp, #984]
	ldr	r3, [sp, #392]
	str	r3, [r2, #16]
	ldr	r2, [sp, #948]
	ldr	r3, [sp, #788]
	str	r2, [fp, #2036]
	str	r3, [fp, #2040]
	mov	r2, #140
	mov	r3, #1
	str	r2, [fp, #2044]
	str	r3, [fp, #2068]
	ldr	r2, [sp, #948]
	ldr	r3, [sp, #952]
	str	r2, [fp, #2076]
	str	r3, [fp, #2084]
	ldr	r2, [sp, #576]
	ldr	r3, .L99+228
	str	r2, [fp, #2088]
	str	r3, [fp, #2092]
	mov	r2, #1
	ldr	r3, [sp, #964]
	str	r2, [fp, #2116]
	ldr	r2, [sp, #960]
	str	r3, [fp, #2124]
	ldr	r3, [sp, #972]
	str	r2, [fp, #2132]
	ldr	r2, .L99+348
	str	r3, [fp, #2136]
	mov	r3, #1
	str	r2, [fp, #2140]
	str	r3, [fp, #2164]
	ldr	r2, [sp, #960]
	ldr	r3, [sp, #964]
	str	r2, [fp, #2172]
	str	r3, [fp, #2180]
	ldr	r2, [sp, #980]
	mov	r3, #60
	str	r3, [fp, #2188]
	ldr	r3, [sp, #988]
	str	r2, [fp, #2184]
	mov	r2, #1
	str	r2, [fp, #2212]
	str	r3, [fp, #2220]
	ldr	r2, [sp, #984]
	ldr	r3, .L99+232
	str	r2, [fp, #2228]
	add	r2, sl, r3
	str	r2, [fp, #2256]
	ldr	r2, .L99+236
	mov	r3, #47
	str	r3, [fp, #2264]
	add	r3, sl, r2
	str	r3, [fp, #2304]
	ldr	r3, .L99+240
	mov	r2, #48
	str	r2, [fp, #2312]
	add	r2, sl, r3
	str	r2, [fp, #2352]
	ldr	r2, .L99+244
	mov	r3, #49
	str	r3, [fp, #2360]
	add	r3, sl, r2
	mov	r2, #50
	str	r3, [fp, #2400]
	str	r2, [fp, #2408]
	ldr	r3, [sp, #988]
	ldr	r2, [sp, #1000]
	str	r0, [fp, #2236]
	str	r2, [r3, #16]
	ldr	r2, [sp, #388]
	ldr	r3, [sp, #1004]
	str	r2, [r3, #16]
	ldr	r2, [sp, #384]
	ldr	r3, [sp, #1008]
	str	r2, [r3, #16]
	ldr	r3, [sp, #996]
	mov	r2, #1
	str	r3, [fp, #2232]
	ldr	r3, [sp, #984]
	str	r2, [fp, #2260]
	ldr	r2, [sp, #988]
	str	r3, [fp, #2268]
	ldr	r3, [sp, #908]
	str	r2, [fp, #2276]
	mov	r2, #223
	str	r3, [fp, #2280]
	str	r2, [fp, #2284]
	ldr	r2, [sp, #1008]
	mov	r3, #1
	str	r3, [fp, #2308]
	str	r2, [fp, #2316]
	ldr	r3, [sp, #1004]
	ldr	r2, [sp, #1020]
	str	r3, [fp, #2324]
	str	r2, [fp, #2328]
	mov	r3, #227
	mov	r2, #1
	str	r3, [fp, #2332]
	str	r2, [fp, #2356]
	ldr	r3, [sp, #1004]
	ldr	r2, [sp, #1008]
	str	r3, [fp, #2364]
	str	r2, [fp, #2372]
	ldr	r3, [sp, #1028]
	mov	r2, #200
	str	r2, [fp, #2380]
	ldr	r2, [sp, #780]
	str	r3, [fp, #2376]
	mov	r3, #1
	str	r3, [fp, #2404]
	str	r2, [fp, #2412]
	ldr	r3, [sp, #784]
	ldr	r2, [sp, #1036]
	str	r3, [fp, #2420]
	str	r2, [r3, #16]
	ldr	r3, [sp, #1040]
	mov	r2, #223
	str	r3, [fp, #2424]
	str	r2, [fp, #2428]
	ldr	r3, [sp, #780]
	ldr	r2, [sp, #380]
	str	r2, [r3, #16]
	ldr	r3, .L99+248
	add	r2, sl, r3
	str	r2, [fp, #2448]
	ldr	r3, [sp, #1044]
	ldr	r2, [sp, #376]
	str	r2, [r3, #16]
	mov	r3, #51
	ldr	r2, [sp, #372]
	str	r3, [fp, #2456]
	ldr	r3, [sp, #1048]
	str	r0, [fp, #2476]
	str	r2, [r3, #16]
	ldr	r3, .L99+252
	add	r2, sl, r3
	str	r2, [fp, #2496]
	ldr	r2, .L99+256
	mov	r3, #52
	str	r3, [fp, #2504]
	add	r3, sl, r2
	str	r3, [fp, #2544]
	ldr	r3, .L99+260
	mov	r2, #53
	str	r2, [fp, #2552]
	add	r2, sl, r3
	mov	r3, #54
	str	r2, [fp, #2592]
	str	r3, [fp, #2600]
	ldr	r2, [sp, #1060]
	ldr	r3, [sp, #1068]
	str	r2, [r3, #16]
	ldr	r3, .L99+264
	add	r2, sl, r3
	str	r2, [fp, #2640]
	ldr	r2, [sp, #784]
	mov	r3, #1
	str	r3, [fp, #2452]
	str	r2, [fp, #2460]
	ldr	r3, [sp, #780]
	ldr	r2, [sp, #776]
	str	r3, [fp, #2468]
	str	r2, [fp, #2472]
	mov	r3, #1
	ldr	r2, [sp, #1048]
	str	r3, [fp, #2500]
	ldr	r3, [sp, #1044]
	str	r2, [fp, #2508]
	ldr	r2, [sp, #1052]
	str	r3, [fp, #2516]
	ldr	r3, .L99+376
	str	r2, [fp, #2520]
	mov	r2, #1
	str	r3, [fp, #2524]
	str	r2, [fp, #2548]
	ldr	r3, [sp, #1044]
	ldr	r2, [sp, #1048]
	str	r3, [fp, #2556]
	str	r2, [fp, #2564]
	ldr	r3, [sp, #1064]
	mov	r2, #213
	str	r3, [fp, #2568]
	str	r2, [fp, #2572]
	mov	r3, #1
	ldr	r2, [sp, #1072]
	str	r3, [fp, #2596]
	ldr	r3, [sp, #1068]
	str	r2, [fp, #2604]
	ldr	r2, [sp, #1064]
	str	r3, [fp, #2612]
	ldr	r3, .L99+268
	str	r2, [fp, #2616]
	mov	r2, #1
	str	r3, [fp, #2620]
	str	r2, [fp, #2644]
	ldr	r3, [sp, #1072]
	ldr	r2, [sp, #368]
	str	r0, [fp, #2812]
	str	r2, [r3, #16]
	mov	r3, #55
	ldr	r2, [sp, #364]
	str	r3, [fp, #2648]
	ldr	r3, [sp, #1076]
	str	r2, [r3, #16]
	ldr	r3, .L99+272
	add	r2, sl, r3
	str	r2, [fp, #2688]
	ldr	r2, .L99+276
	mov	r3, #56
	str	r3, [fp, #2696]
	add	r3, sl, r2
	str	r3, [fp, #2736]
	ldr	r3, .L99+280
	mov	r2, #57
	str	r2, [fp, #2744]
	add	r2, sl, r3
	mov	r3, #58
	str	r3, [fp, #2792]
	ldr	r3, .L99+284
	str	r2, [fp, #2784]
	add	r2, sl, r3
	mov	r3, #59
	str	r2, [fp, #2832]
	str	r3, [fp, #2840]
	ldr	r2, [sp, #1096]
	ldr	r3, [sp, #1080]
	str	r2, [r3, #16]
	ldr	r2, [sp, #360]
	ldr	r3, [sp, #992]
	str	r2, [r3, #16]
	ldr	r3, [sp, #1068]
	ldr	r2, [sp, #1072]
	str	r3, [fp, #2652]
	str	r2, [fp, #2660]
	ldr	r3, [sp, #968]
	ldr	r2, .L99+376
	str	r3, [fp, #2664]
	str	r2, [fp, #2668]
	mov	r3, #1
	ldr	r2, [sp, #1080]
	str	r3, [fp, #2692]
	ldr	r3, [sp, #1076]
	str	r2, [fp, #2700]
	ldr	r2, [sp, #1088]
	str	r3, [fp, #2708]
	ldr	r3, .L99+360
	str	r2, [fp, #2712]
	mov	r2, #1
	str	r3, [fp, #2716]
	str	r2, [fp, #2740]
	ldr	r3, [sp, #1076]
	ldr	r2, [sp, #1080]
	str	r3, [fp, #2748]
	str	r2, [fp, #2756]
	ldr	r3, [sp, #1100]
	ldr	r2, .L99+288
	str	r3, [fp, #2760]
	str	r2, [fp, #2764]
	mov	r3, #1
	ldr	r2, [sp, #996]
	str	r3, [fp, #2788]
	ldr	r3, [sp, #992]
	str	r2, [fp, #2796]
	ldr	r2, [sp, #988]
	str	r3, [fp, #2804]
	mov	r3, #1
	str	r2, [fp, #2808]
	str	r3, [fp, #2836]
	ldr	r2, [sp, #992]
	ldr	r3, .L99+292
	str	r2, [fp, #2844]
	add	r2, sl, r3
	ldr	r3, .L99+296
	str	r2, [fp, #2880]
	str	r3, [fp, #2908]
	ldr	r3, .L99+300
	add	r2, sl, r3
	str	r2, [fp, #2928]
	ldr	r2, .L99+304
	mov	r3, #61
	str	r3, [fp, #2936]
	add	r3, sl, r2
	str	r3, [fp, #2976]
	ldr	r3, .L99+308
	mov	r2, #202
	str	r2, [fp, #3004]
	add	r2, sl, r3
	mov	r3, #63
	str	r2, [fp, #3024]
	str	r3, [fp, #3032]
	ldr	r2, [sp, #1108]
	ldr	r3, [sp, #996]
	str	r2, [r3, #16]
	ldr	r2, [sp, #356]
	ldr	r3, [sp, #736]
	str	r2, [r3, #16]
	ldr	r3, [sp, #996]
	ldr	r2, [sp, #740]
	str	r3, [fp, #2852]
	ldr	r3, [sp, #1120]
	str	r3, [r2, #16]
	ldr	r3, [sp, #352]
	ldr	r2, [sp, #844]
	str	r3, [r2, #16]
	ldr	r3, [sp, #348]
	ldr	r2, [sp, #848]
	str	r3, [r2, #16]
	ldr	r2, [sp, #1112]
	mov	r3, #220
	str	r2, [fp, #2856]
	mov	r2, #1
	str	r2, [fp, #2884]
	ldr	r2, [sp, #740]
	str	r3, [fp, #2860]
	sub	r3, r3, #160
	str	r3, [fp, #2888]
	str	r2, [fp, #2892]
	ldr	r3, [sp, #736]
	ldr	r2, [sp, #732]
	str	r3, [fp, #2900]
	str	r2, [fp, #2904]
	ldr	r2, [sp, #736]
	mov	r3, #1
	str	r3, [fp, #2932]
	str	r2, [fp, #2940]
	ldr	r3, [sp, #740]
	ldr	r2, [sp, #1124]
	str	r3, [fp, #2948]
	str	r2, [fp, #2952]
	mov	r3, #225
	mov	r2, #1
	str	r3, [fp, #2956]
	str	r2, [fp, #2980]
	sub	r3, r3, #163
	ldr	r2, [sp, #848]
	str	r3, [fp, #2984]
	ldr	r3, [sp, #844]
	str	r2, [fp, #2988]
	ldr	r2, [sp, #824]
	str	r3, [fp, #2996]
	mov	r3, #1
	str	r2, [fp, #3000]
	str	r3, [fp, #3028]
	ldr	r2, [sp, #844]
	ldr	r3, [sp, #848]
	str	r2, [fp, #3036]
	str	r3, [fp, #3044]
	ldr	r2, [sp, #1128]
	ldr	r3, [sp, #344]
	str	r3, [r2, #16]
	ldr	r3, .L99+312
	add	r2, sl, r3
	str	r2, [fp, #3072]
	ldr	r3, [sp, #340]
	ldr	r2, [sp, #1132]
	str	r3, [r2, #16]
	mov	r3, #64
	ldr	r2, [sp, #1024]
	str	r3, [fp, #3080]
	ldr	r3, [sp, #336]
	str	r3, [r2, #16]
	ldr	r3, .L99+316
	add	r2, sl, r3
	ldr	r3, .L99+320
	str	r2, [fp, #3120]
	add	r2, sl, r3
	mov	r3, #66
	str	r2, [fp, #3168]
	str	r3, [fp, #3176]
	ldr	r3, .L99+324
	mov	r2, #200
	str	r2, [fp, #3196]
	add	r2, sl, r3
	mov	r3, #67
	str	r2, [fp, #3216]
	str	r3, [fp, #3224]
	ldr	r2, [sp, #332]
	ldr	r3, [sp, #1028]
	str	r2, [r3, #16]
	ldr	r3, [sp, #1132]
	ldr	r2, [sp, #1128]
	str	r3, [fp, #3084]
	str	r2, [fp, #3132]
	ldr	r3, [sp, #1028]
	ldr	r2, [sp, #1124]
	str	r3, [fp, #3180]
	str	r2, [fp, #3048]
	ldr	r3, [sp, #1128]
	ldr	r2, [sp, #1144]
	str	r3, [fp, #3092]
	str	r2, [fp, #3096]
	ldr	r3, [sp, #1132]
	ldr	r2, [sp, #1152]
	str	r3, [fp, #3140]
	str	r2, [fp, #3144]
	ldr	r3, [sp, #1024]
	ldr	r2, [sp, #1004]
	str	r3, [fp, #3188]
	str	r2, [fp, #3192]
	mov	r3, #230
	mov	r2, #1
	str	r3, [fp, #3052]
	str	r2, [fp, #3076]
	sub	r3, r3, #8
	str	r2, [fp, #3124]
	add	r2, r2, #64
	str	r3, [fp, #3100]
	str	r2, [fp, #3128]
	sub	r3, r3, #19
	sub	r2, r2, #64
	str	r3, [fp, #3148]
	str	r2, [fp, #3172]
	ldr	r3, [sp, #1028]
	str	r2, [fp, #3220]
	ldr	r2, [sp, #1024]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1040]
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #28]
	ldr	r3, .L99+328
	add	r2, sl, r3
	add	r3, fp, #3552
	str	r3, [sp, #1084]
	add	r3, fp, #3696
	str	r3, [sp, #1160]
	ldr	r3, [sp, #1044]
	str	r2, [ip, #3264]!
	add	r2, fp, #3504
	str	r2, [sp, #1156]
	add	r2, r3, #16
	ldr	r3, [sp, #1040]
	str	r2, [ip, #16]
	add	r0, r3, #16
	ldr	r3, [sp, #1072]
	add	r3, r3, #16
	str	r3, [sp, #328]
	ldr	r3, [sp, #960]
	add	r3, r3, #16
	str	r3, [sp, #324]
	add	r3, fp, #3712
	str	r3, [sp, #316]
	add	r3, fp, #2704
	str	r3, [sp, #312]
	add	r3, fp, #4480
	str	r3, [sp, #308]
	mov	r3, #68
	str	r3, [ip, #8]
	ldr	r3, .L99+332
	add	r2, sl, r3
	ldr	r3, [sp, #1052]
	str	r2, [r3, #0]
	str	r0, [r3, #16]
	ldr	r3, .L99+336
	mov	r0, fp
	add	r2, sl, r3
	ldr	r3, [sp, #972]
	str	r2, [r3, #0]
	ldr	r2, [sp, #328]
	str	r2, [r3, #16]
	ldr	r3, .L99+340
	add	r2, sl, r3
	ldr	r3, [sp, #968]
	str	r2, [r3, #0]
	ldr	r2, [sp, #324]
	str	r2, [r3, #16]
	ldr	r3, .L99+344
	str	ip, [ip, #20]
	add	r2, sl, r3
	ldr	r3, [sp, #1052]
	str	r2, [fp, #3456]
	ldr	r2, [sp, #1048]
	str	r3, [ip, #12]
	ldr	r3, .L99+376
	str	r2, [ip, #24]
	ldr	r2, [sp, #1052]
	str	r3, [ip, #28]
	mov	r3, #69
	str	r3, [r2, #8]
	ldr	r3, [sp, #1032]
	str	ip, [r2, #12]
	str	r3, [r2, #24]
	mov	r3, #74
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	mov	r2, #1
	str	r2, [ip, #4]
	ldr	r3, [sp, #972]
	ldr	r2, [sp, #968]
	str	r2, [r3, #12]
	ldr	r3, [sp, #1052]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #972]
	add	r2, r2, #69
	str	r2, [r3, #8]
	ldr	r2, [sp, #1068]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #968]
	str	r3, [r2, #12]
	ldr	r2, .L99+376
	str	r2, [r3, #28]
	ldr	r3, [sp, #968]
	ldr	r2, .L99+348
	str	r2, [r3, #28]
	ldr	r2, [sp, #968]
	mov	r3, #71
	str	r3, [r2, #8]
	ldr	r3, [sp, #972]
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #980]
	add	r3, r3, #16
	str	r3, [sp, #1164]
	ldr	r3, [sp, #968]
	str	r2, [r3, #4]
	ldr	r2, [sp, #964]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #320]
	mov	r3, #1
	str	r3, [fp, #3460]
	add	r3, r3, #71
	str	r2, [lr, #16]
	str	r3, [fp, #3464]
	ldr	r2, [sp, #316]
	ldr	r3, [sp, #1156]
	str	r2, [r3, #16]
	ldr	r3, .L99+352
	add	r2, sl, r3
	str	r2, [fp, #3504]
	ldr	r3, [sp, #1084]
	ldr	r2, [sp, #312]
	str	r2, [r3, #16]
	ldr	r2, .L99+356
	mov	r3, #73
	str	r3, [fp, #3512]
	add	r3, sl, r2
	str	r3, [fp, #3552]
	ldr	r3, [sp, #1080]
	ldr	r2, .L99+360
	str	r3, [fp, #3576]
	ldr	r3, .L99+364
	str	r2, [fp, #3580]
	add	r2, sl, r3
	mov	r3, #75
	str	r2, [fp, #3600]
	str	r3, [fp, #3608]
	ldr	r2, [sp, #308]
	ldr	r3, [sp, #1088]
	str	r2, [r3, #16]
	str	r3, [fp, #3620]
	ldr	r3, .L99+368
	add	r2, sl, r3
	mov	r3, #76
	str	r3, [fp, #3656]
	ldr	r3, [sp, #1156]
	str	r2, [fp, #3648]
	str	r3, [fp, #3468]
	str	lr, [fp, #3476]
	ldr	r2, [sp, #1100]
	mov	r3, #215
	str	r2, [fp, #3480]
	mov	r2, #1
	str	r3, [fp, #3484]
	str	r2, [fp, #3508]
	ldr	r3, [sp, #1156]
	ldr	r2, .L99+376
	str	r3, [fp, #3524]
	str	r2, [fp, #3532]
	mov	r3, #1
	mov	r2, #74
	str	r3, [fp, #3556]
	str	r2, [fp, #3560]
	ldr	r3, [sp, #1088]
	ldr	r2, [sp, #1084]
	str	r3, [fp, #3564]
	str	r2, [fp, #3572]
	mov	r3, #1
	str	r2, [fp, #3612]
	ldr	r2, [sp, #1104]
	str	r3, [fp, #3604]
	add	r3, r3, #64
	str	r2, [fp, #3624]
	str	r3, [fp, #3628]
	mov	r2, #1
	ldr	r3, [sp, #1160]
	str	r2, [fp, #3652]
	ldr	r2, [sp, #792]
	str	r3, [fp, #3660]
	ldr	r3, .L99+372
	add	r2, r2, #16
	str	r2, [sp, #300]
	add	r2, sl, r3
	add	r3, fp, #3792
	str	r3, [sp, #1148]
	add	r3, fp, #3520
	str	r3, [sp, #304]
	ldr	r3, [sp, #668]
	str	r2, [r0, #3840]!
	add	r3, r3, #16
	add	r2, fp, #4800
	str	r3, [sp, #296]
	add	r3, fp, #6080
	str	r2, [sp, #976]
	str	r3, [sp, #1168]
	add	r2, fp, #5440
	mov	r3, #77
	str	r2, [r4, #16]
	str	lr, [fp, #3516]
	str	r4, [fp, #3528]
	str	r3, [fp, #3704]
	ldr	r3, [sp, #304]
	ldr	r2, [sp, #1160]
	str	r4, [fp, #3708]
	str	r3, [r2, #16]
	ldr	r3, [sp, #300]
	ldr	r2, [sp, #1152]
	str	lr, [fp, #3720]
	str	r3, [r2, #16]
	mov	r3, #78
	str	r3, [fp, #3752]
	ldr	r3, [sp, #1152]
	ldr	r2, .L99+376
	str	r3, [fp, #3804]
	mov	r3, #203
	str	r2, [fp, #3724]
	str	r3, [fp, #3820]
	ldr	r2, [sp, #1148]
	ldr	r3, .L99+380
	str	r8, [r2, #16]
	add	r2, sl, r3
	ldr	r3, .L99+384
	str	r2, [fp, #3696]
	add	r2, sl, r3
	ldr	r3, .L99+388
	str	r2, [fp, #3744]
	add	r2, sl, r3
	str	r2, [fp, #3792]
	ldr	r3, [sp, #976]
	ldr	r2, [sp, #296]
	add	r3, r3, #48
	str	r2, [r0, #16]
	ldr	r2, [sp, #1168]
	str	r3, [sp, #976]
	ldr	r3, [sp, #1116]
	add	r2, r2, #16
	str	r2, [sp, #1168]
	str	r3, [fp, #3672]
	mov	r2, #62
	mov	r3, #1
	str	r2, [fp, #3676]
	str	r3, [fp, #3700]
	ldr	r2, [sp, #1160]
	str	r3, [fp, #3748]
	ldr	r3, [sp, #1148]
	str	r2, [fp, #3716]
	str	r4, [fp, #3668]
	str	r3, [fp, #3756]
	ldr	r2, [sp, #1152]
	ldr	r3, [sp, #796]
	str	r2, [fp, #3764]
	str	r3, [fp, #3768]
	mov	r2, #230
	mov	r3, #1
	str	r2, [fp, #3772]
	str	r3, [fp, #3796]
	sub	r2, r2, #151
	ldr	r3, [sp, #1148]
	str	r2, [fp, #3800]
	ldr	r2, [sp, #1128]
	str	r3, [fp, #3812]
	mov	r3, #2
	str	r2, [fp, #3816]
	str	r3, [r0, #4]
	mov	r2, #1
	ldr	r3, [sp, #664]
	str	r2, [r0, #8]
	ldr	r2, [sp, #648]
	str	r3, [r0, #12]
	ldr	r3, .L102
	add	r2, r2, #16
	str	r2, [r0, #32]
	add	r2, sl, r3
	ldr	r3, [sp, #664]
	str	r0, [r0, #20]
	str	r2, [r3, #0]
	add	r2, r3, #16
	ldr	r3, .L102+4
	str	r2, [sp, #292]
	add	r2, sl, r3
	mov	r3, fp
	str	r2, [r3, #3936]!
	str	r3, [sp, #636]
	ldr	r2, [sp, #624]
	ldr	r3, [sp, #604]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #288]
	str	r3, [sp, #284]
	ldr	r2, [sp, #592]
	ldr	r3, [sp, #640]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #280]
	str	r3, [sp, #276]
	ldr	r2, [sp, #552]
	ldr	r3, [sp, #1108]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #260]
	str	r3, [sp, #252]
	ldr	r2, [sp, #988]
	ldr	r3, [sp, #932]
	add	r2, r2, #16
	str	r2, [sp, #244]
	ldr	r2, [sp, #996]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #240]
	str	r2, [sp, #232]
	ldr	r3, [sp, #892]
	ldr	r2, [sp, #1068]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #228]
	str	r2, [sp, #196]
	ldr	r3, [sp, #1048]
	ldr	r2, [sp, #1100]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #192]
	str	r2, [sp, #188]
	ldr	r3, [sp, #784]
	ldr	r2, [sp, #1028]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #184]
	str	r2, [sp, #180]
	ldr	r3, [sp, #1052]
	ldr	r2, [sp, #964]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #176]
	str	r2, [sp, #168]
	ldr	r3, [sp, #700]
	ldr	r2, [sp, #776]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #160]
	str	r2, [sp, #156]
	ldr	r3, [sp, #1164]
	ldr	r2, [sp, #952]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #144]
	str	r2, [sp, #140]
	ldr	r3, [sp, #568]
	ldr	r2, [sp, #904]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #136]
	str	r2, [sp, #132]
	ldr	r3, [sp, #588]
	ldr	r2, [sp, #732]
	add	r3, r3, #16
	str	r3, [sp, #124]
	ldr	r3, [sp, #760]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #120]
	str	r3, [sp, #116]
	ldr	r2, [sp, #944]
	ldr	r3, [sp, #740]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #112]
	str	r3, [sp, #108]
	ldr	r2, [sp, #848]
	ldr	r3, [sp, #920]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #104]
	str	r3, [sp, #92]
	ldr	r2, [sp, #1000]
	ldr	r3, [sp, #896]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #88]
	str	r3, [sp, #84]
	ldr	r2, [sp, #768]
	ldr	r3, [sp, #824]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #76]
	str	r3, [sp, #68]
	ldr	r2, [sp, #1004]
	ldr	r3, [sp, #1128]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #56]
	str	r3, [sp, #48]
	ldr	r2, [sp, #840]
	ldr	r3, [sp, #872]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #44]
	str	r3, [sp, #28]
	ldr	r2, [sp, #688]
	ldr	r3, [sp, #544]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	ldr	r2, [sp, #712]
	ldr	r3, [sp, #656]
	add	r2, r2, #16
	str	r2, [sp, #16]
	ldr	r2, [sp, #672]
	add	r3, r3, #16
	str	r3, [sp, #12]
	add	r2, r2, #16
	ldr	r3, [sp, #616]
	str	r2, [sp, #8]
	ldr	r2, [sp, #632]
	add	r3, r3, #16
	str	r3, [sp, #4]
	add	r2, r2, #16
	ldr	r3, [sp, #924]
	str	r2, [sp, #0]
	ldr	r2, [sp, #716]
	add	r3, r3, #16
	str	r3, [sp, #272]
	add	r2, r2, #16
	ldr	r3, [sp, #684]
	str	r2, [sp, #268]
	ldr	r2, [sp, #876]
	add	r3, r3, #16
	str	r3, [sp, #264]
	add	r2, r2, #16
	ldr	r3, [sp, #936]
	str	r2, [sp, #256]
	ldr	r2, [sp, #900]
	add	r3, r3, #16
	str	r3, [sp, #248]
	add	r2, r2, #16
	add	r3, fp, #3616
	str	r2, [sp, #236]
	str	r3, [sp, #220]
	add	r2, fp, #2752
	add	r3, fp, #3472
	str	r2, [sp, #212]
	str	r3, [sp, #208]
	ldr	r2, [sp, #1064]
	ldr	r3, [sp, #556]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #200]
	str	r3, [sp, #172]
	add	r2, fp, #16
	add	r3, fp, #3760
	str	r2, [sp, #164]
	str	r3, [sp, #152]
	ldr	r2, [sp, #948]
	ldr	r3, [sp, #940]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #148]
	str	r3, [sp, #128]
	add	r3, r5, #16
	str	r3, [sp, #80]
	ldr	r3, [sp, #1144]
	add	r2, fp, #3664
	add	r3, r3, #16
	str	r2, [sp, #96]
	str	r3, [sp, #64]
	ldr	r2, [sp, #868]
	ldr	r3, [sp, #1020]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #72]
	str	r3, [sp, #52]
	add	r2, r7, #16
	mov	r3, #210
	str	r3, [r0, #44]
	str	r2, [sp, #60]
	ldr	r3, .L102+8
	ldr	r2, [sp, #644]
	str	r0, [r0, #36]
	str	r2, [r0, #40]
	add	r2, sl, r3
	ldr	r3, [sp, #640]
	str	r2, [r3, #0]
	ldr	r2, [sp, #664]
	ldr	r3, [sp, #636]
	str	r1, [r2, #16]
	ldr	r2, [sp, #292]
	str	r2, [r3, #16]
	ldr	r2, [sp, #288]
	str	r2, [r3, #32]
	ldr	r2, [sp, #284]
	ldr	r3, [sp, #640]
	str	r2, [r3, #16]
	ldr	r3, [sp, #672]
	ldr	r2, .L102+240
	str	r3, [r0, #24]
	ldr	r3, [sp, #664]
	str	r2, [r0, #28]
	mov	r2, #1
	str	r2, [r3, #8]
	ldr	r2, [sp, #640]
	str	r0, [r3, #12]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #636]
	ldr	r2, [sp, #620]
	str	r0, [r3, #24]
	str	r2, [r3, #40]
	ldr	r3, [sp, #664]
	mov	r2, #191
	str	r2, [r3, #28]
	ldr	r3, [sp, #636]
	str	r2, [r3, #28]
	add	r2, r2, #20
	str	r2, [r3, #44]
	ldr	r2, [sp, #640]
	str	r2, [r3, #12]
	ldr	r3, [sp, #664]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r3, [sp, #636]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	ldr	r3, [sp, #640]
	add	r2, r2, #1
	str	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #8]
	ldr	r2, [sp, #636]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #608]
	str	r2, [r3, #24]
	mov	r2, #182
	str	r2, [r3, #28]
	ldr	r3, [sp, #600]
	ldr	r2, [sp, #596]
	str	r2, [r3, #24]
	mov	r2, #216
	str	r2, [r3, #28]
	ldr	r2, [sp, #636]
	str	r2, [r3, #40]
	mov	r2, #182
	str	r2, [r3, #44]
	ldr	r3, .L102+12
	add	r2, sl, r3
	ldr	r3, [sp, #600]
	str	r2, [r3, #0]
	ldr	r2, [sp, #280]
	str	r2, [r3, #16]
	ldr	r2, [sp, #276]
	str	r2, [r3, #32]
	ldr	r3, .L102+16
	add	r2, sl, r3
	ldr	r3, [sp, #608]
	str	r2, [r3, #0]
	ldr	r2, [sp, #272]
	str	r2, [r3, #16]
	ldr	r3, .L102+20
	add	r2, sl, r3
	ldr	r3, [sp, #692]
	str	r2, [r3, #0]
	ldr	r2, [sp, #268]
	str	r2, [r3, #16]
	ldr	r2, [sp, #264]
	str	r2, [r3, #32]
	ldr	r3, .L102+24
	add	r2, sl, r3
	ldr	r3, [sp, #700]
	str	r2, [r3, #0]
	ldr	r2, [sp, #600]
	ldr	r3, [sp, #608]
	str	r3, [r2, #12]
	mov	r3, #3
	str	r3, [r2, #8]
	ldr	r2, [sp, #608]
	add	r3, r3, #142
	str	r3, [r2, #28]
	ldr	r2, [sp, #600]
	ldr	r3, [sp, #608]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	mov	r2, #3
	str	r2, [r3, #8]
	ldr	r3, [sp, #692]
	ldr	r2, .L102+28
	str	r2, [r3, #28]
	ldr	r3, [sp, #608]
	str	r3, [r3, #20]
	ldr	r2, [sp, #920]
	str	r2, [r3, #24]
	ldr	r3, [sp, #600]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r3, [sp, #692]
	add	r2, r2, r2
	str	r2, [r3, #8]
	ldr	r3, [sp, #608]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #692]
	ldr	r2, [sp, #700]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #712]
	str	r3, [r3, #36]
	str	r2, [r3, #24]
	ldr	r2, [sp, #688]
	str	r2, [r3, #40]
	mov	r2, #215
	str	r2, [r3, #44]
	ldr	r3, [sp, #700]
	sub	r2, r2, #212
	str	r2, [r3, #4]
	ldr	r2, [sp, #260]
	str	r2, [r3, #16]
	ldr	r3, .L102+32
	add	r2, sl, r3
	ldr	r3, [sp, #888]
	str	r2, [r3, #0]
	ldr	r2, [sp, #256]
	str	r2, [r3, #16]
	ldr	r2, [sp, #252]
	str	r2, [r3, #32]
	ldr	r3, .L102+36
	add	r2, sl, r3
	ldr	r3, [sp, #896]
	str	r2, [r3, #0]
	ldr	r2, [sp, #248]
	str	r2, [r3, #16]
	ldr	r3, .L102+40
	add	r2, sl, r3
	ldr	r3, [sp, #912]
	str	r2, [r3, #0]
	ldr	r2, [sp, #244]
	str	r2, [r3, #16]
	ldr	r3, [sp, #700]
	ldr	r2, [sp, #692]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #556]
	str	r2, [r3, #24]
	mov	r2, #4
	str	r2, [r3, #8]
	add	r2, r2, #181
	str	r2, [r3, #28]
	ldr	r3, [sp, #888]
	add	r2, r2, #41
	str	r2, [r3, #28]
	ldr	r2, [sp, #896]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #872]
	str	r3, [r3, #36]
	str	r2, [r3, #24]
	ldr	r2, [sp, #1112]
	str	r2, [r3, #40]
	mov	r2, #5
	str	r2, [r3, #8]
	ldr	r2, .L102+44
	str	r2, [r3, #44]
	ldr	r2, [sp, #896]
	str	r3, [r2, #12]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r3, [sp, #896]
	ldr	r2, [sp, #928]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #984]
	ldr	r3, [sp, #912]
	str	r2, [r3, #24]
	ldr	r3, [sp, #896]
	mov	r2, #3
	str	r2, [r3, #4]
	add	r2, r2, #2
	str	r2, [r3, #8]
	add	r2, r2, #182
	str	r2, [r3, #28]
	ldr	r3, [sp, #912]
	sub	r2, r2, #185
	str	r2, [r3, #4]
	add	r2, r2, #4
	str	r2, [r3, #8]
	ldr	r2, [sp, #908]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	mov	r2, #223
	str	r2, [r3, #28]
	ldr	r2, [sp, #240]
	str	r2, [r3, #32]
	ldr	r3, .L102+48
	add	r2, sl, r3
	ldr	r3, [sp, #908]
	str	r2, [r3, #0]
	ldr	r2, [sp, #236]
	str	r2, [r3, #16]
	ldr	r3, .L102+52
	add	r2, sl, r3
	ldr	r3, [sp, #1104]
	str	r2, [r3, #0]
	ldr	r3, .L102+56
	ldr	r2, .L102+60
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L102+64
	add	r2, r2, #48
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r2, [sp, #1104]
	ldr	r3, [sp, #232]
	str	r3, [r2, #16]
	ldr	r3, [sp, #228]
	str	r3, [r2, #32]
	ldr	r3, [sp, #220]
	ldr	r2, [sp, #1112]
	str	r3, [r2, #16]
	ldr	r2, [sp, #912]
	ldr	r3, [sp, #936]
	str	r2, [r2, #36]
	str	r3, [r2, #40]
	ldr	r3, [sp, #908]
	str	r2, [r3, #12]
	ldr	r3, .L102+68
	str	r3, [r2, #44]
	ldr	r2, [sp, #908]
	sub	r3, r3, #332
	str	r3, [r2, #8]
	add	r3, r3, #73
	str	r3, [r2, #28]
	ldr	r2, [sp, #1104]
	add	r3, r3, #255
	str	r3, [r2, #44]
	ldr	r2, [sp, #908]
	ldr	r3, [sp, #904]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1104]
	ldr	r3, [sp, #992]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1112]
	str	r3, [r2, #12]
	ldr	r2, [sp, #908]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r2, [sp, #1104]
	add	r3, r3, #4
	str	r3, [r2, #8]
	add	r3, r3, #213
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	ldr	r2, [sp, #1112]
	sub	r3, r3, #155
	str	r3, [r2, #28]
	sub	r3, r3, #58
	str	r3, [r2, #8]
	ldr	r2, [sp, #1104]
	ldr	r3, [sp, #896]
	str	r2, [r2, #36]
	str	r3, [r2, #40]
	ldr	r3, [sp, #1112]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1084]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1104]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r3, [sp, #1112]
	add	r2, r2, #1
	str	r3, [r3, #20]
	str	r2, [r3, #4]
	ldr	r3, [sp, #1092]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, .L102+72
	ldr	r2, .L102+76
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, [sp, #1092]
	ldr	r2, .L102+80
	str	r2, [r3, #28]
	ldr	r2, [sp, #1076]
	str	r2, [r3, #24]
	ldr	r2, [sp, #1156]
	str	r2, [r3, #40]
	ldr	r2, [sp, #212]
	str	r2, [r3, #16]
	ldr	r2, [sp, #208]
	str	r2, [r3, #32]
	ldr	r3, .L102+84
	add	r2, sl, r3
	ldr	r3, [sp, #1056]
	str	r2, [r3, #0]
	ldr	r3, [sp, #200]
	ldr	r2, [sp, #1100]
	str	r3, [r2, #16]
	ldr	r3, .L102+88
	add	r2, sl, r3
	ldr	r3, [sp, #1064]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1056]
	ldr	r3, [sp, #196]
	str	r3, [r2, #16]
	ldr	r3, [sp, #192]
	str	r3, [r2, #32]
	ldr	r2, [sp, #1092]
	ldr	r3, [sp, #1100]
	str	r3, [r2, #12]
	mov	r3, #8
	str	r3, [r2, #8]
	add	r3, r3, #207
	str	r3, [r2, #44]
	ldr	r2, [sp, #1100]
	sub	r3, r3, #207
	str	r3, [r2, #8]
	ldr	r2, [sp, #1092]
	str	r2, [r2, #20]
	ldr	r3, [sp, #1100]
	str	r2, [r2, #36]
	mov	r2, #193
	str	r2, [r3, #28]
	ldr	r3, [sp, #1056]
	add	r2, r2, #97
	str	r2, [r3, #28]
	sub	r2, r2, #77
	str	r2, [r3, #44]
	ldr	r3, [sp, #1100]
	ldr	r2, [sp, #1092]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1056]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1072]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1044]
	str	r3, [r2, #40]
	ldr	r2, [sp, #1100]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r2, [sp, #1056]
	add	r3, r3, #6
	str	r3, [r2, #8]
	ldr	r2, [sp, #1064]
	str	r3, [r2, #8]
	ldr	r3, [sp, #1056]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #1064]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	str	r3, [r3, #36]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r3, [sp, #1056]
	str	r3, [r2, #12]
	mov	r3, #193
	str	r3, [r2, #28]
	ldr	r3, [sp, #1092]
	str	r3, [r2, #24]
	ldr	r3, [sp, #188]
	str	r3, [r2, #16]
	ldr	r2, [sp, #1032]
	ldr	r3, [sp, #780]
	str	r3, [r2, #24]
	mov	r3, #223
	str	r3, [r2, #28]
	ldr	r3, [sp, #1024]
	str	r3, [r2, #40]
	ldr	r3, [sp, #184]
	str	r3, [r2, #16]
	ldr	r3, [sp, #180]
	str	r3, [r2, #32]
	ldr	r3, .L102+92
	add	r2, sl, r3
	ldr	r3, [sp, #1032]
	str	r2, [r3, #0]
	ldr	r3, [sp, #176]
	ldr	r2, [sp, #1040]
	str	r3, [r2, #16]
	ldr	r3, .L102+96
	add	r2, sl, r3
	ldr	r3, [sp, #1040]
	str	r2, [r3, #0]
	ldr	r3, [sp, #172]
	ldr	r2, [sp, #980]
	str	r3, [r2, #16]
	ldr	r3, .L102+100
	add	r2, sl, r3
	ldr	r3, [sp, #980]
	str	r2, [r3, #0]
	ldr	r2, [sp, #956]
	str	r2, [r3, #32]
	ldr	r3, [sp, #1064]
	ldr	r2, [sp, #1032]
	str	r3, [r3, #20]
	mov	r3, #10
	str	r3, [r2, #8]
	ldr	r3, [sp, #1040]
	str	r3, [r2, #12]
	str	ip, [r3, #24]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	mov	r3, #220
	str	r3, [r2, #44]
	ldr	r2, [sp, #1040]
	sub	r3, r3, #146
	str	r3, [r2, #28]
	sub	r3, r3, #64
	str	r3, [r2, #8]
	ldr	r2, [sp, #1032]
	sub	r3, r3, #8
	str	r3, [r2, #4]
	ldr	r2, [sp, #1040]
	add	r3, r3, #1
	str	r3, [r2, #4]
	str	r2, [r2, #20]
	ldr	r2, [sp, #980]
	add	r3, r3, #8
	str	r3, [r2, #8]
	sub	r3, r3, #9
	str	r3, [r2, #4]
	ldr	r3, [sp, #976]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #548]
	str	r2, [r2, #36]
	str	r3, [r2, #24]
	mov	r3, #190
	str	r3, [r2, #28]
	ldr	r3, .L102+104
	add	r2, sl, r3
	ldr	r3, [sp, #976]
	str	r2, [r3, #0]
	ldr	r2, [sp, #168]
	str	r2, [r3, #16]
	ldr	r3, .L102+108
	add	r2, sl, r3
	ldr	r3, [sp, #548]
	str	r2, [r3, #0]
	ldr	r2, [sp, #164]
	str	r2, [r3, #16]
	ldr	r2, [sp, #160]
	str	r2, [r3, #32]
	ldr	r3, .L102+112
	add	r2, sl, r3
	ldr	r3, [sp, #556]
	str	r2, [r3, #0]
	ldr	r3, .L102+116
	add	r2, sl, r3
	ldr	r3, [sp, #788]
	str	r2, [r3, #0]
	ldr	r2, [sp, #980]
	ldr	r3, .L102+120
	str	r3, [r2, #44]
	ldr	r2, [sp, #976]
	mov	r3, #11
	str	r3, [r2, #8]
	ldr	r3, [sp, #576]
	ldr	r2, [sp, #980]
	str	r3, [r2, #40]
	ldr	r2, [sp, #976]
	ldr	r3, [sp, #960]
	str	r3, [r2, #24]
	ldr	r3, [sp, #980]
	str	r3, [r2, #12]
	ldr	r3, [sp, #692]
	ldr	r2, [sp, #548]
	str	r3, [r2, #40]
	ldr	r2, [sp, #976]
	mov	r3, #60
	str	r3, [r2, #28]
	ldr	r2, [sp, #548]
	add	r3, r3, #158
	str	r3, [r2, #28]
	sub	r3, r3, #33
	str	r3, [r2, #44]
	ldr	r2, [sp, #976]
	sub	r3, r3, #182
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r2, [sp, #548]
	add	r3, r3, #9
	str	r3, [r2, #8]
	ldr	r2, [sp, #556]
	add	r3, r3, #178
	str	r3, [r2, #28]
	sub	r3, r3, #178
	str	r3, [r2, #8]
	ldr	r3, [sp, #548]
	str	r2, [r3, #12]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #544]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #556]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r3, [sp, #1164]
	str	r2, [r2, #20]
	str	r3, [r2, #16]
	ldr	r3, [sp, #976]
	str	r3, [r2, #24]
	ldr	r2, [sp, #788]
	mov	r3, #2
	str	r3, [r2, #4]
	add	r3, r3, #11
	str	r3, [r2, #8]
	ldr	r3, [sp, #796]
	str	r3, [r2, #12]
	ldr	r3, [sp, #772]
	str	r3, [r2, #24]
	mov	r3, #214
	str	r3, [r2, #28]
	ldr	r3, [sp, #1148]
	str	r3, [r2, #40]
	ldr	r3, [sp, #156]
	str	r3, [r2, #16]
	ldr	r3, [sp, #152]
	str	r3, [r2, #32]
	ldr	r3, .L102+124
	add	r2, sl, r3
	ldr	r3, [sp, #796]
	str	r2, [r3, #0]
	ldr	r2, [sp, #148]
	str	r2, [r3, #16]
	ldr	r3, .L102+128
	add	r2, sl, r3
	ldr	r3, [sp, #580]
	str	r2, [r3, #0]
	ldr	r2, [sp, #144]
	str	r2, [r3, #16]
	ldr	r2, [sp, #140]
	str	r2, [r3, #32]
	ldr	r3, .L102+132
	add	r2, sl, r3
	ldr	r3, [sp, #576]
	str	r2, [r3, #0]
	ldr	r2, [sp, #136]
	str	r2, [r3, #16]
	ldr	r3, [sp, #788]
	ldr	r2, [sp, #796]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	mov	r2, #230
	str	r2, [r3, #44]
	ldr	r3, [sp, #796]
	sub	r2, r2, #90
	str	r2, [r3, #28]
	sub	r2, r2, #127
	str	r2, [r3, #8]
	ldr	r3, [sp, #580]
	add	r2, r2, #432
	str	r2, [r3, #28]
	sub	r2, r2, #131
	str	r2, [r3, #44]
	ldr	r3, [sp, #796]
	ldr	r2, [sp, #952]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #580]
	ldr	r2, [sp, #976]
	str	r2, [r3, #24]
	ldr	r2, [sp, #948]
	str	r2, [r3, #40]
	ldr	r3, [sp, #796]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r3, [sp, #580]
	add	r2, r2, #11
	str	r2, [r3, #8]
	ldr	r3, [sp, #576]
	str	r2, [r3, #8]
	ldr	r2, [sp, #580]
	mov	r3, #2
	str	r3, [r2, #4]
	ldr	r3, [sp, #576]
	str	r3, [r2, #12]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r2, [sp, #572]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #62
	str	r2, [r3, #28]
	ldr	r3, [sp, #856]
	ldr	r2, [sp, #900]
	str	r2, [r3, #24]
	ldr	r2, .L102+136
	str	r2, [r3, #28]
	sub	r2, r2, #106
	str	r2, [r3, #44]
	ldr	r2, [sp, #132]
	str	r2, [r3, #16]
	ldr	r2, [sp, #128]
	str	r2, [r3, #32]
	ldr	r3, .L102+140
	add	r2, sl, r3
	ldr	r3, [sp, #856]
	str	r2, [r3, #0]
	ldr	r3, [sp, #124]
	ldr	r2, [sp, #852]
	str	r3, [r2, #16]
	ldr	r3, .L102+144
	add	r2, sl, r3
	ldr	r3, [sp, #852]
	str	r2, [r3, #0]
	ldr	r3, [sp, #120]
	ldr	r2, [sp, #744]
	str	r3, [r2, #16]
	ldr	r3, .L102+148
	add	r2, sl, r3
	ldr	r3, [sp, #744]
	str	r2, [r3, #0]
	ldr	r2, [sp, #116]
	str	r2, [r3, #32]
	ldr	r3, [sp, #856]
	ldr	r2, [sp, #852]
	str	r2, [r3, #12]
	str	r3, [r3, #20]
	ldr	r2, [sp, #944]
	str	r3, [r3, #36]
	str	r2, [r3, #40]
	ldr	r2, [sp, #852]
	str	r3, [r2, #12]
	ldr	r3, [sp, #584]
	str	r3, [r2, #24]
	ldr	r2, [sp, #744]
	ldr	r3, [sp, #728]
	str	r3, [r2, #24]
	ldr	r3, [sp, #756]
	str	r3, [r2, #40]
	ldr	r2, [sp, #856]
	mov	r3, #15
	str	r3, [r2, #8]
	ldr	r2, [sp, #852]
	str	r3, [r2, #8]
	add	r3, r3, #55
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	ldr	r2, [sp, #856]
	sub	r3, r3, #68
	str	r3, [r2, #4]
	ldr	r2, [sp, #744]
	add	r3, r3, #14
	str	r3, [r2, #8]
	ldr	r2, [sp, #852]
	sub	r3, r3, #13
	str	r3, [r2, #4]
	ldr	r2, [sp, #744]
	ldr	r3, [sp, #752]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	mov	r3, #2
	str	r3, [r2, #4]
	add	r3, r3, #223
	str	r3, [r2, #28]
	sub	r3, r3, #5
	str	r3, [r2, #44]
	str	r2, [r2, #36]
	ldr	r2, [sp, #752]
	sub	r3, r3, #74
	str	r3, [r2, #28]
	ldr	r3, [sp, #744]
	str	r3, [r2, #12]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r3, [sp, #940]
	str	r3, [r2, #24]
	ldr	r3, [sp, #112]
	str	r3, [r2, #16]
	ldr	r3, .L102+152
	add	r2, sl, r3
	ldr	r3, [sp, #752]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1116]
	ldr	r3, [sp, #736]
	str	r3, [r2, #24]
	mov	r3, #225
	str	r3, [r2, #28]
	ldr	r3, [sp, #844]
	str	r3, [r2, #40]
	ldr	r3, .L102+156
	add	r2, sl, r3
	ldr	r3, [sp, #1116]
	str	r2, [r3, #0]
	ldr	r3, .L102+160
	ldr	r2, .L102+164
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r2, [sp, #1116]
	ldr	r3, [sp, #108]
	str	r3, [r2, #16]
	ldr	r3, [sp, #104]
	str	r3, [r2, #32]
	ldr	r3, .L102+168
	add	r2, sl, r3
	ldr	r3, [sp, #928]
	str	r2, [r3, #0]
	ldr	r3, [sp, #96]
	ldr	r2, [sp, #1124]
	str	r3, [r2, #16]
	ldr	r3, [sp, #92]
	ldr	r2, [sp, #928]
	str	r3, [r2, #16]
	ldr	r2, [sp, #752]
	mov	r3, #3
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r3, [sp, #1124]
	ldr	r2, [sp, #1116]
	str	r3, [r2, #12]
	ldr	r2, [sp, #1160]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1116]
	mov	r2, #17
	str	r2, [r3, #8]
	ldr	r2, [sp, #1124]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	mov	r2, #230
	str	r2, [r3, #44]
	ldr	r3, [sp, #1124]
	sub	r2, r2, #168
	str	r2, [r3, #28]
	sub	r2, r2, #45
	str	r2, [r3, #8]
	ldr	r3, [sp, #1116]
	sub	r2, r2, #15
	str	r2, [r3, #4]
	ldr	r3, [sp, #1124]
	add	r2, r2, #1
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	ldr	r3, [sp, #928]
	add	r2, r2, #15
	str	r2, [r3, #8]
	sub	r2, r2, #16
	str	r2, [r3, #4]
	ldr	r2, [sp, #936]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #924]
	str	r2, [r3, #24]
	ldr	r2, [sp, #908]
	str	r2, [r3, #40]
	mov	r2, #215
	str	r2, [r3, #28]
	add	r2, r2, #123
	str	r2, [r3, #44]
	ldr	r3, [sp, #936]
	sub	r2, r2, #151
	str	r2, [r3, #28]
	ldr	r2, [sp, #888]
	str	r2, [r3, #24]
	ldr	r2, [sp, #88]
	ldr	r3, [sp, #928]
	str	r2, [r3, #32]
	ldr	r3, [sp, #936]
	mov	r2, #18
	str	r2, [r3, #8]
	ldr	r2, [sp, #84]
	str	r2, [r3, #16]
	ldr	r3, .L102+172
	add	r2, sl, r3
	ldr	r3, [sp, #936]
	str	r2, [r3, #0]
	ldr	r3, [sp, #80]
	ldr	r2, [sp, #860]
	str	r3, [r2, #16]
	ldr	r3, .L102+176
	add	r2, sl, r3
	ldr	r3, [sp, #860]
	str	r2, [r3, #0]
	ldr	r2, [sp, #76]
	str	r2, [r3, #32]
	mov	r2, #228
	str	r2, [r3, #44]
	ldr	r3, .L102+180
	b	.L103
.L104:
	.align	2
.L102:
	.word	.LC83(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	394
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	334
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.word	.LC95(GOTOFF)
	.word	4464
	.word	.LC96(GOTOFF)
	.word	338
	.word	.LC97(GOTOFF)
	.word	4560
	.word	291
	.word	.LC98(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	.LC100(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC103(GOTOFF)
	.word	.LC104(GOTOFF)
	.word	.LC105(GOTOFF)
	.word	.LC106(GOTOFF)
	.word	445
	.word	.LC107(GOTOFF)
	.word	.LC108(GOTOFF)
	.word	.LC109(GOTOFF)
	.word	411
	.word	.LC110(GOTOFF)
	.word	.LC111(GOTOFF)
	.word	.LC112(GOTOFF)
	.word	.LC113(GOTOFF)
	.word	.LC114(GOTOFF)
	.word	.LC115(GOTOFF)
	.word	5424
	.word	.LC116(GOTOFF)
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC119(GOTOFF)
	.word	.LC120(GOTOFF)
	.word	.LC121(GOTOFF)
	.word	.LC122(GOTOFF)
	.word	.LC123(GOTOFF)
	.word	.LC124(GOTOFF)
	.word	.LC125(GOTOFF)
	.word	.LC126(GOTOFF)
	.word	.LC127(GOTOFF)
	.word	6000
	.word	.LC128(GOTOFF)
	.word	.LC129(GOTOFF)
	.word	.LC130(GOTOFF)
	.word	.LC131(GOTOFF)
	.word	.LC132(GOTOFF)
	.word	410
	.word	.LC133(GOTOFF)
	.word	.LC134(GOTOFF)
	.word	.LC135(GOTOFF)
	.word	.LC142(GOTOFF)
	.word	.LC143(GOTOFF)
	.word	.LC136(GOTOFF)
	.word	.LC137(GOTOFF)
	.word	.LC144(GOTOFF)
	.word	.LC145(GOTOFF)
	.word	.LC138(GOTOFF)
	.word	.LC139(GOTOFF)
	.word	.LC140(GOTOFF)
	.word	.LC141(GOTOFF)
.L103:
	add	r2, sl, r3
	ldr	r3, [sp, #868]
	str	r2, [r3, #0]
	ldr	r2, [sp, #836]
	str	r2, [r3, #16]
	ldr	r3, [sp, #928]
	ldr	r2, [sp, #936]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	ldr	r2, [sp, #764]
	ldr	r3, [sp, #860]
	str	r2, [r3, #40]
	ldr	r3, [sp, #936]
	mov	r2, #3
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	ldr	r2, [sp, #868]
	ldr	r3, [sp, #860]
	str	r2, [r3, #12]
	mov	r2, #2
	str	r2, [r3, #4]
	add	r2, r2, #151
	str	r2, [r3, #8]
	add	r2, r2, #77
	str	r6, [r3, #24]
	str	r2, [r3, #28]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	ldr	r3, [sp, #868]
	sub	r2, r2, #77
	str	r2, [r3, #8]
	sub	r2, r2, #150
	str	r2, [r3, #4]
	ldr	r2, [sp, #860]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #840]
	str	r2, [r3, #24]
	mov	r2, #24
	str	r2, [r3, #28]
	ldr	r3, [sp, #832]
	ldr	r2, [sp, #860]
	str	r2, [r3, #24]
	ldr	r2, [sp, #828]
	str	r2, [r3, #40]
	mov	r2, #224
	str	r2, [r3, #44]
	ldr	r3, .L102+184
	add	r2, sl, r3
	ldr	r3, [sp, #832]
	str	r2, [r3, #0]
	ldr	r2, [sp, #72]
	str	r2, [r3, #16]
	ldr	r2, [sp, #68]
	str	r2, [r3, #32]
	ldr	r3, .L102+188
	add	r2, sl, r3
	ldr	r3, [sp, #840]
	str	r2, [r3, #0]
	ldr	r2, [sp, #64]
	str	r2, [r3, #16]
	ldr	r3, .L102+192
	add	r2, sl, r3
	ldr	r3, [sp, #1012]
	str	r2, [r3, #0]
	ldr	r2, [sp, #60]
	str	r2, [r3, #16]
	ldr	r2, [sp, #56]
	str	r2, [r3, #32]
	ldr	r3, .L102+196
	add	r2, sl, r3
	ldr	r3, [sp, #1020]
	str	r2, [r3, #0]
	ldr	r2, [sp, #832]
	ldr	r3, [sp, #840]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	mov	r3, #154
	str	r3, [r2, #8]
	sub	r3, r3, #130
	str	r3, [r2, #28]
	ldr	r2, [sp, #840]
	add	r3, r3, #130
	str	r3, [r2, #8]
	ldr	r2, [sp, #832]
	ldr	r3, [sp, #840]
	str	r2, [r2, #36]
	ldr	r2, [sp, #1136]
	str	r2, [r3, #24]
	ldr	r2, [sp, #832]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1008]
	ldr	r3, [sp, #1012]
	str	r2, [r3, #40]
	ldr	r3, [sp, #840]
	mov	r2, #32
	str	r2, [r3, #28]
	str	r3, [r3, #20]
	ldr	r3, [sp, #1012]
	add	r2, r2, #195
	str	r2, [r3, #44]
	ldr	r3, [sp, #832]
	sub	r2, r2, #225
	str	r2, [r3, #4]
	ldr	r3, [sp, #1012]
	add	r2, r2, #153
	str	r2, [r3, #8]
	ldr	r3, [sp, #840]
	sub	r2, r2, #152
	str	r2, [r3, #4]
	ldr	r3, [sp, #1012]
	ldr	r2, [sp, #1020]
	str	r2, [r3, #12]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #1168]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #247
	str	r3, [r3, #36]
	str	r2, [r3, #28]
	ldr	r3, [sp, #1020]
	sub	r2, r2, #244
	str	r2, [r3, #4]
	add	r2, r2, #152
	str	r2, [r3, #8]
	ldr	r2, [sp, #1140]
	str	r2, [r3, #16]
	ldr	r3, .L102+200
	add	r2, sl, r3
	ldr	r3, [sp, #1136]
	str	r2, [r3, #0]
	mov	r2, #2
	str	r2, [r3, #4]
	ldr	r2, [sp, #52]
	str	r2, [r3, #16]
	ldr	r2, [sp, #48]
	str	r2, [r3, #32]
	ldr	r3, .L102+204
	add	r2, sl, r3
	ldr	r3, [sp, #1144]
	str	r2, [r3, #0]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r2, [sp, #44]
	str	r2, [r3, #16]
	ldr	r3, .L102+208
	add	r2, sl, r3
	ldr	r3, [sp, #864]
	str	r2, [r5, #0]
	str	r3, [r5, #16]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #1012]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #1144]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1136]
	ldr	r3, [sp, #1012]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1132]
	str	r3, [r2, #40]
	ldr	r2, [sp, #1020]
	mov	r3, #24
	str	r3, [r2, #28]
	ldr	r2, [sp, #1136]
	str	r3, [r2, #28]
	add	r3, r3, #198
	str	r3, [r2, #44]
	ldr	r3, [sp, #1144]
	str	r3, [r2, #12]
	ldr	r2, [sp, #832]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1136]
	ldr	r2, [sp, #1144]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	ldr	r3, [sp, #868]
	ldr	r2, [sp, #1136]
	str	r3, [r5, #24]
	mov	r3, #156
	str	r3, [r2, #8]
	ldr	r2, [sp, #1144]
	sub	r3, r3, #124
	str	r3, [r2, #28]
	add	r3, r3, #124
	str	r3, [r2, #8]
	ldr	r3, [sp, #1144]
	mov	r2, #230
	str	r3, [r3, #20]
	str	r2, [r5, #28]
	ldr	r3, .L102+212
	sub	r2, r2, #226
	str	r2, [r5, #4]
	ldr	r2, .L102+216
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L102+220
	add	r2, r2, #48
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, .L102+224
	add	r2, r2, #48
	add	r3, sl, r3
	str	r3, [fp, r2]
	ldr	r3, [sp, #1020]
	str	r6, [r5, #12]
	str	r5, [r5, #20]
	str	r5, [r6, #12]
	str	r3, [r7, #24]
	ldr	r3, .L102+228
	str	r7, [r7, #20]
	add	r2, sl, r3
	ldr	r3, [sp, #880]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1016]
	ldr	r3, .L102+232
	str	r2, [r7, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #884]
	str	r2, [r3, #0]
	ldr	r3, .L102+236
	mov	r2, #247
	str	r2, [r7, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #704]
	str	r2, [r3, #0]
	ldr	r2, [sp, #880]
	ldr	r3, [sp, #28]
	str	r3, [r2, #16]
	ldr	r3, .L102+240
	str	r3, [r2, #28]
	ldr	r3, .L102+244
	add	r2, sl, r3
	ldr	r3, [sp, #708]
	str	r2, [r3, #0]
	ldr	r2, [sp, #704]
	ldr	r3, [sp, #24]
	str	r3, [r2, #16]
	mov	r3, #320
	str	r3, [r2, #28]
	ldr	r3, .L102+248
	add	r2, sl, r3
	ldr	r3, [sp, #560]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1168]
	ldr	r3, [sp, #880]
	str	r2, [r7, #12]
	str	r7, [r2, #12]
	ldr	r2, [sp, #876]
	str	r2, [r3, #24]
	mov	r3, #5
	str	r3, [r6, #4]
	ldr	r2, [sp, #880]
	ldr	r3, [sp, #884]
	str	r3, [r2, #12]
	ldr	r3, [sp, #880]
	mov	r2, #4
	str	r2, [r7, #4]
	str	r3, [r3, #20]
	ldr	r2, [sp, #884]
	str	r3, [r2, #12]
	ldr	r2, [sp, #684]
	ldr	r3, [sp, #704]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1168]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r2, [sp, #708]
	ldr	r3, [sp, #704]
	str	r2, [r3, #12]
	ldr	r3, [sp, #880]
	mov	r2, #4
	str	r2, [r3, #4]
	ldr	r3, [sp, #704]
	ldr	r2, [sp, #708]
	str	r3, [r3, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #884]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #704]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #708]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #560]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	str	fp, [r3, #24]
	ldr	r3, .L102+252
	add	r2, sl, r3
	ldr	r3, [sp, #564]
	str	r2, [r3, #0]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #560]
	str	r3, [r2, #16]
	ldr	r3, .L102+256
	add	r2, sl, r3
	ldr	r3, [sp, #720]
	str	r2, [r3, #0]
	ldr	r2, [sp, #560]
	mov	r3, #500
	str	r3, [r2, #28]
	ldr	r3, .L102+260
	add	r2, sl, r3
	ldr	r3, [sp, #724]
	str	r2, [r3, #0]
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #720]
	str	r3, [r2, #16]
	ldr	r3, .L102+264
	add	r2, sl, r3
	ldr	r3, [sp, #800]
	str	r2, [r3, #0]
	ldr	r2, [sp, #720]
	mov	r3, #145
	str	r3, [r2, #28]
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #800]
	str	r3, [r2, #16]
	ldr	r3, .L102+268
	add	r2, sl, r3
	ldr	r3, [sp, #804]
	str	r2, [r3, #0]
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #676]
	str	r3, [r2, #16]
	ldr	r3, .L102+272
	add	r2, sl, r3
	ldr	r3, [sp, #676]
	str	r2, [r3, #0]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #564]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	str	r2, [r3, #12]
	ldr	r2, [sp, #720]
	ldr	r3, [sp, #716]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #724]
	str	r3, [r2, #12]
	str	r2, [r3, #12]
	ldr	r3, [sp, #652]
	ldr	r2, [sp, #800]
	str	r3, [r2, #24]
	ldr	r2, [sp, #564]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r3, [sp, #804]
	ldr	r2, [sp, #800]
	str	r3, [r2, #12]
	ldr	r2, [sp, #720]
	mov	r3, #4
	str	r3, [r2, #4]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #804]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #724]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r2, [sp, #800]
	add	r3, r3, #55
	str	r3, [r2, #28]
	sub	r3, r3, #56
	str	r3, [r2, #4]
	ldr	r3, [sp, #680]
	ldr	r2, [sp, #676]
	str	r3, [r2, #12]
	ldr	r2, [sp, #804]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r2, [sp, #676]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [sp, #668]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #680]
	str	r2, [r3, #12]
	ldr	r3, .L102+276
	add	r2, sl, r3
	ldr	r3, [sp, #680]
	str	r2, [r3, #0]
	ldr	r3, [sp, #612]
	ldr	r2, [sp, #808]
	str	r3, [r2, #24]
	ldr	r3, .L102+280
	add	r2, sl, r3
	ldr	r3, [sp, #808]
	str	r2, [r3, #0]
	ldr	r2, [sp, #676]
	mov	r3, #60
	str	r3, [r2, #28]
	ldr	r3, .L102+284
	add	r2, sl, r3
	ldr	r3, [sp, #812]
	str	r2, [r3, #0]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #808]
	str	r3, [r2, #16]
	ldr	r3, .L102+288
	add	r2, sl, r3
	ldr	r3, [sp, #816]
	str	r2, [r3, #0]
	ldr	r2, [sp, #0]
	str	r2, [r3, #16]
	ldr	r3, .L102+292
	add	r2, sl, r3
	ldr	r3, [sp, #820]
	str	r2, [r3, #0]
	ldr	r3, [sp, #812]
	ldr	r2, [sp, #808]
	str	r3, [r2, #12]
	ldr	r2, [sp, #680]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r2, [sp, #808]
	ldr	r3, [sp, #812]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	ldr	r3, [sp, #628]
	ldr	r2, [sp, #816]
	str	r3, [r2, #24]
	ldr	r2, [sp, #808]
	mov	r3, #4
	str	r3, [r2, #4]
	add	r3, r3, #66
	str	r3, [r2, #28]
	ldr	r2, [sp, #816]
	str	r3, [r2, #28]
	ldr	r3, [sp, #812]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #816]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #820]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r2, [sp, #816]
	str	r3, [r2, #12]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	add	sp, sp, #148
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.size	init_tracka, .-init_tracka
	.ident	"GCC: (GNU) 4.0.2"
