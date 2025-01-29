; test program

section .data

	EXIT_STATUS	equ	0
	SYS_EXIT	equ	60

	bVar	db	10
	bVar2	db	15
	bResult	db	0

section .text
global _start
_start:
	mov	al,	byte [bVar]
	add	al,	byte [bVar2]
	mov	byte [bResult],	al

last:
	mov	rax,	SYS_EXIT
	mov	rdi,	[bResult]
	syscall
