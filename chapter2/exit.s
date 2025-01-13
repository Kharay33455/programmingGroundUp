#PURPOSE: Simple program that exits and returns a status code to the linux   kernel
#
#INPUT: none

#OUTPUT: returns a status code. This can be views by typing  echo $? after running the rogram

#VARIABLES: 
#	%eax holds the system call number
#	%ebx holds the return status

.section .data

.section .text

.global _start

_start:
	movl $1, %eax # linux kernek command for exiting a program

	movl $0, %ebx # this is the status number that would be reeturned to the os

	int $0x80 # this wakes up the kernel to run the program
