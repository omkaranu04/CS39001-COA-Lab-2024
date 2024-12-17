.data

newline:
    .asciiz "\n"

.text
.globl main

# s registers are callee saved
# t registers are caller saved

main:
    addi $s0, $zero, 10

    jal print_value
    jal print_newline
    jal inc_my_reg
    jal print_value

    li $v0, 10
    syscall

inc_my_reg:
    addi $sp, $sp, -8
    sw $s0, 0($sp)
    sw $ra, 4($sp)

    addi $s0, $s0, 30
    # here the procedure can change the values of t registers
    # however, for s register values we store them in stack 

    jal print_value
    jal print_newline

    lw $s0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8

    jr $ra

print_value:
    li $v0, 1
    move $a0, $s0
    syscall

    jr $ra

print_newline:
    li $v0, 4
    la $a0, newline
    syscall

    jr $ra