;;; https://map.grauw.nl/articles/mult_div_shifts.php
;;; 
;;; Divide 16-bit values (with 16-bit result)
;;; In: Divide BC by divider DE
;;; Out: BC = result, HL = rest
;;;
div16:
	ld hl,0
	ld a,b
	ld b,8
@loop1:
	rla
	adc hl,hl
	sbc hl,de
	jr nc,@noadd1
	add hl,de
@noadd1:
	djnz @loop1
	rla
	cpl
	ld b,a
	ld a,c
	ld c,b
	ld b,8
@loop2:
	rla
	adc hl,hl
	sbc hl,de
	jr nc,@noadd2
	add hl,de
@noadd2:
	djnz @loop2
	rla
	cpl
	ld b,c
	ld c,a
	ret
