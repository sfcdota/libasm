global _ft_strcmp
section .text
	
_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
	xor rdx, rdx

.loop:
	mov dh, byte[rdi + rcx]
	mov dl, byte[rsi + rcx]
	cmp dh, dl
	jne exit
	inc rcx
	test dh, dh
	jnz .loop

exit:
	mov al, dh
	xor dh, dh
	sub rax, rdx
	ret