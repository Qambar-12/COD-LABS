#Program takes input roll_no as dividend 
#Dividend = (Divisor*quotient) + remainder
.data

msg1: .asciiz "Enter Dividend: "
msg2: .asciiz "Enter Divisor: "
msg3: .asciiz "Quotient is: "
msg4: .asciiz " and Remainder is: "

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

div $s0, $s1   	    # divides $s0 by $s1 and stores the remainder in Hi and Quotient in Lo Regiters
mflo $s2	    # moves quotient from Lo register to $s2
mfhi $s3	    # moves remainder from Hi register to $s3

li $v0, 4           # preparing for string display
la $a0, msg3
syscall             # msg3 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $s2       # result is moved to $a0
syscall             # result is displayed on console

li $v0, 4           # preparing for string display
la $a0, msg4
syscall             # msg4 will be displayed on console

li $v0, 1           # preparing for integer output
move $a0, $s3       # result is moved to $a0
syscall             # result is displayed on console

jr $ra
.end main
