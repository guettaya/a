section .text
    global gcd

; int gcd(int a, int b)
; Input:  EDI = a, ESI = b
; Output: EAX = gcd(a, b)
; Uses Euclidean algorithm (iterative version)
gcd:
    push rbp
    mov rbp, rsp          ; Set up stack frame (standard function prologue)

    mov eax, edi          ; EAX = a (first argument)
    mov ecx, esi          ; ECX = b (second argument)

.loop:
    test ecx, ecx         ; Check if b == 0
    je .done              ; If yes, we're done (EAX contains the GCD)

    ; Prepare for division:
    xor edx, edx          ; Clear EDX (upper 32 bits of dividend)
    div ecx               ; EDX:EAX / ECX => EAX=quotient, EDX=remainder

    ; Update values for next iteration:
    mov eax, ecx          ; New a = old b
    mov ecx, edx          ; New b = remainder (a % b)
    
    jmp .loop             ; Repeat the process

.done:
    ; Result is already in EAX
    pop rbp               ; Restore stack frame
    ret                   ; Return with GCD in EAX

section .note.GNU-stack noalloc noexec nowrite progbits  ; Mark stack as non-executable
