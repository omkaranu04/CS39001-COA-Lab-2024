.data

newline:
    .asciiz "\n"

.text
.globl main
main:
    addi $t0, $zero, 123456
    addi $t1, $zero, 123456

    # mul $t2, $t0, $t1   # this can multiply 16 bits with another 16 bits number
    mult $t0, $t1   # result stored in lo and hi registers

    mflo $t2    # move from lo to $t2 (stores lower 32 bits)
    # mfhi $t3  # move from hi to $t3 (stores the higher 32 bits)

    li $v0, 1
    move $a0, $t2
    # add $a0, $zero, $t2 # this is also acceptable
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # print higher 32 bits
    # li $v0, 1
    # move $a0, $t3
    # syscall

    li $v0, 10
    syscall