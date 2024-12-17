.data

message: .asciiz "The numbers are equal"
message2: .asciiz "Nothing happened"

.text
.globl main

main:
    addi $t0, $zero, 20
    addi $t1, $zero, 20

    beq $t0, $t1, num_eq
    # bne is used for branch if not equal

    li $v0, 10
    syscall

num_eq:
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 10
    syscall