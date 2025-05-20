; Macro to save registers at function start
%macro FUNC_PROLOGUE 0
    push rbx                ; Save RBX (callee-saved)
    push rsi                ; Save RSI (callee-saved)
    push rdi                ; Save RDI (callee-saved)
    mov rsi, rdi            ; Copy input string pointer to RSI
%endmacro

; Macro to restore registers at function end
%macro FUNC_EPILOGUE 0
    pop rdi                 ; Restore RDI
    pop rsi                 ; Restore RSI
    pop rbx                 ; Restore RBX
%endmacro

section .text
    global reverseString    ; Make function visible to linker
    extern stringLength     ; Declare external stringLength function

; void reverseString(char* str)
; Input: RDI = pointer to null-terminated string
; Modifies: The string is reversed in-place
reverseString:
    FUNC_PROLOGUE           ; Setup registers (RSI now holds string pointer)

    ; Get string length
    call stringLength       ; RAX = string length
    dec rax                 ; Convert length to zero-based index
    mov rcx, rax            ; RCX = right index (starts at end)
    xor rdx, rdx            ; RDX = left index (starts at 0)

.rev_loop:
    ; Check if pointers have met/crossed
    cmp rdx, rcx            ; Compare left and right indices
    jge .done               ; If left >= right, we're done

    ; Swap characters at left and right positions
    mov al, [rsi + rdx]     ; AL = character at left position
    mov bl, [rsi + rcx]     ; BL = character at right position
    mov [rsi + rdx], bl     ; Store right char at left position
    mov [rsi + rcx], al     ; Store left char at right position

    ; Move pointers toward center
    inc rdx                 ; Left index++
    dec rcx                 ; Right index--
    jmp .rev_loop           ; Repeat

.done:
    FUNC_EPILOGUE           ; Restore registers
    ret                     ; Return

section .note.GNU-stack noalloc noexec nowrite progbits  ; Mark stack as non-executable
