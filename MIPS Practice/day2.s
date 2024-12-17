.data

prompt1: .asciiz "Enter the value of x : "
prompt2: .asciiz "The final answer is : "
space  : .asciiz " "
newline: .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0   # $s0 has the input x
    move $s3, $s0   # backup

    li $s1, 1       # $s1 will give us correct answer
    li $s2, 1       # $s2 will be the denominator
    li $s4, 2       # multiplier for factorial

    j cal_exp

cal_exp:
    div $s0, $s2
    mflo $t1
    beq $t1, $zero, exit_loop

    add $s1, $s1, $t1
    mul $s0, $s0, $s3
    mul $s2, $s2, $s4
    addi $s4, $s4, 1

    j cal_exp

exit_loop:
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall