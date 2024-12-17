.data

myarray: .word 100, 200, 400  # three elements equal to 3

.text
.globl main

main:
    addi $t0, $zero, 0
    j while

    li $v0, 10
    syscall

while:
    beq $t0, 12, exit

    lw $t1, myarray($t0)

    li $v0, 1
    move $a0, $t1
    syscall

    addi $t0, $t0, 4
    j while

exit:

    li $v0, 10
    syscall