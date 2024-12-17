.data

newline:
    .asciiz "\n"

.text
.globl main

main:
    addi $s0, $zero, 10

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall
    
    jal inc_my_reg

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall

inc_my_reg:
    addi $sp, $sp, -4
    sw $s0, 0($sp)

    addi $s0, $s0, 30
    # here the procedure can change the values of t registers
    # however, for s register values we store them in stack 

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    lw $s0, 0($sp)
    addi $sp, $sp, 4


    jr $ra