.data
    prompt:         .asciiz "Enter the sum of the digits of your roll number: "
    primeMsg:       .asciiz "The number is prime.\n"
    compositeMsg:   .asciiz "The number is composite"
    notPrimeMsg:    .asciiz "The number is neither prime nor composite\n"

.text
.globl main

main:
        # Print the input prompt
        li $v0, 4              # syscall 4: print string
        la $a0, prompt
        syscall

        # Read an integer from the user
        li  $v0, 5              # syscall 5: read integer
        syscall
        move $s0, $v0            # $t0 holds n

        # Handle n <= 2 separately.
        li  $t0, 2        # constant 2 in $t0
        beq $s0, $t0, print_prime
        slt $t1 ,$s0 , $t0 
        bne $t1 , $0 , print_not_prime 

        # For n > 2, check divisibility from 2 to n//2.
        # Compute limit = n / 2.
        div     $s0, $t0            # Divide n by 2.
        mflo    $t2                 # $t2 = n // 2 (quotient)

        # Initialize divisor counter i = 2 in $t0 (already done above)
div_loop:
        # If i > n//2, exit loop and print_prime
        bgt  $t0, $t2, print_prime

        div     $s0, $t0           # Divide n by current divisor i (i.e in $t0)
        mfhi    $t3                # $t3 = remainder

        # If remainder is zero, then i divides n.
        beq     $t3, $zero, print_composite

        # Increment divisor counter i.
        addi    $t0, $t0, 1
        j       div_loop

print_prime:
        # Print prime message.
        li   $v0, 4
        la   $a0, primeMsg
        syscall
        j  end

print_not_prime:
        # Print neihter prime messagen nor composite msg
        li    $v0, 4
        la    $a0, notPrimeMsg
        syscall
        j end

print_composite:
        #print composite message
        li    $v0, 4
        la    $a0, compositeMsg
        syscall

end:
        jr $ra
        .end main
