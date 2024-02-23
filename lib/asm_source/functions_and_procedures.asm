section .data

section .text
global _start

addTwo:
    ADD eax,ebx
    RET

_start:
    MOV eax, 2
    MOV ebx, 3
    CALL addTwo
    MOV ecx, eax

    MOV eax, 1
    XOR ebx, ebx
    INT 80h