.data

N           : .word 10
K           : .word 4
array       : .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
newline     : .asciiz "\n"
space       : .asciiz " "
prompt1     : .asciiz "Kth Smallest : "
prompt2     : .asciiz "Kth Largest : "

.text
.globl main

main:
    jal sort

    # printing the results
    lw $t5, K
    sub $t6, $t5, 1
    sll $t7, $t6, 2
    add $t8, $t0, $t7
    lw $s0, 0($t8)

    li $v0, 4       
    la $a0, prompt1
    syscall 

    li $v0, 1      
    move $a0, $s0
    syscall 

    li $v0, 4
    la $a0, newline
    syscall

    lw $t5, K 
    lw $t1, N 
    sub $t6, $t1, $t5
    sll $t7, $t6, 2
    add $t8, $t0, $t7
    lw $s1, 0($t8)

    li $v0, 4       
    la $a0, prompt2
    syscall

    li $v0, 1      
    move $a0, $s1
    syscall 

    li $v0, 10
    syscall

sort:
    la $t0, array
    lw $t1, N 
    sub $t2, $t1, 1

o_loop:
    beq $t2, $zero, end_o_loop 
    li $t3, 0

in_loop:
    sub $t4, $t2, $t3
    beq $t4, $zero, end_in_loop
    sll $t5, $t3, 2             # offset for the address
    add $t6, $t0, $t5           # address of an element in array
    lw $t7, 0($t6)
    lw $t8, 4($t6)

    ble $t7, $t8, dont_swap

    sw $t8, 0($t6)
    sw $t7, 4($t6)              # swap if the conditions are met

dont_swap:
    addi $t3, $t3, 1
    j in_loop

end_in_loop:
    addi $t2, $t2, -1
    j o_loop

end_o_loop:
    jr $ra