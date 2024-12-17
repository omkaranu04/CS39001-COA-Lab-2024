.data

prompt:
    .asciiz "Enter your age : "
message:
    .asciiz "\nYour age is : "
zerofloat:
    .float 0.0

.text
.globl main

main:
    lwc1 $f2, zerofloat 

    li $v0, 4
    la $a0, prompt
    syscall

    # take user input // say int input
    # li $v0, 5 
    # syscall # the inputted value is now stored in $v0, so we need to move it somewhere else so that we can use it
    # move $t0, $v0

    # to read a float 6 is the code
    # li $v0, 6
    # syscall # the value entered by user is stored in $f0 register

    # to read double from the user 7 is the code
    li $v0, 7
    syscall

    li $v0, 4
    la $a0, message     # value entered by user is stored in f0 register
    syscall

    # print integer
    # li $v0, 2
    # move $a0, $t0
    # syscall

    # print float
    # li $v0, 2
    # add.s $f12, $f1, $f0

    # syscall

    # print double
    li $v0, 3
    # mov.d $f12, $f0  # you need to move the double from whatever f you have stored to f12
    add.d $f12, $f0, $f10 # this also works
    syscall

    # end the program
    li $v0, 10
    syscall