#This program should calculate n!

.data
	n: .word 0 #I don't know why I need to initialize n to zero, but other wise n and the next label (in this case n) will have the same memeory address
	ans: .word 1
	enterN: .asciiz "Enter a value n to get its factorial: "
	ansIs: .asciiz "The factorial is: "

.text
	li $v0 4
	la $a0 enterN
	syscall
	#prompt the user to enter n
	
	li $v0 5
	syscall
	sw $v0 n
	#read the value n from the user
	
	factorialLoop:
	lw $t0 ans
	lw $t1 n
	#load contents of ans and n into t0 and t1 respectively
	mul $t0 $t0 $t1
	#multiply t1 and t0 and put the result in t0, this is equivelant to ans = ans * n
	sub $t1 $t1 1
	#substract 1 from t1 and put the answer into t1, this is equivelant to n = n - 1
	sw $t0 ans
	sw $t1 n
	#store the newly operated on $t0 and $t1 into ans and n respectively
	beq $t1 1 printFactorial
	#jump to printing the factorial if $t1 (effectively n) is 1
	j factorialLoop
	#the looping statement
	
	printFactorial:
	li $v0 4
	la $a0 ansIs
	syscall
	#print the boilerplate of factorial answer
	li $v0 1
	lw $a0 ans
	syscall
	#print the answer
	
	li $v0 10
	syscall
	#exit the program