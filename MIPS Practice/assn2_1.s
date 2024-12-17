.data
prompt1 : .asciiz "Enter a number : "
prompt2 : .asciiz "Quotient : "
prompt3 : .asciiz "Remainder : "
space   : .asciiz " "
newline : .asciiz "\n"

.text
.globl main

main:
    # printing the prompt to enter a number
    li $v0, 4
    la $a0, prompt1
    syscall

    # taking the input from the user
    li $v0, 5
    syscall
    move $t0, $v0       # now $t0 contains the input from the user

    li $t1, 0           # bit counter, set to 0
    li $t2, 32          # the number of bits to travel
    li $t5, 0           # the Quotient
    li $t7, 0           # the Remainder

loop:
    beq $t1, $t2, print_results

    # now we will check if the current bit is set or not in the input number
    li $t3, 1
    sllv $t3, $t3, $t1
    and $t4, $t0, $t3

    beq $t4, $zero, next_bit

    move $t6, $t1
    j division

next_bit:
    addi $t1, $t1, 1
    j loop

division:
    blt $t6, 8, remainderCalculation
    addi $t6, $t6, -8
    # calculating consecutive powers of 2 to add to the quotient
    li $t8, 1
    sllv $t8, $t8, $t6
    add $t5, $t5, $t8
    j division

remainderCalculation:
    li $t8, 1
    sllv $t8, $t8, $t6
    add $t7, $t7, $t8
    
    li $t9, 254
    ble $t7, $t9, next_bit
    li $t9, 255
    sub $t7, $t7, $t9
    addi $t5, $t5, 1
    j next_bit

print_results:
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    move $a0, $t7
    syscall

    li $v0, 10
    syscall