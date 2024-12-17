.data

array       : .word         0 : 32
enter_base  : .asciiz       "Enter Base : "
enter_exp   : .asciiz       "Enter Exponent : "
enter_mod   : .asciiz       "Enter Modular : "
binary      : .asciiz       "Binary is : "
mod_exp     : .asciiz       "\nBinary Exp. is : "
space       : .asciiz       " "
newline     : .asciiz       "\n"

.text
.globl main

main:
    # ------------------------------------------------ #
    # displaying prompt
    li $v0, 4
    la $a0, enter_base
    syscall

    # taking input from the user, stored in $s0, base 
    li $v0, 5
    syscall
    move $s0, $v0

    # displaying prompt
    li $v0, 4
    la $a0, enter_exp
    syscall

    # taking input from user exponent stored in $s3, exponent
    li $v0, 5
    syscall
    move $s3, $v0

    # displaying prompt
    li $v0, 4
    la $a0, enter_mod
    syscall

    # taking input from user modulo stored in $s4, modulo
    li $v0, 5
    syscall
    move $s4, $v0
    # ------------------------------------------------ #

    beq $s3, $zero, HandleZero

    la $s1, array
    move $a1, $s3
    addi $t2, $s1, 128   # storing address of array in t2
    li $s2, 0 # counter for bits

    jal DecimalToBinary 

    # ending the program
    li $v0, 10
    syscall

HandleZero:
    li $v0, 4
    la $a0, binary
    syscall

    li $v0, 1
    move $a0, $zero
    syscall

    addi $t1, $zero, 1
    beq $s4, $t1, printZero

    li $v0, 4
    la $a0, mod_exp
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall

printZero:
    li $v0, 4
    la $a0, mod_exp
    syscall

    li $v0, 1
    move $a0, $zero
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

DecimalToBinary:
    beq $a1, $zero, printDtB

    addi $s2, $s2, 1
    move $t3, $s2

    addi $t9, $zero, 2  # for division purposes only
    div $a1, $t9
    mflo $a1    # a1 will be quotient, hence directly updated
    mfhi $t1
    sw $t1, 0($t2)
    sub $t2, $t2, 4
    j DecimalToBinary

printDtB:
    li $v0, 4
    la $a0, binary
    syscall

    addi $t1, $s1, 128
    addi $t4, $zero, 4 
    mul $t5, $t3, $t4
    sub $t5, $t5, 4
    sub $t1, $t1, $t5
    j loop

loop:
    beq $t3, $zero, findExponential

    li $v0, 1
    lw $a0, 0($t1)
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t1, $t1, 4
    sub $t3, $t3, 1
    j loop

findExponential:
    li $v0, 4
    la $a0, mod_exp
    syscall

    move $a1, $s0

    addi $t1, $s1, 128
    addi $t4, $zero, 4 
    mul $t5, $s2, $t4
    sub $t5, $t5, 4
    sub $t1, $t1, $t5
    addi $t1, $t1, 4
    addi $t2, $s1, 128

    j calc_loop

calc_loop:
    bgt $t1, $t2, EndCalculation
    jal Square
    move $a1, $v1
    div $a1, $s4
    mfhi $a1
    
    # load the bit
    lw $t3, 0($t1)
    addi $t1, $t1, 4

    beq $t3, $zero, calc_loop
    jal Multiply
    move $a1, $v1
    div $a1, $s4
    mfhi $a1

    j calc_loop

Multiply:
    mult $a1, $s0
    mflo $v1

    jr $ra

Square:
    mult $a1, $a1
    mflo $v1

    jr $ra

EndCalculation:
    li $v0, 1
    move $a0, $a1
    syscall

    li $v0, 10
    syscall