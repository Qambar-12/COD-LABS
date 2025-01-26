#MIPS assembly program that takes user's first name and age as input and displays a welcome msg
.data

msg1: .asciiz "Enter your name: "
msg2: .asciiz "\nEnter your age: "
msg3: .asciiz "\n****Welcome "
msg4: .asciiz "! You are "
msg5: .asciiz " years old now. Stay Blessed****"
buffer: .space 30

.text
.globl main
.ent main

main:

li $v0, 4 # preparing for string display  (Enter your name: )
la $a0, msg1
syscall # msg1 will be displayed on console

li $v0, 8
la $a0, buffer		#.space => <n> bytes of uninitialized memory

li $a1, 30		#$a1 = length of string buffer (n)
syscall
move $t0, $a0

li $v0, 4 # preparing for string display  #(Enter your age: )
la $a0, msg2
syscall # msg2 will be displayed on console

li $v0, 5
syscall
move $t1, $v0 

li $v0, 4 # preparing for string display   (****Welcome )
la $a0, msg3
syscall # msg3 will be displayed on console

li $v0, 4 # preparing for string display
move $a0, $t0
syscall # name will be displayed on console	#(Moving the contents of $t0 into $a0 so that syscall can read and display contents )

li $v0, 4 # preparing for string display  #(your are)
la $a0, msg4
syscall # msg4 will be displayed on console

li $v0, 1
move $a0, $t1	#(printing the age after moving contents of $t1 into $a0)
syscall

li $v0, 4 # preparing for string display  #(years old now.Stay Blessed****)
la $a0, msg5
syscall # msg5 will be displayed on console

jr $ra
.end main