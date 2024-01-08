# Comsc210 Assignment 1 Hello World

# Programmer: T Newman
# Date:       1/8/24

.data

message: .asciiz "Hello world 2024"

.text

la $a0, message
li $v0, 4
syscall
