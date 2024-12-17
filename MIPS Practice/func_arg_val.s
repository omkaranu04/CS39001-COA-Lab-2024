# in this we want to pass arguments and return values from functions
# a0, a1, a2, a3 are argument registers
.data

.text
.globl main
main:
    addi $a1, $zero, 50
    addi $a2, $zero, 100

    jal addNumbers

    li $v0, 1
    move $a0, $v1   # v1 is the return variable, returned from the called function
    syscall

    li $v0, 10
    syscall

addNumbers:
    add $v1, $a1, $a2
    # we choose v1 because it is a return value, program norm say

    jr $ra