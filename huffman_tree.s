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
	.file	"huffman_tree.c"
	.text
	.global	size
	.bss
	.align	2
	.type	size, %object
	.size	size, 4
size:
	.space	4
	.global	current_count
	.align	2
	.type	current_count, %object
	.size	current_count, 4
current_count:
	.space	4
	.global	file_length
	.align	2
	.type	file_length, %object
	.size	file_length, 4
file_length:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c%d\000"
	.text
	.align	2
	.global	print_frequency
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print_frequency, %function
print_frequency:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	sub	r3, fp, #12
	stm	r3, {r0, r1}
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-8]
	mov	r2, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	print_frequency, .-print_frequency
	.align	2
	.global	new_node
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	new_node, %function
new_node:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	str	r1, [fp, #-20]
	strb	r3, [fp, #-13]
	mov	r0, #16
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldrb	r2, [fp, #-13]
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	new_node, .-new_node
	.align	2
	.global	create_min_heap
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	create_min_heap, %function
create_min_heap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r0, #12
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	create_min_heap, .-create_min_heap
	.align	2
	.global	swap_nodes
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	swap_nodes, %function
swap_nodes:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swap_nodes, .-swap_nodes
	.align	2
	.global	min_heapify
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	min_heapify, %function
min_heapify:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	lsl	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L8
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bcs	.L8
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bls	.L9
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bcs	.L9
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L9:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L11
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r0, r2, r3
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r1, r3
	bl	swap_nodes
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	min_heapify
.L11:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	min_heapify, .-min_heapify
	.align	2
	.global	is_of_size_one
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	is_of_size_one, %function
is_of_size_one:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	is_of_size_one, .-is_of_size_one
	.align	2
	.global	extract_minimum
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	extract_minimum, %function
extract_minimum:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	mov	r1, #0
	ldr	r0, [fp, #-16]
	bl	min_heapify
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	extract_minimum, .-extract_minimum
	.align	2
	.global	insert_into_min_heap
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	insert_into_min_heap, %function
insert_into_min_heap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L17
.L19:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	lsr	r1, r3, #31
	add	r3, r1, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	lsr	r0, r3, #31
	add	r3, r0, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bcc	.L19
.L18:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	insert_into_min_heap, .-insert_into_min_heap
	.align	2
	.global	build_min_heap
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	build_min_heap, %function
build_min_heap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L21
.L22:
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	min_heapify
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L21:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L22
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	build_min_heap, .-build_min_heap
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%d\000"
	.text
	.align	2
	.global	print_array
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print_array, %function
print_array:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L25:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r1, r3
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L25
	movw	r3, #:lower16:current_count
	movt	r3, #:upper16:current_count
	ldr	r2, [r3]
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L27
	mov	r0, #44
	bl	putchar
.L27:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	print_array, .-print_array
	.align	2
	.global	is_leaf
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	is_leaf, %function
is_leaf:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L29
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L29
	mov	r3, #1
	b	.L31
.L29:
	mov	r3, #0
.L31:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	is_leaf, .-is_leaf
	.align	2
	.global	create_and_build_min_heap
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	create_and_build_min_heap, %function
create_and_build_min_heap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	create_min_heap
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L33
.L34:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r4, r2, r3
	bl	new_node
	mov	r3, r0
	str	r3, [r4]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L33:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L34
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r0, [fp, #-20]
	bl	build_min_heap
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	create_and_build_min_heap, .-create_and_build_min_heap
	.align	2
	.global	build_huffman_tree
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	build_huffman_tree, %function
build_huffman_tree:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	create_and_build_min_heap
	str	r0, [fp, #-8]
	b	.L37
.L38:
	ldr	r0, [fp, #-8]
	bl	extract_minimum
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	extract_minimum
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	add	r3, r2, r3
	mov	r1, r3
	mov	r0, #36
	bl	new_node
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-8]
	bl	insert_into_min_heap
.L37:
	ldr	r0, [fp, #-8]
	bl	is_of_size_one
	mov	r3, r0
	cmp	r3, #0
	beq	.L38
	ldr	r0, [fp, #-8]
	bl	extract_minimum
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	build_huffman_tree, .-build_huffman_tree
	.align	2
	.global	write_codes
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	write_codes, %function
write_codes:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L41
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r0, [r3, #8]
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-20]
	bl	write_codes
.L41:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-20]
	bl	write_codes
.L42:
	ldr	r0, [fp, #-16]
	bl	is_leaf
	mov	r3, r0
	cmp	r3, #0
	beq	.L48
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L44
.L47:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L45
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	mov	r2, #49
	strb	r2, [r3]
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	str	r2, [r3]
	b	.L46
.L45:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	mov	r2, #48
	strb	r2, [r3]
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	str	r2, [r3]
.L46:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L44:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L47
	movw	r3, #:lower16:current_count
	movt	r3, #:upper16:current_count
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:current_count
	movt	r3, #:upper16:current_count
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	print_array
.L48:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	write_codes, .-write_codes
	.align	2
	.global	encode
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	encode, %function
encode:
	@ args = 0, pretend = 0, frame = 536
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #536
	str	r0, [fp, #-528]
	str	r1, [fp, #-532]
	str	r2, [fp, #-536]
	ldr	r1, [fp, #-532]
	ldr	r0, [fp, #-528]
	bl	build_huffman_tree
	str	r0, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	sub	r1, fp, #524
	ldr	r3, [fp, #-536]
	mov	r2, #0
	ldr	r0, [fp, #-8]
	bl	write_codes
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	encode, .-encode
	.align	2
	.global	find_symbol_index
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	find_symbol_index, %function
find_symbol_index:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-17]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L52
.L55:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L53
	ldr	r3, [fp, #-8]
	b	.L54
.L53:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L52:
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L55
	mvn	r3, #0
.L54:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	find_symbol_index, .-find_symbol_index
	.section	.rodata
	.align	2
.LC2:
	.ascii	"rb\000"
	.text
	.align	2
	.global	get_frequencies
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	get_frequencies, %function
get_frequencies:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	ldr	r0, [fp, #-40]
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	strb	r3, [fp, #-5]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L57
.L60:
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:file_length
	movt	r3, #:upper16:file_length
	str	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	find_symbol_index
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	bne	.L58
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r3, [r3]
	add	r2, r3, #1
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	str	r2, [r3]
	b	.L59
.L58:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-44]
	add	r2, r2, r3
	sub	r3, fp, #32
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-20]
	lsl	r2, r2, #3
	ldr	r1, [fp, #-44]
	add	r2, r1, r2
	str	r3, [r2, #4]
.L59:
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	strb	r3, [fp, #-5]
.L57:
	ldr	r0, [fp, #-16]
	bl	feof
	mov	r3, r0
	cmp	r3, #0
	beq	.L60
	ldr	r0, [fp, #-16]
	bl	fclose
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	mov	r2, #26
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #4]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	get_frequencies, .-get_frequencies
	.align	2
	.global	print_bin
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print_bin, %function
print_bin:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	mov	r3, #7
	str	r3, [fp, #-8]
	b	.L62
.L63:
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r1, #1
	ldr	r3, [fp, #-8]
	lsl	r3, r1, r3
	and	r2, r2, r3
	ldr	r3, [fp, #-8]
	asr	r3, r2, r3
	mov	r1, r3
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L62:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L63
	movw	r3, #:lower16:stdout
	movt	r3, #:upper16:stdout
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, #10
	bl	putc
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	print_bin, .-print_bin
	.align	2
	.global	decode
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	decode, %function
decode:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-12]
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	ldr	r0, [fp, #-32]
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	fgetc
	mov	r3, r0
	strb	r3, [fp, #-13]
	b	.L65
.L71:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L66
.L70:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #49
	bne	.L67
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-12]
	b	.L68
.L67:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
.L68:
	ldr	r0, [fp, #-12]
	bl	is_leaf
	mov	r3, r0
	cmp	r3, #0
	beq	.L69
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-12]
.L69:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L66:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L70
	ldr	r0, [fp, #-20]
	bl	fgetc
	mov	r3, r0
	strb	r3, [fp, #-13]
.L65:
	ldr	r0, [fp, #-20]
	bl	feof
	mov	r3, r0
	cmp	r3, #0
	beq	.L71
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	decode, .-decode
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Invalid input\000"
	.align	2
.LC4:
	.ascii	"\012No. of clicks %ld clicks (%f seconds) to ENCODE"
	.ascii	".\012\000"
	.align	2
.LC5:
	.ascii	"\012No. of clicks %ld clicks (%f seconds) to DECODE"
	.ascii	".\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1568
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1568
	str	r0, [fp, #-1568]
	str	r1, [fp, #-1572]
	mov	r3, #0
	str	r3, [fp, #-8]
	bl	clock
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-1568]
	cmp	r3, #3
	bgt	.L73
	ldr	r3, [fp, #-1568]
	cmp	r3, #1
	bgt	.L74
.L73:
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	mov	r3, #0
	b	.L82
.L74:
	ldr	r3, [fp, #-1568]
	cmp	r3, #3
	bne	.L76
	mov	r3, #1
	str	r3, [fp, #-8]
.L76:
	ldr	r3, [fp, #-1572]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	sub	r3, fp, #1040
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	get_frequencies
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L77
.L79:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #1040
	sub	r3, r3, #4
	ldm	r3, {r0, r1}
	bl	print_frequency
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L78
	mov	r0, #44
	bl	putchar
.L78:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L77:
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L79
	mov	r0, #10
	bl	putchar
	sub	r3, fp, #1552
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r2, #512
	mov	r1, #0
	mov	r0, r3
	bl	memset
	movw	r3, #:lower16:size
	movt	r3, #:upper16:size
	ldr	r1, [r3]
	sub	r2, fp, #1552
	sub	r2, r2, #4
	sub	r2, r2, #4
	sub	r3, fp, #1040
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r0, r3
	bl	encode
	str	r0, [fp, #-24]
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L80
	ldr	r3, [fp, #-16]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L83
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r1, [fp, #-16]
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	printf
.L80:
	mov	r0, #10
	bl	putchar
	bl	clock
	str	r0, [fp, #-16]
	sub	r3, fp, #1552
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r2, r3
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	decode
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L81
	ldr	r3, [fp, #-16]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L83
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r1, [fp, #-16]
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
.L81:
	mov	r0, #10
	bl	putchar
	mov	r3, #0
.L82:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L84:
	.align	2
.L83:
	.word	1232348160
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
