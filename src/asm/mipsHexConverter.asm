# 
# Program Name:  Hex Converter
# Programmer:    Tom Newman
# Date:          10/26/2016
#
# COMSC210 Computer Organization and Lab RWU

# This program converts numbers to hex

.data 
	prompt1: 	.asciiz "\nEnter a Decimal Number: "
	resultmsg:	.asciiz " Hexadecimal is "
      	result:	.space 8
# 

.text
   main:

########### Register Usage in main #############
# 
#
#	t0 - count for 8 digits in word
#	t1 - each hex digit in turn
#	t2 - number read in
#	t3 - address of area used to set up
#	     answer string
#

#################################################

	jal GetDecimal
	jal Convert
	jal DisplayResult
	j Exit
	
GetDecimal: 

	la $a0,prompt1	# print prompt on terminal
	li $v0,4
	syscall
	
	li $v0, 5       # calling the console input function to 
        syscall         # get the decimal to convert 
	move $t2, $v0

	la $a0,resultmsg	# print result message
	li $v0,4
	syscall

	jr $ra
	
Convert:

	li $t0,8	# eight hex digits in word
	la $t3,result	# answer string set up here
	
	


outerloop:
	rol $t2,$t2,4		# start with leftmost digit
	and $t1,$t2,0xf		# mask one digit
	ble $t1,9,saveHexDigit	# check IF 0 to 9 if 0 to 9 save ascii value for Hex Digit
	add $t1,$t1,7		# ELSE Look at ASCII table, there are 7 chars between '9' and 'A'
				# so you need to add 7 to the ASCII value in t1
				# then save ascii value for Hex Digit

saveHexDigit:
	add $t1,$t1,48		# ASCII '0' is 48 hence 48 is the base that we work from
	sb $t1,($t3)		# save ascii character in string
	add $t3,$t3,1		# advance the pointer to string position
	add $t0,$t0,-1		# decrement the main loop counter
	bnez $t0,outerloop	# and continue if counter>0
	
	jr $ra
	
DisplayResult:
	
	la $a0,result	# print result on terminal
	li $v0,4
	syscall

	jr $ra
	

Exit:   li $v0,10
	syscall		# later...

## End of Program ###
