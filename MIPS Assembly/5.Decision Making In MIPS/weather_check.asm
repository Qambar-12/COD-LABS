#program that prints relevant msg according to temperature
.data

msg1: .asciiz "Enter temperature of the day:  "
msg2: .asciiz "It is hot today"
msg3: .asciiz "Pleasant weather"
msg4: .asciiz "It is cold today"

.text
.globl main
.ent main

main:

    li $v0, 4                       # preparing for string display
    la $a0, msg1
    syscall                         # msg1 will be displayed on console

    li $v0, 5                       # preparing for integer input
    syscall                         # first integer was put in $v0
    move $s0, $v0                   # first integer is moved to $s0; $s0 input temperature

    li $s1, 30
    bgt $s0 ,$s1 , HOT

    li $s1 , 20
    bgt $s0 ,$s1 , PLEASANT

COLD:
    li $v0, 4                       # preparing for string display
    la $a0, msg4
    syscall  
    j end  
    
PLEASANT:
    li $v0, 4                       # preparing for string display
    la $a0, msg3
    syscall  
    j end  

HOT:
    li $v0, 4                       # preparing for string display
    la $a0, msg2
    syscall    
end:
    jr $ra
.end main