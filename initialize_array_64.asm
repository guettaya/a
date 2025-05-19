section .text
    global initializeArray



initializeArray:
    ; rdi = arr
    ; rsi = size
    ; rdx = value
    test rsi, rsi          ; if size==0 do nothing
    jz .done

    mov rcx, rsi           ; counter=size
    mov eax, edx           ; zero-extend value into eax /312bit to use in loupp
    mov rbx, rdi           ; pointer to current num

.loop:
    mov [rbx], eax         ; store val
    add rbx, 4             ; move to next num
    dec rcx
    jnz .loop

.done:
    ret
