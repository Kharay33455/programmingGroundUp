# No variables for this program
.section .data

.section .text

# declare global
.global _start
_start:
	pushl 	$2	#push function last argument
	pushl 	$3	# push function first argument
	call 	power	# call the power function, return value of functions are saved in %eax register
	addl 	$8, %esp	# move base pointer by 2 words. A word is 4 Bytes.
	pushl 	%eax	# push current return value to stack
	pushl 	$3	# push new last arguement
	pushl 	$2	# push new first arguement
	call 	power	# call power
	addl 	$8, %esp	# move base pointer
	popl 	%ebx	# bring back first value that was pushed to stack
	addl 	%eax, %ebx	# add both values together, store result in %ebx register
	movl 	$1, %eax	# move 1 into %eax as return value for program termination
	int 	$0x80	#call system interupt
.type power, @function
power:
	pushl	%ebp 		# store current base pointer
	movl 	%esp, %ebp 	# move stack pointer into base register
	movl	8(%ebp), %ebx	# get first param
	movl	12(%ebp), %ecx	# store second param
	subl	$4, %esp	# local storage
	movl	%ebx, -4(%ebp)	# store result
power_start_loop:
	cmpl	$1, %ecx	# compare value in ecx register to 1
	je	end_loop	# if equal, exit program
	movl	-4(%ebp), %eax	# store current result in eax register
	imull	%ebx, %eax	# multiply value in eax with value in ebx and store result in eax register
	movl	%eax, -4(%ebp)	# move the current result from eax register to local storage -4(%ebp) register
	decl	%ecx		# dcrement of value in ecx by 1
	jmp 	power_start_loop#jump back to loop start
end_loop:
	movl	-4(%ebp), %eax	# prepare return value
	movl	%ebp, %esp	# reset pointer
	popl	%ebp		# pop what is on stack into base pointer
	ret
