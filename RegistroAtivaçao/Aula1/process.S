.section .rodata



.data


.text

.globl process

process:

pushq %rbp

movq %rsp, %rbp

subq $48, %rsp # aloca memoria

#Salva os parametros
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx,-24(%rbp)
movq %rcx,-32(%rbp)
movq %r8,-40(%rbp)
movq %r9,-48(%rbp)

movl %edi, %r10d
movl %esi, %r11d
movl %edx, %r12d

movl %r9d, %edi
movl %r8d, %esi
movl %ecx, %edx
movl %r12d, %ecx
movl %r11d, %r8d
movl %r10d, %r9d


call calc


movq -8(%rbp), %rdi
movq -16(%rbp), %rsi
movq -24(%rbp), %rdx
movq -32(%rbp), %rcx
movq -40(%rbp), %r8
movq -48(%rbp), %r9

addl %edi, %eax
addl %esi, %eax
addl %edx, %eax
addl %ecx, %eax
addl %r8d, %eax
addl %r9d, %eax


leave

ret