.data

.text
.globl main

main:
    # sll is used to shift bits left logically
    # sll used for efficient multiplication

    addi $s0, $zero, 4

    sll $t0, $s0, 2 # bit manipulated to multiply by 4

    li $v0, 1;
    move $a0, $t0
    syscall

    li $v0, 10
    syscall