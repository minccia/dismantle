extern printf

section .data
    pathname DD "/" ; Insert file path here
    string_format DB "%s"

section .bss
    buffer: RESB 200

section .text
global main

main:
    MOV eax, 5 ; sys_open
    MOV ebx, pathname
    MOV ecx, 0 ; O_RDONLY flag
    INT 80h

    MOV ebx, eax ; Save file descriptor into ebx
    MOV eax, 3 ; sys_read
    MOV ecx, buffer ; store buffer into ecx
    MOV edx, 200 ; how many characters we want to read
    INT 80h

    PUSH dword buffer
    PUSH dword string_format
    CALL printf

    MOV eax, 6 ; sys_close
    INT 80h

    MOV eax, 1
    XOR ebx, ebx
    INT 80h