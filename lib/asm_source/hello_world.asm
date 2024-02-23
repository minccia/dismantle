section .data
    message DB 'Hello, world!', 0xA
    message_len EQU $ - message

section .text 
global _start

_start:
    MOV eax, 4
    MOV ebx, 1
    MOV ecx, message
    MOV edx, message_len
    INT 80h

    MOV eax, 1
    MOV ebx, 0
    INT 80h