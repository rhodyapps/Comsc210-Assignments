#################################################################################
#
#         MIPS Assembly Language Programming
#
#         Chapter 5 Exercise 5.1
#         
#         Programmer: Tom Newman
#               Date: 2/2024
#
################################################################################
#
#    Exercise 5.1
#     This is the original version of exercise 5.1 it uses the counter to fill the array
#     Assignment 6 asks that you create an external function to load the array with random numbers

#      Write a MIPS  assembly language program to 
#      find the Sum of the first 100 words of data in 
#      the memory data segment with the label 'chico' 
#      Store the resulting sum in the next memory 
#      location beyond the end of the array chico.

#     Hint:  Pseudocode for Ex 5.1

#      $a0 = &chico;  # & means 'Address of'
#      $t0 = 0;
#    For ($t1= 100;   $t1 > 0;   $t1= $t1- 1)
#       {
#         $t0 = $t0 + Mem($a0);
#         $a0 = $a0 + 4;
#   }
#         Mem($a0) = $t0;        
            
         .data

chico:   .space   400  # reserve 400 bytes in the data space
result:  .word      0  # here is the next available 4 byte word following 'chico'
   
        
              
         .globl   main
         .text    


main: 
      la $a0, chico        # Load address pointer
      li $t0, 0               # Clear sum
      li $t1, 100             # Initialize loop count
 #     Initialize:             jal InitArray

loop: 

######################   Debugging  Code   ############################################
#
       sw $t1, 0($a0)   
#    'uncomment' the above code to store the value of the loop counter into the memory address.
#      This allows you to check that your program is actually reading from memory
#     if you store the value of the loop counter into the memory location
#     then the final value should be the sum that is stored into the location immediately following
#     the array, as dictated by the specification....
#################################################################################


      lw $t2, 0($a0)          # $t2 = Mem(a0)
      add   $t0, $t0, $t2     # $t0 = $t0 + $t2
      addi  $a0, $a0, 4       # Inc. address pointer
      addi  $t1, $t1, -1      # Dec. loop count
      bgtz  $t1, loop         # if ($t1 > 0) branch 
      sw $t0, 0($a0)          # Store the result

       lw $a0,0($a0)
   
       li $v0, 1
       syscall
      
      
      li $v0, 10              # End of program  
      syscall
      
