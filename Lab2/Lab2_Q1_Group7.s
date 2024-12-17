.data

prompt1:
    .asciiz "Enter a number : "
prompt2:
    .asciiz "Quotient : "
prompt3:
    .asciiz "Remainder : "
space:
    .asciiz " "
newline:
    .asciiz "\n"

.text
.globl main

main:
    # take the input from the user
    li $v0, 4
    la $a0, prompt1
    syscall

    # transfer the inputted number from the user
    li $v0, 5
    syscall
    move $t0, $v0   # now t0 will hold the inputted value from the user

    li $t1, 0           # bit counter, set to 0
    li $t2, 32          # how many bits in a number
    li $t5, 0           # quotient
    li $t7, 0           # remainder
    li $t6, 0           # extra backup variable

loop:
    beq $t1, $t2, pri_res  # after travelling all the bits print the results

    li $t3, 1           # for bitmasking the number
    sllv $t3, $t3, $t1  # left shift t3 by t1 units
    and $t4, $t0, $t3   # do and with OG number to check if the desired bit is set or not

    beq $t4, $zero, move_ahead    # if the bit is not set, we do not need to process it

    move $t6, $t1       # move iterator number to backup
    j divby255

move_ahead:
    add $t1, $t1, 1     # move to the next bit of the number, so basically t1 is our iterator on the bits
    j loop

divby255:
    blt $t6, 8, rem_cal  # if the iterator is less than 8, proceed to calculate the remainder, because all powers less than 8 only contribute to the remainder and not the quotient
    sub $t6, $t6, 8      # subtract 8 from t6
    li $t8, 1            # for calculating the powers of 2 for quotient / remainder
    sllv $t8, $t8, $t6   # calculate 2 power t6, contributing to quotient
    add $t5, $t5, $t8   # add contributions to the t5
    j divby255

rem_cal:
    li $t8, 1       # for calculating powers of 2
    sllv $t8, $t8, $t6  # 2 power $t6
    add $t7, $t7, $t8   # adding contribution to the remainder, <8 power stuff
    li $t9, 254         # covering the case what if OG rem >= 255
    ble $t7, $t9, move_ahead
    li $t9, 255
    sub $t7, $t7, $t9   # update remainder
    add $t5, $t5, 1     # update quotient
    j move_ahead        # now at every step if OG rem >= 255 will be reduced

pri_res:
    # print quo
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $t5
    syscall
    ###

    # print newline
    li $v0, 4
    la $a0, newline
    syscall
    ###
    
    # print rem
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    move $a0, $t7
    syscall
    ###

    li $v0, 10
    syscall