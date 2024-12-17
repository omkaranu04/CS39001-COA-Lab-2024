.data

newline:
    .asciiz "\n"

.text
.globl main

main:
    addi $t0, $zero, 49
    addi $t1, $zero, 5

    # div $t2, $t0, $t1   # this stores integer division t0 / t1 in t2
    # in the above 3 arg case, last arg can be a constant value, it works
    div $t0, $t1    # two arguments does the hi and lo storing

    mflo $t2    # lo stores the quotient
    mfhi $t3    # hi stores the remainder

    li $v0, 1;
    move $a0, $t2
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1;
    move $a0, $t3
    syscall

    li $v0, 10
    syscall