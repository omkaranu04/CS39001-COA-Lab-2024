.data

prompt          : .asciiz   "Reversed String : "
prompt1         : .asciiz   "Enter a String : "
input_string    : .space    100
output_string   : .space    100

.text

.globl main

main:
    # input from the user
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 8
    la $a0, input_string
    syscall
    # input complete

    la $s1, input_string    # loading address of input string
    la $s2, output_string   # loading address of output string

    move $s4, $sp           # loading frame and stack pointer

    j push_loop

push_loop:
    lb $t0, ($s1)           # byte wise loading
    beqz $t0, end_loop      # after reaching the end of the string
    addi $sp, $sp, -1       # going down the stack in level, as per the number of characters
    sb $t0, ($sp)           # string in the stack storing
    addi $s1, $s1, 1        # iterator + 1 in string
    j push_loop             # back to jump loop

end_loop:
    j pop_loop              # after reading go to printing

pop_loop:
    beq $sp, $s4, pop_loop_end  # back to pop loop
    lb $t1, ($sp)               # take back from stack
    addi $sp, $sp, 1            # increase the stack
    sb $t1, ($s2)               # store in output
    addi $s2, $s2, 1            # increase the output
    j pop_loop  

pop_loop_end:
    sb $zero, ($s2)             # null terminate

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 4
    la $a0, output_string
    syscall

    li $v0, 10
    syscall