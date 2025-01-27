#Program takes input of two roll no. and displays the product
.data

msg1: .asciiz "Enter your roll number: "
msg2: .asciiz "Enter your friend's roll number: "
msg3: .asciiz "Product is: "

.text
.globl main
.ent main

main:

li $v0, 4           # preparing for string display
la $a0, msg1
syscall             # msg1 will be displayed on console

li $v0, 5           # preparing for integer input
syscall             # first integer was put in $v0
move $s0, $v0       # first integer is moved to $t0

li $v0, 4           # preparing for string display
la $a0, msg2
syscall             # msg2 will be displayed on console

li $v0, 5           # preparing for integer input
syscall             # first integer was put in $v0
move $s1, $v0       # first integer is moved to $t1

mult $s0, $s1
mflo $s2
mfhi $s3

li $v0, 4           # preparing for string display
la $a0, msg3
syscall             # msg3 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $s2       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main
