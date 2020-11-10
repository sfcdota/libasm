global _ft_strcmp

section .text
	
_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
.loop:
	mov dh, byte[rdi + rcx]
	mov dl, byte[rsi + rcx]
	cmp dh, dl
	jne exit
	inc rcx
	test dh, dh
	jnz .loop

exit:
	sub dh, dl
	mov al, dh
	jc kek
	ret

kek:
	neg dh
	mov al, dh
	ret