
.data

.globl v1
.align 2
v1: .short 1,2

.globl v2
.align 8
v2: .quad 1,2,3


.text

.globl aux

aux:

pushq %rbp

movq %rsp, %rbp

subq $32, %rsp #tudo que passa na funçao é salvo, a1,p1,i -> 32

# void aux(short *a1, int p1)

movl $2, %ecx

while:

cmpl $0, %ecx
jl jump_for

movq %rdi, -8(%rbp)
movq %rsi,-16(%rbp)
movq %rcx, -24(%rbp)

movq $v2, %rdx
call sum 

movq -8(%rbp),%rdi
movq -16(%rbp), %rsi
movq -24(%rbp),%rcx

decq %rcx


jmp while
jump_for:

leave

ret


.globl main

main:


pushq %rbp

movq %rsp, %rbp

subq $16, %rsp

movl $0, %ecx

while2:

cmpl $2, %ecx
jge after

movq %rsi, -8(%rbp) #quando a variavel é global eu nao preciso salvar


movq $v1, %rdi
movl %ecx, %esi

call aux

movq -8(%rbp),%rsi

incl %ecx
jmp while2
after:



leave
ret