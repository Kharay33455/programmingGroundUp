#PURPOSE: Findind the maximum value amongst a group of numbers
#
#VARIABLES: This registers are serving the following function:
#
#	%edi - Holds the index of the data currently being examined
#	%ebx - Holds the value of the largest data found so far
#	%eax - Current data item being examined
#
#The following location in memory are used
#
#data_items - contains the item  data. A 0 is used to terminate the data
#

.section .data

data_items:
	.long 3,67,34,222,34,65,34,54,65,98,35,200,0 #These are our data items

.section .text

.global _start

_start:
	movl $0, %edi
	movl data_items(, %edi, 4) , %eax
	movl %eax, %ebx
	cmpl $0, %ebx
	je loop_exit

start_loop:
	incl %edi
	movl data_items(, %edi, 4), %eax
	cmpl $0, %eax
	je loop_exit
	cmpl %eax, %ebx
	jg start_loop
	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
