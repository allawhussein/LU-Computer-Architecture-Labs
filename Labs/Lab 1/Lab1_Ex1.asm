.data
	Prompt1: .asciiz "Enter Triangle Angle 1: "
	Prompt2: .asciiz "Enter Triangle Angle 2: "
	Prompt3: .asciiz "Enter Triangle Angle 3: "
	validPrompt: .asciiz "Valid Triangle"
	invalidPrompt: .asciiz "Invalid Traingle"

.text
	li $v0, 4
	la $a0, Prompt1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, Prompt2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, Prompt3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	
	add $t3, $t0, $t1
	add $t3, $t3, $t2
	
	beq $t3, 180, printValid
	
	li $v0, 4
	la $a0, invalidPrompt
	syscall
	
	j End
	
	printValid:
		li $v0, 4
		la $a0, validPrompt
		syscall
		
	End: