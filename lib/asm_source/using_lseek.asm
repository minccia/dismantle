section .data
    pathname DB "../support/test.txt", 0
    open_failure_msg DB "File does not exist", 0xA
    open_failure_msg_len EQU $ - open_failure_msg

section .bss
    buffer resb 10

section .text

global _start

_start:
    MOV eax, 5            ; sys_open
    MOV ebx, pathname     ;
    mov ecx, 0            ;
    INT 80h               ;

    CMP eax, 0            ; Jump if open
    JS open_failure       ; fails (negative fd)

open_success:
    MOV ebx, eax          ; sys_open file descriptor
    MOV eax, 19           ; sys_lseek
    MOV ecx, 20           ; offset
    mov edx, 0            ; whence SEEK_SET
    INT 80h

    MOV eax, 3            ; sys_read
    MOV ecx, buffer       ;
    MOV edx, 10           ; read 10 bytes
    INT 80h

    MOV ecx, 0
    JMP end

open_failure:
    MOV eax, 4            ; sys_write
    MOV ebx, 1            ; stdout
    MOV ecx, open_failure_msg
    MOV edx, open_failure_msg_len
    INT 80h

    MOV ecx, 1            ; status code

end:
    MOV eax, 1            ; sys_exit
    MOV ebx, ecx          ;
    INT 80h