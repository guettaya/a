section .text
    global stringLength      ; Make the function visible to linker

; int stringLength(char* str)
; Input: RDI = pointer to null-terminated string
; Output: RAX = string length (excluding null terminator)
stringLength:
    xor rax, rax            ; Initialize length counter to 0

.loop:
    ; Check if current character is null terminator
    cmp byte [rdi + rax], 0 ; Compare str[i] with '\0'
    je .done                ; If null terminator found, we're done
    
    inc rax                 ; Increment length counter
    jmp .loop               ; Continue looping

.done:
    ret                     ; Return with length in RAX

section .note.GNU-stack noalloc noexec nowrite progbits  ; Mark stack as non-executable
