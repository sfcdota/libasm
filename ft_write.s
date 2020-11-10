global _ft_write

section .text

extern ___error

;_fr_write(int rdi, void *rsi, size_t rdx)
_ft_write:
	mov rax, 0x2000004
	syscall
	jc error
	ret

error:
	push rax
	call ___error
	pop qword[rax]
	mov rax, -1
	ret