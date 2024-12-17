.data

prompt1: .asciiz "Enter a number : "
prompt2: .asciiz "Sum is : "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    add $t0, $zero, $s0
    addi $t1, $s0, 1
    mul $t2, $t0, $t1
    addi $t3, $zero, 2
    div $t2, $t3
    mflo $t3

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall