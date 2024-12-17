.data

prompt1:    .asciiz     "Enter n : "
space  :    .asciiz     " "
prompt2:    .asciiz     "Answer is : "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0       # input stored in $s0
    li $t0, 0           # counter

    j conj

conj:
    beq $s0, 1, print_count

    li $t1, 1
    and $t2, $t1, $s0

    addi $t0, $t0, 1
    beq $t2, $zero, even
    
    li $t3, 3
    mul $s0, $s0, $t3
    addi $s0, $s0, 1

    j conj

even:
    li $t3, 2
    div $s0, $t3
    mflo $s0

    j conj

print_count:
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall