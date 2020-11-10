global _ft_strcpy

section .text
	
_ft_strcpy:
	mov rax, rdi
	xor rcx, rcx

.loop:
	mov dl, byte[rsi + rcx]
	mov byte[rdi + rcx], dl
	inc rcx
	test dl, dl
	jnz .loop
	ret