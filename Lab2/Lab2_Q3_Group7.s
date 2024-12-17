.data

N: 
    .word 10
array: 
    .word 45, 54, 69, 96, 103, 302, 1, 3, 4, 56
newline:
    .asciiz "\n"
space:
    .asciiz " "

.text
.globl main

main:
    la $t0, array       # loading array
    lw $t1, N           # take N
    li $t2, 1           # currlen
    li $t3, 1           # maxlen
    move $t4, $t0       # start of curr (will update overtime)
    move $t5, $t0       # start of max (will update  overtime)

    li $t6, 1           # first element to begin with (subject to change)
    add $t7, $t0, 4     # element next to the first element (subject to change)

loop:                   # want to loop on the array

    beq $t6, $t1, see_last  # if the pointer touches the last element of the array

    lw $t8, 0($t7)      # start from the second element of the array
    lw $t9, -4($t7)     # element previous to the above element
    ble $t8, $t9, reset # a[i] <= a[i-1], no chance to stand, so reset
    j inc_it            # else increase the iterator and move to the next element, meaning a[i] > a[i-1], so go

see_last:
    ble $t2, $t3, print_res     # after coming to last the currlen < maxlen, then just exit and print
    j touch_last

reset:
    move $t4, $t7       # since no chance to stand, you update the starting of curr
    li $t2, 1           # reset currlen to 1, since no chance to stand
    j max_comp          # check if maxlen increases

inc_it:
    add $t2, $t2, 1     # add 1 to the currlen

max_comp:
    ble $t2, $t3, back_to_loop # if currlen < maxlen, wapis go to loop
    j max_up               # formally update maxlen in accordance to currlen

max_up:
    move $t3, $t2               # move currlen to maxlen
    move $t5, $t4               # accordingly change the starting of 

back_to_loop:
    add $t6, $t6, 1             # increment the curr pointer
    add $t7, $t7, 4             # increment the curr pointers, next element
    j loop

print_res:
    add $t7, $t5, $t3         # update t7 with the last index of the continuous inc. subarray
    sll $t7, $t3, 2           # byte wise shift for the ending
    add $t7, $t5, $t7         # update the t7 with last ka address

loop_for_print:
    beq $t5, $t7, print_end

    lw $t8, 0($t5)            # start address

    li $v0, 1                 # print, print, print
    move $a0, $t8
    syscall

    la $a0, space       
    li $v0, 4
    syscall

    add $t5, $t5, 4
    j loop_for_print

print_end:
    la $a0, newline         # print, print, print
    li $v0, 4               
    syscall

    li $v0, 10          
    syscall

touch_last:                 # very much similar to the max_up, does the same but at the last element
    move $t3, $t2
    move $t5, $t4
    j print_res