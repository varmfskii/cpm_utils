;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Multiply 8-bit value with a 16-bit value
;;; In: Multiply A with DE
;;; Out: HL = result
;;;
mult12:
	ld l,0
	ld b,8
@loop:
	add hl,hl
	add a,a
	jr nc,@noadd
	add hl,de
@noadd:
	djnz @loop
	ret
