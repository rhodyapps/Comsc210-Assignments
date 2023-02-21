# COMSC210 
# Description: 	Lab1: Hello World Program - Using Function Call
# Language: 	ASM
# Date: 	2/2023
# Location: 	RWU
# Author: 	T Newman

.data

prompt: 	.asciiz "Please enter your message: "  # Ask the user to enter a string

message:  	.space 128			# allocate 128 byte array to hold 256 characters

.text

Main: 				# this is the main calling function
	jal InputMessage
	jal PrintMessage
	jal Exit


##########################  Functions ##########################################

########################## Input Function ######################

InputMessage:			# this is a 'called' function to get the input string
		
	# Prompt the user to enter a message

    	li      $v0, 4     	# load the value 4 into register $v0
    				# syscall(4) is print a string
   	la      $a0, prompt    	# 
       	syscall             	#
    
    	li      $v0, 8     	# Load the value 8 into register $v0
                       		# syscall 8 is Read a String               
    	la      $a0, message 	#
    	li      $a1, 256        # 
    	syscall             	# => read a string with max. 256 chars
    
	jr $ra			# jump return to the calling function

######################### Print Function #######################################

PrintMessage:			# this is a 'called' function to print the string
	
	la $a0, message 	# load the starting address of the message string
	li $v0, 4		# load the integer 4 into register $v0
	syscall			# syscall(4) will print the string
	jr $ra

####################### Exit Function ##########################################

Exit: 				# this is a 'called' function to exit the program
	li $v0, 10		# Exit
	syscall
	
