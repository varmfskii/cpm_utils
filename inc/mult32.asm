;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Multiply 16-bit values (with 32-bit result)
;;; In: Multiply BC with DE
;;; Out: BCHL = result
;;;
mult32:
	ld a,c
	ld c,b
	ld hl,0
	ld b,16
@loop:
	add hl,hl
	rla
	rl c
	jr nc,@noadd
	add hl,de
	adc a,0
	jp nc,@noadd
	inc c
@noadd:
	djnz @loop
	ld b,c
	ld c,a
	ret
