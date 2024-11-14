.data
.globl c
.align 1
c: .byte -20

.globl i
.align 4
i: .long -256

.globl j
.align 4
j: .long 512

.globl l
.align 8
l: .quad 128

.globl us
.align 2
us: .short 111

.globl ui
.align 4
ui: .long 1024

.globl ul
.align 8
ul: .quad 2048

.text



.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp



    # Se necessário, usar apenas os registradores (ou suas variações) abaixo:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11


    movl $68000, j
    movq $4096, l
    movl j, %eax
    movl %eax, i

    movl i, %eax
    addl $10, %eax
    subl $5, %eax

    movl %eax, j

    movl i, %eax
    movl j, %ebx
    imul $2, %eax
    addl $5, %ebx
    subl %ebx, %eax

    movl %eax, i

    #cast

    movl i, %eax
    movl %eax, ui
    movsbl c, %eax
    movl %eax, j

    movl ui, %eax
    movq %rax, ul

    movl i, %eax
    add j, %eax
    movb %al, c

    movq $l, %rbx
    movq $128,(%rbx)

    movq $i, %rbx
    movl j, %eax
    addl (%rbx),%eax 
    movl %eax, j


    # Seu código aqui...



    leave

    ret