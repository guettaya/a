section .text
    global reverseString
    extern stringLength

; void reverseString(char* str)
reverseString:
    push rbx
    push rsi
    push rdi

    mov rsi, rdi            ; rsi = str

    call stringLength       ; rax = length
    dec rax                 ; right = length - 1
    mov rcx, rax            ; rcx = right
    xor rdx, rdx            ; rdx = left

.rev_loop:
    cmp rdx, rcx
    jge .done

    ; Swap str[rdx] and str[rcx]
    mov al, [rsi + rdx]
    mov bl, [rsi + rcx]
    mov [rsi + rdx], bl
    mov [rsi + rcx], al

    inc rdx
    dec rcx
    jmp .rev_loop

.done:
    pop rdi
    pop rsi
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
