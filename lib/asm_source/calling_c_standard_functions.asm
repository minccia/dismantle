extern printf
extern exit

section .data
    msg DD "Hello World!",0
    msg2 DD "This is a test",0
    fmt DB "%s %s",10,0

section .text
global main

main:
    PUSH msg2
    PUSH msg
    PUSH fmt
    CALL printf
    PUSH 0
    CALL exit
