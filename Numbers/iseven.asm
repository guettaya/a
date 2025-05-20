section .text
    global isEven

; bool isEven(int num)
isEven:
    mov eax, edi
    and eax, 1
    xor eax, 1
    ret
