.section .rodata

fmt: .string "%d\n"

.data

.text

.globl show


#void show(int *v, int size) -> *v = % Rdi, size = %esi


show:

pushq %rbp

movq %rsp, %rbp

subq $32, %rsp

#for (i = 0; i < size; i++)
movl $0, %ecx

loop:

cmpl %esi, %ecx
jge jump_for


#printf("%d\n", v[i]); -> chamada de funçao, salva tudo que ela usa como parametro
movq %rcx, -8(%rbp)
movq %rdi, -16(%rbp)
movl %esi, -24(%rbp)

#v[i]
movq %rdi, %r8
movslq %ecx, %r9
imulq $4, %r9
addq %r8, %r9
movl (%r9), %esi

movq $fmt, %rdi




movl $0, %eax
call printf

movq -8(%rbp), %rcx
movq -16(%rbp), %rdi
movq -24(%rbp), %rsi




incl %ecx
jmp loop
jump_for:


leave 

ret