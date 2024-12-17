.data

prompt1:
    .asciiz "Enter a number: "
prompt2:
    .asciiz "Quotient: "
prompt3:
    .asciiz "Remainder: "
space:
    .asciiz " "
newline:
    .asciiz "\n"
test:
    .asciiz "test call"

.text
.globl main

# $s0 

main:
    li $v0, 4       # to output a string
    la $a0, prompt1 # tells which address and string to print
    syscall         # performs a call to the system

    li $v0, 5   # to input a number
    syscall
    move $s0, $v0

    li $s1, 0 # quotient
    li $s2, 0 # remainder
    li $s3, 255

    j divideBy255

divideBy255:
    blt $s0, $s3, remn 
    sub $s0, $s0, $s3
    addi $s1, $s1, 1
    j divideBy255

remn:
    add $s2, $s2, $s0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1               
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1               
    move $a0, $s2
    syscall

    li $v0, 10
    syscall