	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_build_lut                      ; -- Begin function build_lut
	.p2align	2
_build_lut:                             ; @build_lut
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	stur	wzr, [x29, #-24]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
                                        ;     Child Loop BB0_7 Depth 2
                                        ;     Child Loop BB0_12 Depth 2
	ldurb	w8, [x29, #-17]
	sturb	w8, [x29, #-26]
	stur	wzr, [x29, #-32]
	stur	wzr, [x29, #-36]
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	b	LBB0_2
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #44
	b.eq	LBB0_4
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_2 Depth=2
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #10
	b.ne	LBB0_5
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_2 Depth=2
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #49
	cset	w8, eq
	and	w8, w8, #0x1
	ldur	w10, [x29, #-36]
	mov	w9, #31
	subs	w9, w9, w10
	lsl	w9, w8, w9
	ldur	w8, [x29, #-32]
	orr	w8, w8, w9
	stur	w8, [x29, #-32]
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	b	LBB0_2
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-36]
	str	w8, [sp, #40]
	str	wzr, [sp, #36]
	str	wzr, [sp, #32]
	b	LBB0_7
LBB0_7:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #40]
	subs	w8, w8, #8
	b.le	LBB0_11
	b	LBB0_8
LBB0_8:                                 ;   in Loop: Header=BB0_7 Depth=2
	ldur	w8, [x29, #-32]
	ldr	w10, [sp, #32]
	mov	w9, #8
	mul	w9, w9, w10
	lsl	w8, w8, w9
	str	w8, [sp, #28]
	ldr	w8, [sp, #28]
	lsr	w8, w8, #24
	strb	w8, [sp, #27]
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #27]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrh	w9, [x8]
	strh	w9, [sp, #24]
	ldrb	w8, [x8, #2]
	strb	w8, [sp, #26]
	ldrb	w8, [sp, #24]
	cbnz	w8, LBB0_10
	b	LBB0_9
LBB0_9:                                 ;   in Loop: Header=BB0_7 Depth=2
	ldur	w8, [x29, #-24]
	add	w8, w8, #1
	stur	w8, [x29, #-24]
	mov	x0, #768
	bl	_malloc
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	ldur	x9, [x29, #-8]
	ldursw	x10, [x29, #-24]
	str	x8, [x9, x10, lsl #3]
	ldur	w8, [x29, #-24]
	strb	w8, [sp, #13]
	mov	w8, #8
	strb	w8, [sp, #15]
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #27]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	add	x9, x8, x9
	ldurh	w8, [sp, #13]
	strh	w8, [x9]
	ldrb	w8, [sp, #15]
	strb	w8, [x9, #2]
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_7 Depth=2
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #27]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	ldrsb	w8, [x8, x9]
	str	w8, [sp, #36]
	ldr	w8, [sp, #40]
	subs	w8, w8, #8
	str	w8, [sp, #40]
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB0_7
LBB0_11:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #40]
	sturb	w8, [x29, #-25]
	sturb	wzr, [x29, #-27]
	ldur	w8, [x29, #-32]
	ldr	w9, [sp, #32]
	add	w10, w9, #1
	mov	w9, #8
	mul	w10, w9, w10
	mov	w9, #32
	subs	w9, w9, w10
	lsr	w8, w8, w9
	strb	w8, [sp, #12]
	ldrb	w8, [sp, #12]
	ldr	w10, [sp, #40]
	mov	w9, #255
	asr	w9, w9, w10
	orr	w8, w8, w9
	strb	w8, [sp, #11]
	ldrb	w8, [sp, #12]
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_12:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #4]
	ldrb	w9, [sp, #11]
	subs	w8, w8, w9
	b.gt	LBB0_15
	b	LBB0_13
LBB0_13:                                ;   in Loop: Header=BB0_12 Depth=2
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #36]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #4]
	mov	x10, #3
	mul	x9, x9, x10
	add	x9, x8, x9
	ldurh	w8, [x29, #-27]
	strh	w8, [x9]
	ldurb	w8, [x29, #-25]
	strb	w8, [x9, #2]
	b	LBB0_14
LBB0_14:                                ;   in Loop: Header=BB0_12 Depth=2
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB0_12
LBB0_15:                                ;   in Loop: Header=BB0_1 Depth=1
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #10
	b.ne	LBB0_17
	b	LBB0_16
LBB0_16:
	b	LBB0_18
LBB0_17:                                ;   in Loop: Header=BB0_1 Depth=1
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	b	LBB0_1
LBB0_18:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_decode                         ; -- Begin function decode
	.p2align	2
_decode:                                ; @decode
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	wzr, [x29, #-20]
	mov	w8, #8
	str	w8, [sp, #24]
	strb	wzr, [sp, #23]
	str	wzr, [sp, #12]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-16]
	bl	_feof
	cbnz	w0, LBB1_8
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldrb	w8, [sp, #19]
	ldr	w10, [sp, #24]
	mov	w9, #8
	subs	w9, w9, w10
	asr	w9, w8, w9
	ldrb	w8, [sp, #23]
	orr	w8, w8, w9
	strb	w8, [sp, #23]
	ldr	w8, [sp, #24]
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	b.le	LBB1_4
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w9, [x29, #-20]
	ldr	w8, [sp, #24]
	subs	w8, w8, w9
	str	w8, [sp, #24]
	ldur	x0, [x29, #-16]
	bl	_fgetc
	strb	w0, [sp, #19]
	mov	w9, #8
	stur	w9, [x29, #-20]
	ldrb	w8, [sp, #19]
	ldr	w10, [sp, #24]
	subs	w9, w9, w10
	asr	w9, w8, w9
	ldrb	w8, [sp, #23]
	orr	w8, w8, w9
	strb	w8, [sp, #23]
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w9, [sp, #24]
	ldrb	w8, [sp, #19]
	lsl	w8, w8, w9
	strb	w8, [sp, #19]
	ldr	w9, [sp, #24]
	ldur	w8, [x29, #-20]
	subs	w8, w8, w9
	stur	w8, [x29, #-20]
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #12]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #23]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrh	w9, [x8]
	strh	w9, [sp, #20]
	ldrb	w8, [x8, #2]
	strb	w8, [sp, #22]
	ldrb	w8, [sp, #20]
	cbnz	w8, LBB1_6
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldrsb	w10, [sp, #21]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldr	w9, [sp, #12]
	ldr	w8, [sp, #12]
	eor	w8, w8, w9
	str	w8, [sp, #12]
	b	LBB1_7
LBB1_6:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldrsb	w8, [sp, #20]
	str	w8, [sp, #12]
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldrsb	w8, [sp, #22]
	str	w8, [sp, #24]
	ldr	w9, [sp, #24]
	ldrb	w8, [sp, #23]
	lsl	w8, w8, w9
	strb	w8, [sp, #23]
	b	LBB1_1
LBB1_8:
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	stur	wzr, [x29, #-92]
	str	w0, [sp, #96]
	str	x1, [sp, #88]
	str	wzr, [sp, #84]
	bl	_clock
	str	x0, [sp, #72]
	ldr	w8, [sp, #96]
	subs	w8, w8, #3
	b.gt	LBB2_2
	b	LBB2_1
LBB2_1:
	ldr	w8, [sp, #96]
	subs	w8, w8, #2
	b.ge	LBB2_3
	b	LBB2_2
LBB2_2:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-92]
	b	LBB2_8
LBB2_3:
	ldr	w8, [sp, #96]
	subs	w8, w8, #3
	b.ne	LBB2_5
	b	LBB2_4
LBB2_4:
	mov	w8, #1
	str	w8, [sp, #84]
	b	LBB2_5
LBB2_5:
	ldr	x8, [sp, #88]
	ldr	x8, [x8, #8]
	str	x8, [sp, #56]
	mov	x0, #768
	bl	_malloc
	str	x0, [sp, #48]
	ldr	x8, [sp, #48]
	sub	x9, x29, #88
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	stur	x8, [x29, #-88]
	ldr	x0, [sp, #56]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fopen
	mov	x8, x0
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	str	x8, [sp, #40]
	ldr	x1, [sp, #40]
	bl	_build_lut
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #40]
	bl	_decode
	bl	_clock
	ldr	x8, [sp, #72]
	subs	x8, x0, x8
	str	x8, [sp, #72]
	ldr	w8, [sp, #84]
	cbz	w8, LBB2_7
	b	LBB2_6
LBB2_6:
	ldr	x9, [sp, #72]
	ldr	d0, [sp, #72]
	fmov	x8, d0
	ucvtf	s0, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	fcvt	d0, s0
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	mov	x8, sp
	str	x9, [x8]
	str	d0, [x8, #8]
	bl	_printf
	b	LBB2_7
LBB2_7:
	stur	wzr, [x29, #-92]
	b	LBB2_8
LBB2_8:
	ldur	w8, [x29, #-92]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x9, [x29, #-8]
	subs	x8, x8, x9
	b.ne	LBB2_10
	b	LBB2_9
LBB2_9:
	ldr	w0, [sp, #28]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
LBB2_10:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%c"

l_.str.1:                               ; @.str.1
	.asciz	"\n"

l_.str.2:                               ; @.str.2
	.asciz	"Invalid input\n"

l_.str.3:                               ; @.str.3
	.asciz	"rb"

l_.str.4:                               ; @.str.4
	.asciz	"No. of clicks %ld clicks (%f seconds).\n"

.subsections_via_symbols
