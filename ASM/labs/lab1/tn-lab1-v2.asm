# COMSC210 - tn-lab1-V2
# Description: 	Lab1: Hello World Program
# Language: 	ASM
# Date: 	1/2023
# Location: 	RWU
# Author: 	T Newman

.data

message:	.asciiz "Hello World 2023!\n" # this is the message we want to print


.text

la $a0, message 	# load the starting address of the message

li $v0, 4		# load the integer 4 into register $v0
syscall			# syscall(4) will print the string

li $v0, 10		# Exit
syscall
