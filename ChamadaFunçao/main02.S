.section .rodata

str: .string "v = %u, l = %d, b = %ld, r = %ld\n"

.data

.globl i
.align 4
i: .long 0

.globl bias
.align 8
bias: .quad 256

.globl vet
vet: .byte 12,3,20,8

.text


.globl main

main:
pushq %rbp

movq %rsp, %rbp

#for (i = 0; i < LEN; i++) LEN = 4

movl $0, i

loop:

cmpl $4, i
jge jump_loop

movq $vet, %r9
movslq i, %r10
addq %r9, %r10 # vet[i]
movb (%r10), %r11b #r11=vet[i]

movb %r11b,%dil 
movw $10, %si
movq bias, %rdx
call filtro
movq %rax, bias


incq i
jmp loop
jump_loop:

movq $0, %rax

leave

ret