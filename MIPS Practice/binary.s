.data
prompt1:    .asciiz     "Enter a number : "
prompt2:    .asciiz     "Binary is : "
space  :    .asciiz     " "
array  :    .space      128

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $a1, $v0       # $a1 will now store the inputted value

    la $s0, array       # starting address of array
    add $t0, $s0, 128   # Set $t0 to the end of array space
    li $t1, 0           # $t1 will act as a counter to the number of bits

    j binary_calc

binary_calc:
    beq $a1, $zero, prepare_print

    li $t2, 2
    div $a1, $t2
    mflo $a1
    mfhi $t3

    addi $t0, $t0, -1
    sb $t3, ($t0)      # Store the remainder as a byte
    addi $t1, $t1, 1
    j binary_calc

prepare_print:
    li $v0, 4
    la $a0, prompt2
    syscall

    la $t0, array       # Reset $t0 to the start of the array
    add $t0, $t0, 128   # Move $t0 to the end where the binary digits are stored
    sub $t0, $t0, $t1   # Move $t0 back to the start of the stored digits
    li $t2, 0           # Counter for printing

    j loop

loop:
    beq $t2, $t1, end_loop

    li $v0, 1
    lb $t3, 0($t0)
    move $a0, $t3
    syscall

    addi $t0, $t0, 1    # Move forward through the array
    addi $t2, $t2, 1
    j loop

end_loop:
    li $v0, 10
    syscall
