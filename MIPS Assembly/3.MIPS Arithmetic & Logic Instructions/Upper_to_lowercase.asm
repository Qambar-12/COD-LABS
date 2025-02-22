#Program that takes uppercase letter and gives its corresponding lowercase letter
.data

msg1: .asciiz "Enter an uppercase alphabet followed by enter: "
msg2: .asciiz "\nLowercase:  "

.text
.globl main
.ent main

main:

li $v0, 4           # preparing for string display
la $a0, msg1
syscall             # msg1 will be displayed on console

li $v0, 12          #read character
syscall
move $t0, $v0

ori $t0, $t0, 32   #a const difference of 32 in ASCII value for each letter

li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

li $v0, 11            # preparing for character output
move $a0, $t0       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main