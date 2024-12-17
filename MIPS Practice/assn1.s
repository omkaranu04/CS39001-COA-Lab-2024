.data

prompt1 :   .asciiz "Enter a number : "
newline :   .asciiz "\n"
space   :   .asciiz " " 

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
    move $s0, $v0       # now $s0, contains the input I have taken from the user
    move $s1, $s0       # $s1 will be a copy of $s0, since we will keep editing the changes in $s0

    # setting the argument to the function and then calling the function itself
    # $a1 consists of the first iterator, starting from 2
    li $a1, 2
    j printPrime

    # ending the program
    li $v0, 10
    syscall

printPrime:
    bgt $a1, $s1, exitLoop

    div $s0, $a1
    mfhi $t1        # $t1 will contain the division remainder
    bnez $t1, increaseDivisor

    # if it does divide then print the divisor
    li $v0, 1
    move $a0, $a1
    syscall

    # print space
    li $v0, 4
    la $a0, space
    syscall

    # update the number by dividing it by desired divisor
    div $s0, $a1
    mflo $s0        # $s0 will get updated after getting divided

    # recursion call
    j printPrime

increaseDivisor:
    addi $a1, $a1, 1
    j printPrime

exitLoop:
    # ending the program
    li $v0, 10
    syscall