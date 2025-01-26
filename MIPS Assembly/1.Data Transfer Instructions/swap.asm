.data # load data
.word 7 # or num: .word 7,3
.word 3
.text
.globl main
.ent main
main:
lui $s0, 0x1001 # load data area starting address 0x10010000
lw $s1, 0($s0)
lw $s2, 4($s0)
sw $s2, 0($s0)
sw $s1, 4($s0)
jr $ra
 
 li $v0, 10 # exit Normal Termination
syscall
.end main