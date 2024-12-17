.data

N: 
    .word 10
array: 
    .word 45, 54, 69, 96, 103, 302, 1, 3, 4, 56
newline:
    .asciiz "\n"
space:
    .asciiz " "

.text

.globl main

main:
    la $t0, array
    lw $t1, N 
    li $t2, 1   # currlen
    li $t3, 1   # maxlen
    move $t4, $t0   # curr start address
    move $t5, $t0   # max start address

    li $t6, 1
    add $t7, $t0, 4

loop:
    beq $t6, $t1, check_last

    lw $t8, 0($t7)
    lw $t9, -4($t7)
    ble $t8, $t9, reset
    j increase_iterator

check_last:
    ble $t2, $t3, print_res
    j cut_last

reset:
    move $t4, $t7
    li $t2, 1
    j compare

increase_iterator:
    add $t2, $t2, 1

compare:
    ble $t2, $t3, goToLoop
    j update_maxlen

update_maxlen:
    move $t3, $t2
    move $t5, $t4

goToLoop:
    addi $t6, $t6, 1
    addi $t7, $t7, 4
    j loop

print_res:
    sll $t7, $t3, 2
    add $t7, $t5, $t7

print_loop:
    beq $t5, $t7, print_end

    lw $t8, 0($t5)            # start address

    li $v0, 1                 # print, print, print
    move $a0, $t8
    syscall

    la $a0, space       
    li $v0, 4
    syscall

    add $t5, $t5, 4
    j print_loop

print_end:
    la $a0, newline         # print, print, print
    li $v0, 4               
    syscall

    li $v0, 10          
    syscall

cut_last:
    move $t3, $t2
    move $t5, $t4
    j print_res