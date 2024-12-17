.data

prompt1:    .asciiz     "Enter a string : "
prompt2:    .asciiz     "Reversed String is : "
inp_str:    .space      100
out_str:    .space      100

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 8
    la $a0, inp_str
    syscall

    la $s0, inp_str
    la $s1, out_str

    move $s5, $sp

    j in_stack

in_stack:
    lb $t0, ($s0)
    beqz $t0, out_stack
    addi $sp, $sp, -1
    sb $t0, ($sp)
    addi $s0, $s0, 1
    j in_stack

out_stack:
    beq $sp, $s5, print_and_end
    lb $t1, ($sp)
    addi $sp, $sp, 1
    sb $t1, ($s1)
    addi $s1, $s1, 1
    j out_stack

print_and_end:
    sb $zero, 0($s1)

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 4
    la $a0, out_str
    syscall

    li $v0, 10
    syscall