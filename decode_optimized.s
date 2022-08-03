	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"decode_optimized.c"
	.text
	.align	2
	.global	build_lut
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	build_lut, %function
build_lut:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #56
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	ldr	r0, [fp, #-76]
	bl	fgetc
	mov	r3, r0
	uxtb	r4, r3
	mov	r7, #0
.L10:
	mov	r3, r4
	strb	r3, [fp, #-55]
	mov	r5, #0
	mov	r6, #0
	ldr	r0, [fp, #-76]
	bl	fgetc
	mov	r3, r0
	uxtb	r4, r3
.L3:
	cmp	r4, #44
	beq	.L2
	cmp	r4, #10
	beq	.L2
	cmp	r4, #49
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	rsb	r3, r6, #31
	lsl	r3, r2, r3
	orr	r5, r5, r3
	add	r6, r6, #1
	ldr	r0, [fp, #-76]
	bl	fgetc
	mov	r3, r0
	uxtb	r4, r3
	b	.L3
.L2:
	str	r6, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L4
.L6:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	lsl	r3, r5, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	strb	r3, [fp, #-41]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	add	r2, r1, r3
	sub	r3, fp, #60
	ldrh	r1, [r2]	@ unaligned
	ldrb	r2, [r2, #2]
	strh	r1, [r3]	@ unaligned
	strb	r2, [r3, #2]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	add	r7, r7, #1
	mov	r0, #768
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-48]
	mov	r3, r7
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [fp, #-48]
	str	r2, [r3]
	uxtb	r3, r7
	strb	r3, [fp, #-64]
	mov	r3, #8
	strb	r3, [fp, #-62]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	add	r3, r1, r3
	mov	r2, r3
	sub	r3, fp, #64
	ldrh	r1, [r3]	@ unaligned
	ldrb	r3, [r3, #2]
	strh	r1, [r2]	@ unaligned
	strb	r3, [r2, #2]
.L5:
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L4:
	ldr	r3, [fp, #-24]
	cmp	r3, #8
	bgt	.L6
	ldr	r3, [fp, #-24]
	uxtb	r3, r3
	strb	r3, [fp, #-54]
	mov	r3, #0
	strb	r3, [fp, #-56]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, #3
	lsl	r3, r3, #3
	lsr	r3, r5, r3
	strb	r3, [fp, #-49]
	mov	r2, #255
	ldr	r3, [fp, #-24]
	asr	r3, r2, r3
	sxtb	r2, r3
	ldrsb	r3, [fp, #-49]
	orr	r3, r2, r3
	sxtb	r3, r3
	strb	r3, [fp, #-50]
	ldrb	r3, [fp, #-49]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	b	.L7
.L8:
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r2, [fp, #-36]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	add	r3, r1, r3
	mov	r2, r3
	sub	r3, fp, #56
	ldrh	r1, [r3]	@ unaligned
	ldrb	r3, [r3, #2]
	strh	r1, [r2]	@ unaligned
	strb	r3, [r2, #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L7:
	ldrb	r3, [fp, #-50]	@ zero_extendqisi2
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	ble	.L8
	cmp	r4, #10
	beq	.L12
	ldr	r0, [fp, #-76]
	bl	fgetc
	mov	r3, r0
	uxtb	r4, r3
	b	.L10
.L12:
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, pc}
	.size	build_lut, .-build_lut
	.align	2
	.global	decode
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	decode, %function
decode:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #20
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r7, #0
	mov	r6, #0
	mov	r4, #8
	mov	r5, #0
	mov	r8, #0
	b	.L14
.L18:
	mov	r2, r7
	rsb	r3, r4, #8
	asr	r3, r2, r3
	sxtb	r2, r3
	sxtb	r3, r5
	orr	r3, r2, r3
	sxtb	r3, r3
	uxtb	r5, r3
	cmp	r4, r6
	ble	.L15
	sub	r4, r4, r6
	ldr	r0, [fp, #-44]
	bl	fgetc
	mov	r3, r0
	uxtb	r7, r3
	mov	r6, #8
	mov	r2, r7
	rsb	r3, r4, #8
	asr	r3, r2, r3
	sxtb	r2, r3
	sxtb	r3, r5
	orr	r3, r2, r3
	sxtb	r3, r3
	uxtb	r5, r3
.L15:
	mov	r3, r7
	lsl	r3, r3, r4
	uxtb	r7, r3
	sub	r6, r6, r4
	mov	r3, r8
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [r3]
	mov	r1, r5
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	add	r2, r2, r3
	sub	r3, fp, #32
	ldrh	r1, [r2]	@ unaligned
	ldrb	r2, [r2, #2]
	strh	r1, [r3]	@ unaligned
	strb	r2, [r3, #2]
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L16
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	mov	r8, #0
	b	.L17
.L16:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	mov	r8, r3
.L17:
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	mov	r4, r3
	mov	r3, r5
	lsl	r3, r3, r4
	uxtb	r5, r3
.L14:
	ldr	r0, [fp, #-44]
	bl	feof
	mov	r3, r0
	cmp	r3, #0
	beq	.L18
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, pc}
	.size	decode, .-decode
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Invalid input\000"
	.align	2
.LC1:
	.ascii	"rb\000"
	.align	2
.LC2:
	.ascii	"No. of clicks %ld clicks (%f seconds).\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-8]
	bl	clock
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-72]
	cmp	r3, #3
	bgt	.L20
	ldr	r3, [fp, #-72]
	cmp	r3, #1
	bgt	.L21
.L20:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r3, #0
	b	.L25
.L21:
	ldr	r3, [fp, #-72]
	cmp	r3, #3
	bne	.L23
	mov	r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-76]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	mov	r0, #768
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-64]
	movw	r1, #:lower16:.LC1
	movt	r1, #:upper16:.LC1
	ldr	r0, [fp, #-16]
	bl	fopen
	str	r0, [fp, #-24]
	sub	r3, fp, #64
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	build_lut
	sub	r3, fp, #64
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	decode
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L24
	ldr	r3, [fp, #-12]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L26
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r1, [fp, #-12]
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
.L24:
	mov	r3, #0
.L25:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L27:
	.align	2
.L26:
	.word	1232348160
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
