extern test
extern exit

section .data

section .text
global main

main:
    PUSH 1
    PUSH 2
    CALL test

    PUSH eax
    CALL exit
