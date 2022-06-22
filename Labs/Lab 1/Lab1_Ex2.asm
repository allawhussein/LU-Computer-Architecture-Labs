.data
	Prompt1: .asciiz "Enter Integer 1: "
	Prompt2: .asciiz "Enter Integer 2: "
	Prompt3: .asciiz "Enter Integer 3: "
	Result: .asciiz "The biggest Integer is #: "
	
.text
	li $v0, 4
	la $a0, Prompt1
	syscall
	li $v0, 5
	syscall
	move $v0, $t0
	
	li $v0, 4
	la $a0, Prompt2
	syscall
	li $v0, 5
	syscall
	move $v0, $t1
	
	li $v0, 4
	la $a0, Prompt3
	syscall
	li $v0, 5
	syscall
	move $v0, $t2
	
	bge $t0, $1, t3Bigger
	move $t1, $t3
	j nextComparison
	t3Bigger:
		move $t0, $t3
		j nextComparison
	nextComparison:

	bge $t3, $2, t4Bigger
	move $t4, $t2
	j output
	t4Bigger:
		move $t4, $t3
		j output
	output:
		li $v0, 4
		la $a0, Result
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall
