.data

num1:
    .word 46
num2:
    .word 23

.text
.globl main

main:
    lw $t0, num1
    lw $t1, num2

    # add $t2, $t0, $t1
    addi $t2, $t0, 23
    # sub $t2, $t0, $t1
    # addi --> add immediate, one of the args should be a constant
    # addi can be used to subtract also, third constant can be negative

    li $v0, 1
    # move $a0, $t2
    add $a0, $zero, $t2 # this is also acceptable
    syscall

    li $v0, 10
    syscall