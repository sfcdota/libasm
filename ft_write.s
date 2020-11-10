global _ft_write
section .text
extern ___error

_ft_write:
	mov rax, 0x2000004
	syscall
	cmp rax, 0
		jc _error
	ret

_error:
	call ___error
	ret