section .text
    global factorial

; long factorial(int num)
factorial:
    push rbp
    mov rbp, rsp

    mov eax, edi        ; num -> eax
    cmp eax, 0
    jl .return_minus1   ; return -1 for negative input

    mov rcx, 1          ; result = 1
    cmp eax, 1
    jbe .done           ; if num <= 1, skip loop

.loop:
    imul rcx, rax       ; result *= num
    dec eax
    cmp eax, 1
    jge .loop

.done:
    mov rax, rcx
    pop rbp
    ret

.return_minus1:
    mov rax, -1
    pop rbp
    ret
