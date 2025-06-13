;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Multiply 16-bit values (with 16-bit result)
;;; In: Multiply BC with DE
;;; Out: HL = result
;;;
mult16:
	ld a,b
	ld b,16
@loop:
	add hl,hl
	sla c
	rla
	jr nc,@noadd
	add hl,de
@noadd:
	djnz @loop
	ret
