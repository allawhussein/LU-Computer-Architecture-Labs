#This program recieves two integers from the user
#Calculate the sum of odd numbers in both of them
#Check if this sum is prime or not
#The eneterd numbers are assumed to be positive and have the same number of digits
#The program is not complete, and needs a ton of debugging.
.data
	enterN: .asciiz "Enter you two numbers to check if the sum of their odd digits is prime or not: "
	isPrime: .asciiz "The sum of odds is prime"
	notPrime: .asciiz "The sum of odds is not prime"
	
.text
	li $v0 4
	la $a0 enterN
	syscall
	#prompt the user to enter the numbers
	li $v0 5
	syscall
	move $t4 $v0
	syscall
	move $t5 $v0
	#read the numbers from the user
	
	li $s0 0
	li $s1 10
	li $s2 2
	oddCollectionLoop:
	div $t4 $s1
	mfhi $t6
	mflo $t4
	div $t6 $s2
	mfhi $t7
	beq $t7 0 skipEvenDigit
	add $s0 $s0 $t6
	skipEvenDigit:
	div $t5 $s1
	mfhi $t6
	mflo $t5
	div $t6 $s2
	mfhi $t7
	beq $t7 0 skipSecondEvenDigit
	add $s0 $s0 $t6
	skipSecondEvenDigit:
	#divide both numbers by 10, the remainder will be the coefficint to get if odd, and the quotient will be the remaining digits
	beq $t4 0 primeProcedureSetup
	j oddCollectionLoop
	
	primeProcedureSetup:
	sub $t1 $t0 1
	#set $t1 to the value ot $t0(the input) - 1
	
	primeLoop:
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
	j primeLoop
	
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