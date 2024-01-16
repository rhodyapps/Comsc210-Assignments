# 
# Program Name:  ADD Even Numbers to a Limit Value Using Subroutines
# Programmer:    Tom Newman
# Date:          9/2016
#
# 
# COMSC210 Computer Organization and Lab RWU

# First We need a prompt for the end user and a message announcing the result

.data 
	prompt1: .asciiz "\nEnter a Number: "

        result:  .asciiz "\nThe Sum of the Even Numbers from 1 to N is: "

######################### Main Program ##############################################

.text
   main:

      input:            jal GetUserInput
      init:             jal InitializeCounters
      add_even:         jal LoopAndAdd
      display_results:  jal DisplayResults
      end_exit:         jal EndAndExit

  

######### End of Main Program #######################################################    


########  SubRoutines ###############################################################

################  Subroutine 1       ################################################
# Get User Input Subroutine
#    - This subroutine obtains the number entered by the user that will be the limit used
#      in the main loop
#

GetUserInput:
    li $v0, 4                    # Prompting the user for an integer > 100
    la $a0, prompt1
    syscall
        
    li $v0, 5                    # calling the console input function to 
    syscall                      # get the limit integer

    move $t7, $v0                # Using register $t7 to hold the limit value
    
    jr $ra                       # Return from Subroutine
################  Subroutine 2 ########################################################
# InitializeCounters:
#                Initialize the registers that will be used by the program
#

InitializeCounters:
		
    li      $t0, 0               # $t0 = loop counter
    li      $t1, 0               # $t1 = sum of even numbers
    jr $ra

################  Subroutine 3  #######################################################
#  LoopAndAdd:
#         - This subroutine contains the loop that adds the numbers
# 
#######################################################################################

LoopAndAdd:

loop:
 #  blez $t7, done		# v3:  This checks the loop variable before incrementing the 
   				# v3:  counter and total 
   
   addi    $t0, $t0, 2        #  generating the even numbers in $t0
   add    $t1, $t1, $t0       #  compute the sum and save in $t1
     
    bne     $t0, $t7, loop     # v1:  if t0 reached limit ($t7) then go to loop.
    				# v1:  This code worked when we had an even number hardcoded limit
    				# v1:  This has problems...what happens if they put in an odd number?
    				
# bge $t0,$t7, done		# v2:  Here is one way to handle branching out of a loop
#  b loop			# v2:  if we don't know whether the user will enter odd or even
# sub  $t7,$t7,2             	# v2:  numbers
# bgez $t7, loop
   
  #  sub  $t7,$t7,2   		# v3: this version subtracts 2 from the initial value
  #  bgez $t7, loop		# v3:  and keeps looping until the value is less than 0
    				# v3:  this ensure that if the user enters a negative number
    				# v3:  the program will loop the correct number of times
    				# v3:  without crashing...
    				#v3: this version requires a check before incrementing totals
    
done:    jr $ra

#   END OF LOOP

############## Subroutine 4 ############################################################
#  DisplayResults
#            - This subroutine will display the results
#

DisplayResults:
#   Display the FINAL Result as accumulated in Register $t1

    li      $v0, 4
    la      $a0, result
    syscall                      # print out result message

    li      $v0, 1
    move    $a0, $t1
    syscall                      # print out actual sum
    jr $ra
    
############## Subroutine 5 ############################################################
#  EndAndExit
#            - This subroutine will terminate the program
#

EndAndExit:
    li      $v0, 10              # terminate program run and
    syscall                      # Exit 
