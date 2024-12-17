.data

myarray: .space 12

.text
.globl main

main:
    addi $s0, $zero, 4
    addi $s1, $zero, 10
    addi $s2, $zero, 12

    addi $t0, $zero, 0 # will be used as an index

    sw $s0, myarray($t0)
        addi $t0, $t0, 4
    sw $s1, myarray($t0)
        addi $t0, $t0, 4
    sw $s2, myarray($t0)

    # lw $t1, myarray($zero)

    # li $v0, 1
    # move $a0, $t1
    # syscall

    # re initialise index
    addi $t0, $zero, 0
    j while

    li $v0, 10
    syscall

while:
    beq $t0, 12, exit

    lw $t6, myarray($t0)

    li $v0, 1
    move $a0, $t6
    syscall

    addi $t0, $t0, 4

    j while

exit:
    li $v0, 10
    syscall