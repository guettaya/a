section .text
    global gcd

; int gcd(int a, int b)
gcd:
    push rbp
    mov rbp, rsp

    mov eax, edi    ; a
    mov ecx, esi    ; b

.loop:
    test ecx, ecx
    je .done

    mov edx, ecx
    xor edx, edx
    mov edx, eax
    xor edx, edx
    mov edx, eax
    xor edx, edx
    mov edx, eax
    xor edx, edx
    mov edx, eax
    xor edx, edx

    xor edx, edx
    div ecx
    mov eax, ecx
    mov ecx, edx
    jmp .loop

.done:
    mov eax, eax
    pop rbp
    ret
