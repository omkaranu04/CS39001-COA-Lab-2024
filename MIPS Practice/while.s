.data



.text
.globl main

main:
    addi $t0, $zero, 0      # will act as i in while loop


while:
    bgt $t0, 10, exit

    # print the value
    jal print

    addi $t0, $t0, 1
    j while

exit:
    li $v0, 10
    syscall

print:
    li $v0, 1
    move $a0, $t0
    syscall

    jr $ra