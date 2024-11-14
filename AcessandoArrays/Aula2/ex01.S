.data

.globl vet
.align 2
vet: .short 50,10,67,42

.globl max
.align 2
max: .short 0

.text


.globl ex01

ex01:

    pushq %rbp

    movq %rsp, %rbp

    movb $0, %al 

    loop:
    cmpb $4, %al
    jge after_loop

    #pegar o vet[i]
    movq $vet, %rcx
    movsbq %al, %r8
    imulq $2, %r8
    addq %rcx, %r8 # &vet[i]
    movw (%r8), %dx # r9 = vet[i]


    cmpw max, %dx
    jle after02

    movw %dx, max 

    after02:


    #upgrades
    incb %al
    jmp loop

    after_loop:


    leave

    ret
