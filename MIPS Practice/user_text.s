.data

prompt:
    .asciiz "Enter your name : "
message:
    .asciiz "Your name is : "
userinput:
    .space 20

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    # getting text from the user
    li $v0, 8   # to get user input from keyboard as text
    la $a0, userinput
    li $a1, 20
    syscall

    li $v0, 4
    la $a0, message
    syscall

    # displays the name
    li $v0, 4
    la $a0, userinput
    syscall
    
    li $v0, 10
    syscall