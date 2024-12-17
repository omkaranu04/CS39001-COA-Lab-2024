.data

prompt1: .asciiz "Enter A Number : "
prompt2: .asciiz "Prime Factors Are : "
prompt3: .asciiz "You entered 0"
prompt4: .asciiz "You entered 1"
prompt5: .asciiz "You entered -ve Number"
space:   .asciiz " "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0

    # special cases for 1 and 0
    beqz $s0, zero_input
    beq $s0, 1, one_input
    blt $s0, $zero, neg_input

    li $v0, 4
    la $a0, prompt2
    syscall

    addi $t0, $zero, 2  # our iterator
    j prime_factors

zero_input:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 10
    syscall

one_input:
    li $v0, 4
    la $a0, prompt4
    syscall

    li $v0, 10
    syscall

neg_input:
    li $v0, 4
    la $a0, prompt5
    syscall

    li $v0, 10
    syscall

prime_factors:
    beq $s0, 1, finish

    div $s0, $t0
    mfhi $t1        # rem
    mflo $t2        # quo
    
    beq $t1, $zero, print_factor
    j increase_iterator

print_factor:
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, space
    syscall

    move $s0, $t2

    j prime_factors

increase_iterator:
    addi $t0, $t0, 1
    
    j prime_factors

finish:
    li $v0, 10
    syscall