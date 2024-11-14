.section .rodata

fmt: .string "%d: sum = %ld\n"

fmt2: .string "retorno = %ld\n"

.data

.globl v
.align 2
v: .short 1,2,3,4,5

.globl max
.align 2
max: .short 0


.text   

.globl calc

#long calc(short *vet, int size, int factor, short *max, char option)
calc:

pushq %rbp

movq %rsp, %rbp

subq $32, %rbp

movw $0, %r12w #value
movl $0, %r13d #i
movq $0, %r14 #sum

begin_loop:
cmpl %esi, %r13d
jge end_loop

movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)

movq %rdi, %r10
imulw $2, %r13w
addq %r13, %r10 #aqui esta vet[i]

movq %r10, %rcx

cmpw %si, (%rcx)
jge jump_if

movw %si, (%rcx)


jump_if:

movq $fmt, %rdi
movl %r13d, %ecx
imulw max, %dx
movswq %dx, %rcx #sum

call printf


movq -8(%rbp),%rdi
movq -16(%rbp), %rsi
movq -24(%rbp), %rdx

incl %r13d

jmp begin_loop
end_loop:

cmpb $1, %r8b
jz jump2

movq %rcx, %rax #return sum
jmp retorno_zero

jump2:

movq $0, %rax

retorno_zero:

leave

ret


.globl main

main:

pushq %rbp 

movq %rsp, %rbp

subq $16, %rbp

movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)

movq $v, %rdi
movq $5, %rsi
movq $2, %rdx
movq $max, %rcx
movq $1, %r8

call calc

movq %rax, %r9 # long r

movq $fmt2, %rdi
movq %r9, %rsi

call printf

movq -8(%rbp),%rdi
movq -16(%rbp),%rsi

movq $0, %rax

leave 

ret