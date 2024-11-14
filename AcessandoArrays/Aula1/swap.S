.data

.globl last
.align 8
last: .quad 0

.globl values
.align 8
values: .quad 50,-10,60,-20,70


.text



.globl swap

swap:

    pushq %rbp

    movq  %rsp, %rbp

    #declarar i
    movl $0, %eax

    #declarar j = 4
    movl $4, %ecx

    loop: 
        cmpl %ecx, %eax
        jge after

        #long tmp = values[i];
        movq $values, %r11
        movslq %eax, %rdx
        imulq $8, %rdx
        addq %r11, %rdx
        movq (%rdx),%r8

        #values[i] = values[j];
        movq $values, %r11
        movslq %ecx, %rdx
        imulq $8, %rdx
        addq %r11, %rdx
        movq (%rdx), %r10  # r10 -> values[j] descobriu o values[j]
        
        movq $values, %rdi 
        movslq %eax, %rsi
        imulq $8, %rsi
        addq %rdi, %rsi
        movq %r10, (%rsi) # values[i]= values[j]


        #values[j] = tmp;

        movq $values, %r9
        movslq %ecx, %r11
        imulq $8, %r11
        addq %r9, %r11 #values[j]
        movq %r8, (%r11)

        #updates
        incl %eax
        decl %ecx



        jmp loop
    after:

    movq $values, %rsi
    movq 32(%rsi), %rdi 
    movq %rdi, last
    

    



    leave

    ret