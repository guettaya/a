section .text
    global isPalindrome
    extern stringLength

; int isPalindrome(char* str)
isPalindrome:
    push rbx
    mov rbx, rdi            ; rbx = str

    call stringLength
    dec rax
    mov rcx, rax            ; right
    xor rdx, rdx            ; left

.pal_loop:
    cmp rdx, rcx
    jge .true_pal

    mov al, [rbx + rdx]
    mov dl, [rbx + rcx]
    cmp al, dl
    jne .false_pal

    inc rdx
    dec rcx
    jmp .pal_loop

.true_pal:
    mov eax, 1
    pop rbx
    ret

.false_pal:
    xor eax, eax
    pop rbx
    ret

