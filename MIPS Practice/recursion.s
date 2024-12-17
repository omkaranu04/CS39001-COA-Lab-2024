.data

prompt: .asciiz "Enter a number : "
message: .asciiz "The factorial is : "
number: .word 0
answer: .word 0

.text
.globl main

main:
    # read the number from the user
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    # store the value the user entered in number
    sw $v0, number

    # call the factorial function
    lw $a0, number
    jal find_fact
    sw $v0, answer

    # display the results
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 1
    lw $a0, answer
    syscall

    # ending the program
    li $v0, 10
    syscall

find_fact:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    # base case
    li $v0, 1
    beq $a0, $zero, fact_done

    move $s0, $a0
    # calling f(n-1)
    sub $a0, $a0, 1
    jal find_fact

    # n * f(n-1) step
    mul $v0, $s0, $v0

fact_done:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8

    jr $ra