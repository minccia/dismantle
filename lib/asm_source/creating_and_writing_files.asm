section .data
    pathname: DD "lib/support/creating_and_writing_files.txt", 0
    errorMessage: DB "Could not create file.", 0xA
    errorMessageLen: EQU $ - errorMessage
    toWrite: DB "I love frogs, i love them so much.", 0xA
    toWriteLen: EQU $ - toWrite

section .text

global _start

_start:
    MOV eax, 5 ; sys_open
    MOV ebx, pathname
    MOV ecx, 101o ; O_RDWR bitwise-ord O_CREAT
    MOV edx, 700o ; S_IRWXU user permissions
    INT 80h

    CMP eax, 0
    JS error

    MOV ebx, eax ; Move created fd to ebx
    MOV eax, 4 ; sys_write
    MOV ecx, toWrite
    MOV edx, toWriteLen
    INT 80h

    JMP end

error:
    MOV eax, 4 ; sys_write
    MOV ebx, 1 ; STDOUT
    MOV ecx, errorMessage
    MOV edx, errorMessageLen
    INT 80h

end:
    MOV eax, 1 ; sys_exit
    XOR ebx, ebx
    INT 80h

