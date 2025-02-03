.data
    prompt:  .asciiz "Enter the sum of the digits of your roll number: "
    resultMsg:   .asciiz "\nThe factorial is: "
        
.text
.globl main

main:
        # Print the input prompt
        li      $v0, 4            # syscall code 4 is print string
        la      $a0, prompt
        syscall

        # Read an integer from the user
        li      $v0, 5            # syscall code 5 is read integer
        syscall
        move    $t0, $v0          # $t0 holds n (the sum of digits of ROLL_NO)

        # Initialize factorial result to 1
        addi $s0 , $0 , 1            # $s0 will hold factorial = 1

factorial_loop:
        slti $t1 , $t0 , 1
        bne $t1,$0,print_result

        # Multiply factorial by counter: factorial = factorial * counter
        mul  $s0, $s0, $t0

        # Decrement the counter by 1
        addi  $t0, $t0, -1
        j  factorial_loop

print_result:
        # Print the result message
        li      $v0, 4
        la      $a0, resultMsg
        syscall

        # Print the factorial result
        li      $v0, 1            # syscall code 1 is print integer
        move    $a0, $s0
        syscall

        jr $ra
        .end main
