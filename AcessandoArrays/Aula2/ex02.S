.data

.globl letters
letters: .string "abcdefghij"

.globl even
.align 4
even: .long 0

.globl odd
.align 4
odd: .long 0


.text

.globl ex02
    ex02:

    pushq %rbp

    movq %rsp, %rbp

    movl $0, %eax   # unsigned int count = 0

    loop:

    movq $letters, %r8
    movl %eax, %ecx # transfere o count pro rcx
    addq %rcx, %r8 # letters[count]
    movb (%r8),%al

    testb %al, %al
    jz after_loop

    # testar if(letters[count++] & 1)
    movb (%r8), %al
    andb $1, %al

    testb %al, %al
    jz manda_else

    incl odd
    jmp after_loop

    manda_else:

    incl even

    after_loop:

    incl %eax    

    jmp loop


    leave

    ret