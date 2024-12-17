.data
    
inte:
    .word 23
fl:
    .float 2.345
dob:
    .double 66.789
dob0:
    .double 0.0
newline:
    .asciiz "\n"

.text
.globl main

main:
    # print int
    li $v0, 1
    lw $a0, inte
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # print float
    li $v0, 2
    lwc1 $f12, fl
    syscall

    # print newline
    li $v0, 4
    la $a0, newline
    syscall

    # print double
    ldc1 $f2, dob
    ldc1 $f0, dob0
    li $v0, 3
    add.d $f12, $f0, $f2
    syscall

    # exit program
    li $v0, 10
    syscall