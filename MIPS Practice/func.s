.data

message:
    .asciiz "Hi, My name is Omkar\n"
message2:
    .asciiz "Kinda fun\n"

.text
.globl main
# functions are called procedure in MIPS

main:
    jal display_mess # jump and link,  
    
    # to tell the system that program is done
    li $v0, 10
    syscall

display_mess:
    li $v0, 4
    la $a0, message
    syscall

    li $v0, 4
    la $a0, message2
    syscall

    jr $ra  # using this it goes back to the caller