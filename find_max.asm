section .text
    global findMax


; rdi = arr, rsi = size
findMax:
    test rsi, rsi
    jz .return_zero

    mov rbx, rdi        ; rbx = arr
    mov eax, [rbx]      ; eax = current max
    add rbx, 4
    dec rsi             ; already used one elem of arr size-1

.loop:
    test rsi, rsi
    jz .done
    mov edx, [rbx]
    cmp edx, eax
    jle .skip
    mov eax, edx        ; update max if large

.skip:
    add rbx, 4
    dec rsi
    jmp .loop

.done:
    ret

.return_zero:
    xor eax, eax
    ret
