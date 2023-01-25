# Hello World Program - barebones

.data

message:	.asciiz	"hello world 2023\n"

.text

main:

la $a0, message

li $v0, 4
syscall
