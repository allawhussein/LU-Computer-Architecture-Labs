# write a program that perform the multiplication of two postive integers using the addition

.data
	prompt: .asciiz "Enter two numbers to have them multiplied"

.text
	#propmpt the user
	li $v0 4
	la $a0 prompt
	syscall
	
	#read the user input 1
	li $v0 5
	syscall
	
	#move user input 1 into $t0
	move $t0 $v0
	
	#read the user input 2
	li $v0 5
	syscall
	
	#move user input 2 into $t1
	move $t1 $v0
	
	#initialize result holder
	li $t2 0
	#check if the second operand is zero or not
	beq $t1 0 printResult
	
	multiplication:
	#add $t0 to $t2 $t1 times
	add $t2 $t2 $t0
	sub $t1 $t1 1
	beq $t1 0 printResult
	j multiplication
	
	printResult:
	li $v0 1
	move $a0 $t2
	syscall
	
	#terminate the program
	li $v0 10
	syscall