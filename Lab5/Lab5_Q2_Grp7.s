.data
newline:    .asciiz "\n"
space:      .asciiz " "
row_ip:     .asciiz "Enter number of Rows: "
col_ip:     .asciiz "Enter number of Columns: "
numA:       .asciiz "Enter the value of A: "
numB:       .asciiz "Enter the value of B: "
trans:      .asciiz "Transpose is:"
startaddr:  .word 0

.text
main: 
    li $v0, 4
    la $a0, row_ip
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, col_ip
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    li $v0, 4
    la $a0, numA
    syscall

    li $v0, 5
    syscall
    move $s2, $v0

    li $v0, 4
    la $a0, numB
    syscall

    li $v0, 5
    syscall
    move $s3, $v0

    addi $t1, $zero, 4
    mul $t0, $s0, $s1
    mul $t0, $t0, $t1

    li $v0, 9
    move $a0, $t0
    syscall
    sw $v0, startaddr

    lw $s4, startaddr
    move $s5, $zero

    move $t1, $zero # i
    move $t2, $zero # j
    addi $t7, $zero, 1
    addi $t3, $zero, 1 # alternates 1 and -1
    addi $t9, $zero, 1 # to store powers of b

    jal populateMatrix

    jal printMatrix

    jal printTranspose

    li $v0, 10
    syscall

populateMatrix:
    bge $t1, $s0, returnPopulate
    j populateRow

populateRow:
    bge $t2, $s1, updateIdx
    add $t6, $t1, $t2
    andi $t6, $t6, 1
    beqz $t6, posVal
    j negVal 
    
posVal:
    mul $t6, $t7, $t9
    add $t4, $s4, $s5
    sw $t6, 0($t4)
    j continuePopulate

negVal:
    mul $t6, $t7, $t9
    neg $t6, $t6
    add $t4, $s4, $s5
    sw $t6, 0($t4)

continuePopulate:
    mul $t9, $t9, $s3
    addi $s5, $s5, 4
    addi $t2, $t2, 1
    j populateRow

updateIdx:
    move $t2, $zero
    addi $t1, $t1, 1
    mul $t7, $t7, $s2
    addi $t9, $zero, 1
    j populateMatrix

returnPopulate:
    jr $ra

printMatrix:
    move $t1, $zero
    move $s5, $zero
    j printRow

printRow:
    bge $t1, $s0, returnPrint
    move $t2, $zero
    j printCol

printCol:
    bge $t2, $s1, endPrintRow
    add $t6, $s4, $s5
    li $v0, 1
    lw $a0, 0($t6)
    syscall
    li $v0, 4
    la $a0, space
    syscall
    addi $t2, $t2, 1
    addi $s5, $s5, 4
    j printCol

endPrintRow:
    li $v0, 4
    la $a0, newline
    syscall
    addi $t1, $t1, 1
    j printRow

returnPrint:
    jr $ra

printTranspose:
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 4
    la $a0, trans
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $t1, 0       # column counter for transposed matrix (i)
    li $t2, 0       # row counter for transposed matrix (j)
    li $t7, 4       # size of each element (4 bytes)

transpose_print_matrix:
    beq $t1, $s1, returnTranspose
    li $t2, 0
    j transpose_loop

transpose_loop:
    beq $t2, $s0, transpose_next_col
    
    mul $t5, $t2, $s1
    add $t5, $t5, $t1
    mul $t5, $t5, $t7
    add $t5, $s4, $t5

    li $v0, 1
    lw $a0, 0($t5)
    syscall
    
    li $v0, 4
    la $a0, space
    syscall

    addi $t2, $t2, 1
    j transpose_loop

transpose_next_col:
    li $v0, 4
    la $a0, newline
    syscall
    
    addi $t1, $t1, 1
    j transpose_print_matrix

returnTranspose:
    jr $ra