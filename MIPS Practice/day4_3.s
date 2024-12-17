.data

array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
n    : .word 10
space: .asciiz " "

.text
.globl main

main:
    la $s0, array
    lw $s1, n

    li $t0, 0

    j print_array

print_array:
    beq $t0, $s1, exit_loop

    li $v0, 1
    lw $a0, 0($s0)
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $s0, $s0, 4
    addi $t0, $t0, 1
    j print_array

exit_loop:
    li $v0, 10
    syscall