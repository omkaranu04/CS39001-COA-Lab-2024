.data

message:
    .asciiz "The number is less than the other"

.text
.globl main

main:
    addi $t0, $zero, 400
    addi $t1, $zero, 200

    slt $t2, $t0, $t1
    # sets t2 = 1 if t0<t1 or 0

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall