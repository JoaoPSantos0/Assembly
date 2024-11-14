.data
.globl s
.align 4
s: .long 0

.globl nums 
.align 4
nums: .long 65, -105, 111, 34

.text



.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp

    #declarar i = 0
    movl $0, %ecx

    loop:
        cmpl $4, %ecx
        jge after_loop
        
        movq $nums, %rbx
        movl %ecx, %edx
        movl s, %eax
        addl (%rbx), %eax
        movl %eax, s

        
        incl %ecx
        jmp loop
    
    after_loop:


    leave

    ret