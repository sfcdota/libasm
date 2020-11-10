global _ft_strlen

section .text

_ft_strlen:
	xor rcx, rcx

.loop:
	cmp byte[rdi + rcx], 0
	jz exit
	inc rcx
	jmp .loop

exit:
	mov rax, rcx
	ret