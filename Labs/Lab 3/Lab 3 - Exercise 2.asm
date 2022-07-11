# Base 10 to Base 2 Converter
# keep divding the number by 2 until zero, push the remainder to some register using bit manipulation

.data
	prompt: .asciiz "Enter you natural number: "

.text
	li $v0 4
	la $a0 prompt
	syscall
	
	li $v0 5
	syscall
	move $t0 $v0
	
	li $t1 512
	toBinary:
	beq $t1 0 endProgram
	and $t2 $t0 $t1
	li $v0 1
	beqz $t2 printZero
	li $a0 1
	syscall
	srl $t1 $t1 1
	j toBinary
	printZero:
	li $a0 0
	syscall
	srl $t1 $t1 1
	j toBinary
	
	endProgram:
	li $v0 10
	syscall