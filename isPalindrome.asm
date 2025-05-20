section .text
    global isPalindrome      ; Make the isPalindrome function visible to linker
    extern stringLength      ; Declare external stringLength function

; int isPalindrome(char* str)
; Input: RDI = pointer to null-terminated string
; Output: EAX = 1 if palindrome, 0 if not
isPalindrome:
    push rbx                 ; Save RBX (callee-saved register)
    mov rbx, rdi             ; RBX = preserve original string pointer

    ; Get string length by calling external function
    call stringLength        ; RAX = string length
    dec rax                  ; RAX = length-1 (convert to zero-based index)
    mov rcx, rax             ; RCX = right index (starts at end of string)
    xor rdx, rdx             ; RDX = left index (starts at 0)

.pal_loop:
    ; Check if we've met or crossed the middle
    cmp rdx, rcx             ; Compare left and right indices
    jge .true_pal            ; If left >= right, we've checked all pairs

    ; Load characters to compare
    mov al, [rbx + rdx]      ; AL = character at left index
    mov dl, [rbx + rcx]      ; DL = character at right index (note: overwrites RDX low byte)
    
    ; Compare the two characters
    cmp al, dl
    jne .false_pal           ; If characters don't match, not a palindrome

    ; Move indices toward center
    inc rdx                  ; Left index++
    dec rcx                  ; Right index--
    jmp .pal_loop            ; Repeat loop

.true_pal:
    ; Return true (1) - all character pairs matched
    mov eax, 1
    pop rbx                  ; Restore RBX
    ret

.false_pal:
    ; Return false (0) - found mismatched characters
    xor eax, eax             ; EAX = 0
    pop rbx                  ; Restore RBX
    ret

section .note.GNU-stack noalloc noexec nowrite progbits  ; Mark stack as non-executable
