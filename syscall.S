	.align	2
	.global	Dispatch_First
	.type	Dispatch_First, %function
Dispatch_First:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mrs r1, spsr
	bic r1, r1, #15
	bic r1, r1, #0x80
	msr cpsr, r1
	mov sp, r0
	ldmfd sp!, {r0-r12, lr, pc}
	.size	Dispatch_First, .-Dispatch_First
	.align	2
	.global	Dispatch
	.type	Dispatch, %function
Dispatch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov sp, r1
	mrs r1, spsr
	msr cpsr, r1
	mov sp, r0
	ldmfd sp!, {r0-r12, lr, pc}
	.size	Dispatch, .-Dispatch
	.align	2
	.global	SWI_Handler
	.type	SWI_Handler, %function
SWI_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	sub sp, sp, #4
	stmfd sp!, {r0-r3}
	mrs r0, cpsr
	orr r0, r0, #15
	msr cpsr, r0
	ldr r3, [sp, #0]
	stmfd sp!, {lr}
	sub sp, sp, #4
	stmfd sp!,{r4-r12}
	sub sp, sp, #16
	mov r2, sp
	
	mrs r0, cpsr
	bic r0, r0, #15
	orr r0, r0, #3
	msr cpsr, r0
	
	str r3, [sp, #16]
	LDR r1,[lr,#-4] 
	BIC r1,r1,#0xFF000000
	stmfd sp!, {r1-r2}
	mov r0, sp
	add r1, sp, #28
	b kernel(PLT)
	.size	SWI_Handler, .-SWI_Handler
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 1
	.size	Create, .-Create
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 2
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 3
	.size	Exit, .-Exit
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 4
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 5
	.size	MyTid, .-MyTid
	.align	2
	.global	Send
	.type	Send, %function
Send:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 6
	.size	Send, .-Send
	.align	2
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 7
	.size	Receive, .-Receive
	.align	2
	.global	Reply
	.type	Reply, %function
Reply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 8
	.size	Reply, .-Reply
	.align	2
	.global	AwaitEvent
	.type	AwaitEvent, %function
AwaitEvent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	swi 9
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	IRQ_Handler
	.type	IRQ_Handler, %function
IRQ_Handler:
	STMFD    sp!,{r0-r2}
	sub lr, lr, #4
	mov r1, lr
	mov r2, sp
	
	mrs r0, cpsr
	orr r0, r0, #15
	msr cpsr, r0
	
	stmfd sp!, {r1}
	stmfd sp!, {r3-r12, lr}
	ldmfd r2!, {r3-r5}
	stmfd sp!, {r3-r5}
	mov r0, sp
	
	mrs r1, cpsr
	bic r1, r1, #15
	orr r1, r1, #2
	msr cpsr, r1
	add sp, sp, #12
	mov r1, sp
	
	b C_IRQ_Handler(PLT)
	.size	IRQ_Handler, .-IRQ_Handler

