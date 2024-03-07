section .data
    pathname: DD "/home/paola/test.txt"

section .bss
    buffer: resb 10

section .text

global _start

_start:
    MOV eax, 5          ;  sys_open
    MOV ebx, pathname   ;
    mov ecx, 0          ;
    INT 80h             ;

    MOV ebx, eax        ; sys_open file descriptor
    MOV eax, 19         ; sys_lseek
    MOV ecx, 20         ; offset
    mov edx, 0          ; whence SEEK_SET
    INT 80h

    MOV eax, 3          ; sys_read
    MOV ecx, buffer     ;
    MOV edx, 10         ; read 10 bytes
    INT 80h

    MOV eax, 1          ; sys_exit
    XOR ebx, ebx        ;
    INT 80h