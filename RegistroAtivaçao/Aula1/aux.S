.section .rodata
fmt: .string "Valor: x = %ld, i = %d\n"

.data

.globl x
.align 8
x: .quad 10

.text

.globl aux

aux:

pushq %rbp

movq %rsp, %rbp

subq $16, %rsp

movq $5, x

#Salvando os parametros que serao utilizados
movq %rdi, -8(%rbp) # salvando i
movq %rsi, -16(%rbp) # salvando *ptr

movl %edi, %r9d

movq $fmt, %rdi #primeiro = fmt
movq x, %rsi #segundo = x
movl %r9d, %edx #terceiro = i

movl $0, %eax
call printf

movq -8(%rbp),%rdi
movq -16(%rbp),%rsi

movslq %edi, %rax # movo i para rax
addq (%rsi), %rax # somo i com *ptr
addq x, %rax


leave

ret