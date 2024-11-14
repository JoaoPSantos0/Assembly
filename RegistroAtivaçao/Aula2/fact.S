.section .rodata



.data


.text

.globl fat

fat:

pushq %rbp

movq %rsp, %rbp

subq $16, %rsp



cmpl $0,%edi
jle jump_if


movl %edi, -8(%rbp)
#return fat(n-1) * n;
subl $1, %edi

call fat


movq -8(%rbp), %rdi

imul %edi, %eax

# Toda vez que chamar a funçao dentro da própria, dver-se retornar para o registrador base!!!!

leave 

ret

jump_if:


movl $1, %eax

leave

ret