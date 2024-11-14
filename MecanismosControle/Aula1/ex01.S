.section .rodata



.data

.globl a
.align 4
a: .long 30

.globl b
.align 4
b: .long 45

.globl c
.align 4
c: .long -60

.globl d
.align 4
d: .long 25 

.text

.globl ex01

ex01:

   pushq %rbp

   movq  %rsp, %rbp

    movl a, %eax
    movl b, %ebx


   cmp %ebx, %eax
   jle depois_if

    movl c, %ecx
    neg %ecx
    movl %ecx, c

    depois_if:

    cmp %ebx, %eax
    jge depois_loop
    movl c, %ecx
    addl %eax, %ebx
    imul %ebx, %ecx
    movl %ecx, c

    movl d, %edx
    movl $1024, %edx
    movl %edx, d

    depois_loop:

   leave

   ret