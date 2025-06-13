	include "cpm.asm"
	org $100
	ld bc,(6)
	ld c,0
	ld de,10
	call div16
	ld a,l
	add a,'0'
	ld (buffer+4),a
	call div16
	ld a,l
	add a,'0'
	ld (buffer+3),a
	call div16
	ld a,l
	add a,'0'
	ld (buffer+2),a
	call div16
	ld a,l
	add a,'0'
	ld (buffer+1),a
	ld a,c
	add a,'0'
	ld (buffer),a
	ld hl,buffer-1
	ld a,'0'
loop:
	add hl,1
	cp a,(hl)
	jp z,loop
	ld de,hl
	ld c,C_WRITESTR
	call BDOS
	ret
buffer:
	db "00000$"
	include "div16.asm"
