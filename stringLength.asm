section .text
    global stringLength

; int stringLength(char* str)
stringLength:
    xor rax, rax            ; length = 0
.loop:
    cmp byte [rdi + rax], 0 ; while str[i] != '\0'
    je .done
    inc rax
    jmp .loop
.done:
    ret
