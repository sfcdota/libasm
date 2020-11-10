global _ft_strdup

section .text

extern _ft_strlen
extern _malloc
extern ___error
extern _ft_strcpy

_ft_strdup:
	call _ft_strlen
	push rdi
	mov rdi, rax
	call _malloc
	cmp rax, 0
	je _error
	pop rsi
	mov rdi, rax
	call _ft_strcpy
	ret

_error:
	call ___error
	ret