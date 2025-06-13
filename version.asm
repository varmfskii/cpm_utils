	include "cpm.asm"
	org $100
	ld c,S_BDOSVER
	call BDOS
	push af
	srl a
	srl a
	srl a
	srl a
	call hexdigit
	ld e,'.'
	ld c,C_WRITE
	call BDOS
	pop af
	and a,$0f
	call hexdigit
	ret
hexdigit:	
	cp a,10
	jp nc,letter
	add a,'0'
	jp print
letter:	
	add a,'A'-10
print:
	ld e,a
	ld c,C_WRITE
	call BDOS
	ret
	
