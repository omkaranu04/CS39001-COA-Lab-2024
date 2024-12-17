.data

array: .space 100
space: .asciiz " "

.text
.globl main
main:
    la $s1, array
    li $t1, 0     # iterator

    j input_array

input_array:
    beq $t1, 5, print_array

    add $t2, $zero, $t1
    mul $t2, $t2, 4
    add $t2, $t2, $s1


    li $v0, 5
    syscall

    sw $v0, ($t2)
    addi $t1, $t1, 1
    j input_array

print_array:
    li $t1, 0

    j pa

pa:
    beq $t1, 5, exit_loop

    add $t2, $zero, $t1
    mul $t2, $t2, 4 
    add $t2, $t2, $s1

    li $v0, 1
    lw $a0, ($t2)
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t1, $t1, 1
    j pa

exit_loop:
    li $v0, 10
    syscall