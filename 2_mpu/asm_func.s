.syntax unified

.global	read_sp
read_sp:
	mov	r0,	sp
	bx lr	

.global	read_msp
read_msp:
	mrs	r0,	msp
	bx lr

.global	read_psp
read_psp:
	mrs	r0,	psp
	bx lr

.global	read_ctrl
read_ctrl:
	mrs	r0,	ctrl
	bx lr

.global	start_user
start_user:
	moves 	lr,	r0
	msr	psp,	r1

	moves	r3,	#0b11
	msr control,	r3
	isb
	bx lr

.global	sw_priv
sw_priv:
	mov	r3,	#0
	msr	control,	r3
	isb
	bx lr
