	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_print_symbol                   ; -- Begin function print_symbol
	.p2align	2
_print_symbol:                          ; @print_symbol
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldrh	w8, [sp, #16]
	sturh	w8, [x29, #-4]
	ldrb	w8, [sp, #18]
	sturb	w8, [x29, #-2]
	ldursb	w10, [x29, #-3]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldursb	w10, [x29, #-2]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldursb	w10, [x29, #-4]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_tables                   ; -- Begin function print_tables
	.p2align	2
_print_tables:                          ; @print_tables
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	ldur	w8, [x29, #-12]
	adrp	x9, _lut_count@PAGE
	ldr	w9, [x9, _lut_count@PAGEOFF]
	subs	w8, w8, w9
	b.gt	LBB1_10
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w9, [x29, #-12]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	stur	wzr, [x29, #-16]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-16]
	subs	w8, w8, #256
	b.ge	LBB1_8
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-12]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-16]
	mov	x10, #3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrh	w9, [x8]
	sturh	w9, [x29, #-20]
	ldrb	w8, [x8, #2]
	sturb	w8, [x29, #-18]
	ldursb	w8, [x29, #-18]
	cbz	w8, LBB1_6
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldurh	w8, [x29, #-20]
	strh	w8, [sp, #16]
	ldurb	w8, [x29, #-18]
	strb	w8, [sp, #18]
	ldr	x0, [sp, #16]
	bl	_print_symbol
	b	LBB1_6
LBB1_6:                                 ;   in Loop: Header=BB1_3 Depth=2
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldur	w8, [x29, #-16]
	add	w8, w8, #1
	stur	w8, [x29, #-16]
	b	LBB1_3
LBB1_8:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_9
LBB1_9:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB1_1
LBB1_10:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_table                    ; -- Begin function print_table
	.p2align	2
_print_table:                           ; @print_table
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	x1, [x29, #-16]
	ldur	w9, [x29, #-4]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	stur	wzr, [x29, #-20]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-20]
	subs	w8, w8, #256
	b.ge	LBB2_4
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-4]
	ldr	x8, [x8, x9, lsl #3]
	ldursw	x9, [x29, #-20]
	mov	x10, #3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrh	w9, [x8]
	strh	w9, [sp, #24]
	ldrb	w8, [x8, #2]
	strb	w8, [sp, #26]
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	ldrh	w8, [sp, #24]
	strh	w8, [sp, #16]
	ldrb	w8, [sp, #26]
	strb	w8, [sp, #18]
	ldr	x0, [sp, #16]
	bl	_print_symbol
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	w8, [x29, #-20]
	add	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB2_1
LBB2_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_bin                      ; -- Begin function print_bin
	.p2align	2
_print_bin:                             ; @print_bin
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sturb	w0, [x29, #-1]
	mov	w8, #7
	str	w8, [sp, #8]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #8]
	tbnz	w8, #31, LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldurb	w8, [x29, #-1]
	ldr	w10, [sp, #8]
	mov	w9, #1
	lsl	w9, w9, w10
	and	w8, w8, w9
	ldr	w9, [sp, #8]
	asr	w10, w8, w9
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB3_1
LBB3_4:
	adrp	x8, ___stdoutp@GOTPAGE
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
	ldr	x1, [x8]
	mov	w0, #10
	bl	_putc
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_32_bin                   ; -- Begin function print_32_bin
	.p2align	2
_print_32_bin:                          ; @print_32_bin
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	mov	w8, #31
	str	w8, [sp, #8]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #8]
	tbnz	w8, #31, LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldur	w8, [x29, #-4]
	ldr	w10, [sp, #8]
	mov	w9, #1
	lsl	w9, w9, w10
	and	w8, w8, w9
	ldr	w9, [sp, #8]
	lsr	w10, w8, w9
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB4_1
LBB4_4:
	adrp	x8, ___stdoutp@GOTPAGE
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
	ldr	x1, [x8]
	mov	w0, #10
	bl	_putc
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
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
	b	LBB5_1
LBB5_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_2 Depth 2
                                        ;     Child Loop BB5_7 Depth 2
                                        ;     Child Loop BB5_12 Depth 2
	ldurb	w8, [x29, #-17]
	sturb	w8, [x29, #-19]
	stur	wzr, [x29, #-24]
	stur	wzr, [x29, #-28]
	b	LBB5_2
LBB5_2:                                 ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #44
	b.eq	LBB5_4
	b	LBB5_3
LBB5_3:                                 ;   in Loop: Header=BB5_2 Depth=2
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #10
	b.ne	LBB5_5
	b	LBB5_4
LBB5_4:                                 ;   in Loop: Header=BB5_1 Depth=1
	b	LBB5_6
LBB5_5:                                 ;   in Loop: Header=BB5_2 Depth=2
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #49
	cset	w8, eq
	and	w8, w8, #0x1
	ldur	w10, [x29, #-28]
	mov	w9, #31
	subs	w9, w9, w10
	lsl	w9, w8, w9
	ldur	w8, [x29, #-24]
	orr	w8, w8, w9
	stur	w8, [x29, #-24]
	ldur	w8, [x29, #-28]
	add	w8, w8, #1
	stur	w8, [x29, #-28]
	b	LBB5_2
LBB5_6:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldur	w8, [x29, #-28]
	stur	w8, [x29, #-32]
	stur	wzr, [x29, #-36]
	str	wzr, [sp, #40]
	b	LBB5_7
LBB5_7:                                 ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-32]
	subs	w8, w8, #8
	b.le	LBB5_11
	b	LBB5_8
LBB5_8:                                 ;   in Loop: Header=BB5_7 Depth=2
	ldur	w8, [x29, #-24]
	ldr	w10, [sp, #40]
	mov	w9, #8
	mul	w9, w9, w10
	lsl	w8, w8, w9
	str	w8, [sp, #36]
	ldr	w8, [sp, #36]
	lsr	w8, w8, #24
	strb	w8, [sp, #35]
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #35]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrh	w9, [x8]
	strh	w9, [sp, #32]
	ldrb	w8, [x8, #2]
	strb	w8, [sp, #34]
	ldrsb	w8, [sp, #32]
	cbnz	w8, LBB5_10
	b	LBB5_9
LBB5_9:                                 ;   in Loop: Header=BB5_7 Depth=2
	adrp	x9, _lut_count@PAGE
	str	x9, [sp]                        ; 8-byte Folded Spill
	ldr	w8, [x9, _lut_count@PAGEOFF]
	add	w8, w8, #1
	str	w8, [x9, _lut_count@PAGEOFF]
	mov	x0, #768
	bl	_malloc
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	str	x0, [sp, #24]
	ldr	x9, [sp, #24]
	ldur	x10, [x29, #-8]
	ldrsw	x11, [x8, _lut_count@PAGEOFF]
	str	x9, [x10, x11, lsl #3]
	ldr	w8, [x8, _lut_count@PAGEOFF]
	strb	w8, [sp, #21]
	mov	w8, #8
	strb	w8, [sp, #23]
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #35]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	add	x9, x8, x9
	ldurh	w8, [sp, #21]
	strh	w8, [x9]
	ldrb	w8, [sp, #23]
	strb	w8, [x9, #2]
	b	LBB5_10
LBB5_10:                                ;   in Loop: Header=BB5_7 Depth=2
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-36]
	ldr	x8, [x8, x9, lsl #3]
	ldrb	w9, [sp, #35]
                                        ; kill: def $x9 killed $w9
	mov	x10, #3
	mul	x9, x9, x10
	ldrsb	w8, [x8, x9]
	stur	w8, [x29, #-36]
	ldur	w8, [x29, #-32]
	subs	w8, w8, #8
	stur	w8, [x29, #-32]
	ldr	w8, [sp, #40]
	add	w8, w8, #1
	str	w8, [sp, #40]
	b	LBB5_7
LBB5_11:                                ;   in Loop: Header=BB5_1 Depth=1
	ldur	w8, [x29, #-32]
	sturb	w8, [x29, #-18]
	sturb	wzr, [x29, #-20]
	ldur	w8, [x29, #-24]
	ldr	w9, [sp, #40]
	add	w10, w9, #1
	mov	w9, #8
	mul	w10, w9, w10
	mov	w9, #32
	subs	w9, w9, w10
	lsr	w8, w8, w9
	strb	w8, [sp, #20]
	ldrb	w8, [sp, #20]
	ldur	w10, [x29, #-32]
	mov	w9, #255
	asr	w9, w9, w10
	orr	w8, w8, w9
	strb	w8, [sp, #19]
	ldrb	w8, [sp, #20]
	str	w8, [sp, #12]
	b	LBB5_12
LBB5_12:                                ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #12]
	ldrb	w9, [sp, #19]
	subs	w8, w8, w9
	b.gt	LBB5_15
	b	LBB5_13
LBB5_13:                                ;   in Loop: Header=BB5_12 Depth=2
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-36]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #12]
	mov	x10, #3
	mul	x9, x9, x10
	add	x9, x8, x9
	ldurh	w8, [x29, #-20]
	strh	w8, [x9]
	ldurb	w8, [x29, #-18]
	strb	w8, [x9, #2]
	b	LBB5_14
LBB5_14:                                ;   in Loop: Header=BB5_12 Depth=2
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB5_12
LBB5_15:                                ;   in Loop: Header=BB5_1 Depth=1
	ldursb	w8, [x29, #-17]
	subs	w8, w8, #10
	b.ne	LBB5_17
	b	LBB5_16
LBB5_16:
	b	LBB5_18
LBB5_17:                                ;   in Loop: Header=BB5_1 Depth=1
	ldur	x0, [x29, #-16]
	bl	_fgetc
	sturb	w0, [x29, #-17]
	b	LBB5_1
LBB5_18:
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
	b	LBB6_1
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-16]
	bl	_feof
	cbnz	w0, LBB6_8
	b	LBB6_2
LBB6_2:                                 ;   in Loop: Header=BB6_1 Depth=1
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
	b.le	LBB6_4
	b	LBB6_3
LBB6_3:                                 ;   in Loop: Header=BB6_1 Depth=1
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
	b	LBB6_4
LBB6_4:                                 ;   in Loop: Header=BB6_1 Depth=1
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
	ldrsb	w8, [sp, #20]
	cbnz	w8, LBB6_6
	b	LBB6_5
LBB6_5:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldrsb	w10, [sp, #21]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	str	wzr, [sp, #12]
	b	LBB6_7
LBB6_6:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldrsb	w8, [sp, #20]
	str	w8, [sp, #12]
	b	LBB6_7
LBB6_7:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldrsb	w8, [sp, #22]
	str	w8, [sp, #24]
	ldr	w9, [sp, #24]
	ldrb	w8, [sp, #23]
	lsl	w8, w8, w9
	strb	w8, [sp, #23]
	b	LBB6_1
LBB6_8:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
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
	b.gt	LBB7_2
	b	LBB7_1
LBB7_1:
	ldr	w8, [sp, #96]
	subs	w8, w8, #2
	b.ge	LBB7_3
	b	LBB7_2
LBB7_2:
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-92]
	b	LBB7_8
LBB7_3:
	ldr	w8, [sp, #96]
	subs	w8, w8, #3
	b.ne	LBB7_5
	b	LBB7_4
LBB7_4:
	mov	w8, #1
	str	w8, [sp, #84]
	b	LBB7_5
LBB7_5:
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
	adrp	x1, l_.str.9@PAGE
	add	x1, x1, l_.str.9@PAGEOFF
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
	cbz	w8, LBB7_7
	b	LBB7_6
LBB7_6:
	ldr	x9, [sp, #72]
	ldr	d0, [sp, #72]
	fmov	x8, d0
	ucvtf	s0, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s0, s0, s1
	fcvt	d0, s0
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	mov	x8, sp
	str	x9, [x8]
	str	d0, [x8, #8]
	bl	_printf
	b	LBB7_7
LBB7_7:
	stur	wzr, [x29, #-92]
	b	LBB7_8
LBB7_8:
	ldur	w8, [x29, #-92]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x9, [x29, #-8]
	subs	x8, x8, x9
	b.ne	LBB7_10
	b	LBB7_9
LBB7_9:
	ldr	w0, [sp, #28]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
LBB7_10:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
	.globl	_lut_count                      ; @lut_count
.zerofill __DATA,__common,_lut_count,4,2
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Symbol: %c"

l_.str.1:                               ; @.str.1
	.asciz	" | Code Length: %d"

l_.str.2:                               ; @.str.2
	.asciz	" | Table: %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"Table %d\n"

l_.str.4:                               ; @.str.4
	.asciz	"%d "

l_.str.5:                               ; @.str.5
	.asciz	"%d"

l_.str.6:                               ; @.str.6
	.asciz	"%c"

l_.str.7:                               ; @.str.7
	.asciz	"\n"

l_.str.8:                               ; @.str.8
	.asciz	"Invalid input\n"

l_.str.9:                               ; @.str.9
	.asciz	"rb"

l_.str.10:                              ; @.str.10
	.asciz	"No. of clicks %ld clicks (%f seconds).\n"

.subsections_via_symbols
