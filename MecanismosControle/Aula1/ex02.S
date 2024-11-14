.section .rodata



.data

.globl a
.align 4
a: .long 1

.globl b
.align 8
b: .quad 2



.text

.globl ex02

ex02:

   pushq %rbp

   movq  %rsp, %rbp


    movl a, %eax
    test %eax, %eax
    jz final

    movq b, %rbx
    cmp $5, %rbx
    jge else
    
    #b = (a << 1) + (a * b);
    movl a, %eax
    movl a, %ecx
    shl $1, %eax
    movslq %ecx, %rcx
    imul %rcx, %rbx
    movslq %eax, %rax
    addq %rax, %rbx
    movq %rbx, b

    else:

    movq b, %rbx
    xorq $0x1FL, %rbx
    movl %ebx, a

    
    final:


   leave

   ret