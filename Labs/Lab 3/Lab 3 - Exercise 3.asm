# Reverses the content of numerical array inputed by user

.data
	arraySizePrompt: .asciiz "Enter the size of your array: "
	arrayIntegersPrompt: .asciiz "Enter the integers of your array"
	arraySizeErrorPrompt: .asciiz "The size you entered is out of boundaries, "
	arraySize: .word 0

.text
	#get the size of the array
	j getArraySize
	reGetArraySize:# display re-input message in case of outbount input
	li $v0 4
	la $a0 arraySizeErrorPrompt
	syscall
	
	getArraySize:# prompt the user to enter the size of the array
	li $v0 4
	la $a0 arraySizePrompt
	syscall
	
	li $v0 5
	syscall 
	bgt $v0 50 reGetArraySize # condition to re-take the input if out of bound
	ble $v0 0 reGetArraySize # same as the above
	
	sw $v0 arraySize # saving the array size into a word label
	
	# declare the dynamic array of size [1:50]
	move $v0 $t0
	li $v0 9 #set system calling mode to memory allocation
	mul $a0 $v0 4 #bytes = number of words * 4
	syscall #allocate they required bytes
	move $t0 $v0 #secure the address of the bytes
	
	lw $t1 arraySize# load array size into $t1
	arrayinputLoop:
	beq $t1 0 endArrayInputLoop # check if N-i ($t1) is zero of or not
	sub $t1 $t1 1 # N--
	li $v0 5 # set kernal operation to integer input
	syscall
	add $t2 $t0 $t1 # $t2 = allocated memory bank + N - i
	move ($t2) $v0 # move the integer input into allocated memeory space
	endArrayInputLoop:
	
	lw $t1 arraySize # $t1 represents index starting at array size
	div $t3 $t1 2 # $t2 represent array size / 2
	li $t2 0 # $t3 represents index 0
	reversingLoop:
	beq $t1 0 endReversingLoop
	add $t4 $t0 $t2 # get into $t4 address + i index
	add $t5 $t0 $t1 # get into $t5 address + N - i index
	move $t6 ($t4) #swap block
	move ($t4) ($t5)
	move ($t4) $t6
	sub $t1 $t1 1
	add $t2 $t2 1
	endReversingLoop:
	li $v0 10 # end the program
	syscall