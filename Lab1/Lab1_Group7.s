.data

# declaring string output statements

prompt1:
    .asciiz "Enter a number:"
    
res_msg:
    .asciiz "Prime factors are: "

invalid_input:
    .asciiz "Invalid number"
space:
    .asciiz " "
unique_number:
    .asciiz "1 has no prime factors"

.text
.globl main

main:
    li $v0, 4       # to output a string
    la $a0, prompt1 # tells which address and string to print
    syscall         # performs a call to the system

    li $v0, 5   # to input a number
    syscall
    move $s0, $v0

    li $t0, 2
    blt $s0, $zero, error_input # check if the entered number is less than 0
    beq $s0, 1, unique          # check if the number entered is 1
    li $v0, 4                   
    la $a0, res_msg             
    syscall 
    j findPrimeFactorization  # calling function to find factors

# to handle invalid inputs like -ve nos.
error_input:
    li $v0, 4
    la $a0, invalid_input
    syscall
    li $v0, 10
    syscall   

# prints if the entered number is 1
unique:
    li $v0, 4
    la $a0, unique_number
    syscall
    li $v0, 10
    syscall

# finds prime factors
findPrimeFactorization:
    beq $s0, 1, terminate   # if the quotient reaches 1, we have found all factors, so we terminate
    div $s0, $t0            # divide the number starting by division with 2.
    mfhi $t1                # remainder          
    mflo $t2                # quotient
    beq $t1, $zero, print_factor # if remainder is 0, means that it is divisible by that number
    j inc                   # increments the divisor when previous prime factor exhausts

inc:
    add $t0, $t0, 1
    j findPrimeFactorization

# prints the current prime factor
print_factor:
    li $v0, 1               
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, space
    syscall
    move $s0, $t2           # storing the quotient back in to the number, so that if there are more than 1 same prime factors, we get them
    j findPrimeFactorization 

# terminates the code
terminate:
    li $v0, 10
    syscall
    