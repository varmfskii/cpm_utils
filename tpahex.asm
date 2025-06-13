	include "cpm.asm"
	org $100
	ld a,(7)
	srl a
	srl a
	srl a
	srl a
	call hexdigit
	ld (buffer),a
	ld a,(7)
	and a,$0f
	call hexdigit
	ld (buffer+1),a
	ld de,buffer
	ld c,C_WRITESTR
	call BDOS
	ret
hexdigit:
	cp a,10
	jp nc,letter
	add a,'0'
	ret
letter:
	add a,'A'-10
	ret
buffer:	db "0000$"
	
