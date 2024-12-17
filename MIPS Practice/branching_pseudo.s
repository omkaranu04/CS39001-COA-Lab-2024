.data

message:.asciiz "Hi!"

.text
.globl main

main:
    addi $s0, $zero, 9
    addi $s1, $zero, 10

    # there are many pseudo instructions like bgt, you can see them in pdf file
    bgt $s0, $s1, display_hi 

    li $v0, 10
    syscall

display_hi:
    li $v0, 4
    la $a0, message
    syscall