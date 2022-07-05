#This program should check if the input is prime or not
#The input is assumed to be always positive

.data
	enterN: .asciiz "Enter you number to check it is prime or not: "
	isPrime: .asciiz "The entered number is prime"
	notPrime: .asciiz "The entered number is not prime"
	
.text
	li $v0 4
	la $a0 enterN
	syscall
	#prompt the user to enter the number
	li $v0 5
	syscall
	move $t0 $v0
	#read the number from the user
	
	sub $t1 $t0 1
	#set $t1 to the value ot $t0(the input) - 1
	
	loop:
	beq $t1 1 printSuccess
	#if $t1 is 1 then we either checked all the numbers below n ($t0) and none of them was a divisor, or the input is 2
	#in both cases the input is prime
	div $t0 $t1
	#perform the division
	mfhi $t2
	#move the remainder to $t2
	beq $t2 0 printFailure
	#if the remainder the now $t2 register, then we found a remainder thus not prime
	sub $t1 $t1 1
	#substract 1 from $t1 to check the next number if it is divisor of input at $t0 or not
	j loop
	
	printSuccess:
	li $v0 4
	la $a0 isPrime
	syscall
	j terminateProgram
	#print the success message on the screen
	
	printFailure:
	li $v0 4
	la $a0 notPrime
	syscall
	j terminateProgram #this statement is not needed but keep it
	#print the failure message on the screen
	
	terminateProgram:
	li $v0 10
	syscall