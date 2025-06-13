;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Divide 8-bit values
;;; In: Divide E by divider C
;;; Out: A = result, B = rest
;;;
div8:
	xor a
	ld b,8
@loop:
	rl e
	rla
	sub c
	jr nc,@noadd
	add a,c
@noadd:
	djnz @loop
	ld b,a
	ld a,e
	rla
	cpl
	ret
