	.file	"util.c"
	.text
	.align	2
	.global	stringtoint
	.type	stringtoint, %function
stringtoint:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r2, [r0, #0]	@ zero_extendqisi2
	@ lr needed for prologue
	cmp	r2, #0
	beq	.L3
	sub	r3, r2, #48
	cmp	r3, #9
	movls	r1, r0
	movls	r0, #0
	bhi	.L3
.L5:
	add	r3, r0, r0, asl #2
	add	r3, r2, r3, asl #1
	ldrb	r2, [r1, #1]	@ zero_extendqisi2
	sub	r0, r3, #48
	cmp	r2, #0
	add	r1, r1, #1
	sub	ip, r2, #48
	beq	.L10
	cmp	ip, #9
	bls	.L5
.L3:
	mov	r0, #0
	bx	lr
.L10:
	bx	lr
	.size	stringtoint, .-stringtoint
	.align	2
	.global	strcmp
	.type	strcmp, %function
strcmp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r2, [r0, #0]	@ zero_extendqisi2
	ldrb	r3, [r1, #0]	@ zero_extendqisi2
	@ lr needed for prologue
	cmp	r3, r2
	beq	.L15
.L13:
	mov	r0, #0
	bx	lr
.L15:
	cmp	r2, #0
	beq	.L16
.L23:
	ldrb	r2, [r1, #1]	@ zero_extendqisi2
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	add	r1, r1, #1
	cmp	r2, r3
	add	r0, r0, #1
	bne	.L13
	cmp	r2, #0
	bne	.L23
.L16:
	mov	r0, #1
	bx	lr
	.size	strcmp, .-strcmp
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"converted loc:%s to %d\012\000"
	.align	2
.LC1:
	.ascii	"converted loc failed\000"
	.text
	.align	2
	.global	locationtoint
	.type	locationtoint, %function
locationtoint:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L35
	ldr	r3, .L35+4
.L33:
	add	sl, pc, sl
	ldr	r5, [sl, r3]
	mov	r8, r0
	mov	r4, #0
	mov	r6, r5
	b	.L25
.L26:
	cmp	r4, #144
	add	r6, r6, #48
	beq	.L34
.L25:
	ldr	r0, [r5, #0]
	mov	r1, r8
	bl	strcmp(PLT)
	subs	r7, r0, #0
	add	r4, r4, #1
	add	r5, r5, #48
	beq	.L26
	ldr	r1, .L35+8
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r8
	ldr	r3, [r6, #8]
	bl	kprintf(PLT)
	ldr	r0, [r6, #8]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L34:
	ldr	r1, .L35+12
	mov	r0, #1
	add	r1, sl, r1
	bl	kprintf(PLT)
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	trackData(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	locationtoint, .-locationtoint
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"converted %d to loc%s\012\000"
	.align	2
.LC3:
	.ascii	"converted inttoloc failed\012\000"
	.text
	.align	2
	.global	intolocation
	.type	intolocation, %function
intolocation:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L48
	ldr	lr, .L48+4
.L46:
	add	sl, pc, sl
	ldr	r1, [sl, lr]
	mov	ip, #0
	mov	r2, r0
	mov	r5, r1
	mov	r4, ip
	b	.L38
.L39:
	cmp	ip, #144
	add	r4, r4, #3
	beq	.L47
.L38:
	ldr	r3, [r1, #8]
	add	ip, ip, #1
	cmp	r2, r3
	add	r1, r1, #48
	bne	.L39
	ldr	r1, .L48+8
	mov	r0, #1
	add	r1, sl, r1
	ldr	r3, [r5, r4, asl #4]
	bl	kprintf(PLT)
	ldr	r0, [r5, r4, asl #4]
	ldmfd	sp!, {r4, r5, sl, pc}
.L47:
	ldr	r4, [sl, lr]
	ldr	r1, .L48+12
	add	r0, r4, #6912
	ldr	r3, [r0, #0]
	add	r1, sl, r1
	mov	r0, #1
	bl	kprintf(PLT)
	ldr	r0, [r4, #0]
	ldmfd	sp!, {r4, r5, sl, pc}
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
	.word	trackData(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	intolocation, .-intolocation
	.align	2
	.global	min
	.type	min, %function
min:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r0
	movlt	r0, r1
	@ lr needed for prologue
	bx	lr
	.size	min, .-min
	.ident	"GCC: (GNU) 4.0.2"
