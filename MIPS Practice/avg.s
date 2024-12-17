.data

array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9
length: .word 9
sum:    .word 0
avg:    .word 0
newline: .asciiz "\n"

.text
.globl main

main:
    la $t0, array           # base address is in $t0
    li $t1, 0               # index for the array i.e. i
    lw $t2, length          # $t2 will store the length of the array in $t2
    li $t3, 0               # $t3 is the running sum

    jal sumloop

    # now calculate the avg
    div $t5, $t3, $t2
    sw $t5, avg

    # printing the results
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    move $a0, $t5
    syscall
    # printing over

    # terminate
    li $v0, 10
    syscall

sumloop:
    lw $t4, ($t0)           # $t4 will contain arr[i] 
    add $t3, $t3, $t4       # sum += arr[i]

    add $t1, $t1, 1         # i += 1
    add $t0, $t0, 4         # shift by 4 bytes, size of the integer, updating the array address

    blt $t1, $t2, sumloop   # loop condition
    sw $t3, sum

    jr $ra
