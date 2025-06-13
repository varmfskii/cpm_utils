;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Multiply 8-bit values
;;; In:  Multiply H with E
;;; Out: HL = result
;;;
mult8:
	ld d,0
	ld l,d
	ld b,8
@loop:
	add hl,hl
	jr nc,@noadd
	add hl,de
@noadd:
	djnz @loop
	ret
