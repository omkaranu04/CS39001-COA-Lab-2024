.data

space: .asciiz " "

.text
.globl main
main:
    li $t1, 0     # iterator

    move $s5, $sp   # saving the stack pointer

    j input_array

input_array:
    beq $t1, 10, print_array

    addi $sp, $sp, -4

    li $v0, 5
    syscall

    sw $v0, ($sp)
    addi $t1, $t1, 1
    j input_array

print_array:
    li $t1, 0

    j pa

pa:
    beq $t1, 10, exit_loop

    li $v0, 1
    lw $a0, 0($sp)
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $sp, $sp, 4
    addi $t1, $t1, 1
    j pa

exit_loop:
    li $v0, 10
    syscall