.data

N : 
    .word 10
K : 
    .word 4
array : 
    .word 5, 8, 1, 4, 17, 21, 56, 23, 10, 6

newline:
    .asciiz "\n"
space:
    .asciiz " "
p1:
    .asciiz "Kth Smallest: "
p2:
    .asciiz "Kth Smallest: "

.text
.globl main

# approach to perform bubble sort on the array and then do kth smallest and kth largest

main:
    jal bubbleSort

    # extracting the smallest kth element
    lw $t5, K
    sub $t6, $t5, 1
    sll $t7, $t6, 2
    add $t8, $t0, $t7
    lw $s0, 0($t8)

    li $v0, 4       
    la $a0, p1
    syscall 

    li $v0, 1      
    move $a0, $s0
    syscall 

    li $v0, 4
    la $a0, newline
    syscall

    # extracting the largest kth element
    lw $t5, K 
    lw $t1, N 
    sub $t6, $t1, $t5
    sll $t7, $t6, 2
    add $t8, $t0, $t7
    lw $s1, 0($t8)

    li $v0, 4       
    la $a0, p2
    syscall
    li $v0, 1      
    move $a0, $s1
    syscall 

    li $v0, 10
    syscall

bubbleSort:
    la $t0, array
    lw $t1, N 
    sub $t2, $t1, 1

outer_loop:
    beq $t2, $zero, end_outer_loop
    move $t3, $zero

inner_loop:
    sub $t4, $t2, $t3
    beq $t4, $zero, end_inner_loop
    sll $t5, $t3, 2
    add $t6, $t0, $t5
    lw $t7, 0($t6)
    lw $t8, 4($t6)

    ble $t7, $t8, no_swap

    sw $t8, 0($t6)
    sw $t7, 4($t6)

no_swap:
    addi $t3, $t3, 1
    j inner_loop

end_inner_loop:
    sub $t2, $t2, 1
    j outer_loop

end_outer_loop:
    jr $ra
