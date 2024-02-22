section .data 
    list DB 1,2,3,4
    list_len EQU $ - list

section .text
global _start

_start:
    MOV ecx, 0

loop:
    CMP ecx, list_len
    JE end
    MOV eax, [list + ecx]
    SHL eax, 1
    MOV [list + ecx], eax
    INC ecx
    JMP loop

end:      
    MOV eax, 1
    XOR ebx, ebx
    INT 80h