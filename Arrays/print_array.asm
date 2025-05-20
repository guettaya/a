section .data
    newline db 10

section .text
    global printArray
    extern print_int    ;  C function to print integer


; rdi = arr, rsi = size
printArray:
    test rsi, rsi
    jz .done

    mov rcx, rsi        ; counter
    mov rbx, rdi        ; arr pointer
.loop:
    mov eax, [rbx]      ; get val
    push rcx            ; sav counter
    push rbx            ; save arr pointer
    mov edi, eax        ; prepare for C int print
    call print_int      ; call external C function
    pop rbx
    pop rcx
    add rbx, 4
    dec rcx
    jnz .loop

.done:
    ret
section .note.GNU-stack noalloc noexec nowrite progbits
