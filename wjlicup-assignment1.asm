#Individually done by William Licup
#CS 2640.01
#October 29, 2023
#Write a program in assembly that performs three  tasks
#1) Task 1: User Input and Output
#2) Task 2: Arithmetic Operation Practice
#3) Task 3: Conditions

.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "

show1: .asciiz "The first integer: "
show2: .asciiz "\nThe second integer: "

showAdd: .asciiz "\nThe first integer added to the second integer: "
showSub: .asciiz "\nThe first integer subtracted by the second integer: "
showMul: .asciiz "\nThe first integer multiplied by the second integer: "
showDiv: .asciiz "\nThe first integer divided by second integer: "

equalNums: .asciiz "\nUser inputs are the same"
notEqual: .asciiz "\nUser inputs are different"

.text
#Task 1
main:
	#create a prpmpt to have the user input the first int
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#get the first int from the user
	li $v0, 5
	syscall
	move $s0, $v0
	
	#create prompt to have second int
	li $v0, 4
	la $a0, prompt2
	syscall
	
	#get the second  int from the user
	li $v0,  5
	syscall
	move $s1, $v0
	
	#show the first int
	li $v0, 4
	la $a0, show1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	#show the second int
	li $v0, 4
	la $a0, show2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
#Task 2
	#add & showcase
	add $s2,$s0,$s1
	li $v0, 4
	la $a0, showAdd
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall

	#subtract & showcase
	sub $s3,$s0,$s1
	li $v0, 4
	la $a0, showSub
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall		

	#mul & showcase
	mul $s4,$s0,$s1
	li $v0, 4
	la $a0, showMul
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall

	#div & showcase
	div $s5,$s0,$s1
	li $v0, 4
	la $a0, showDiv
	syscall
	
	li $v0, 1
	move $a0, $s5
	syscall						
	
#Task 3
	#find if equal
	beq $s0,$s1,exactlyEqual
	
	#if not equal
	li $v0, 4
	la $a0, notEqual
	syscall
	j exit
	

exactlyEqual:
	#if equal nums
	li $v0, 4
	la $a0, equalNums
	syscall
	j exit

exit:	
	#create an exit program syscall
	li $v0, 10
	syscall