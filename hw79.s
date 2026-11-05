.text

    .globl relation_code
    .type relation_code, @function
relation_code:
    # TODO: Problem 1
    movq $0, %rax
    cmpq %rsi, %rdi
    jge unsigned
    addq $1, %rax
    unsigned:
        cmpq %rsi, %rdi
        jae done
        addq $2, %rax 
    done:
        ret

    .globl clamp_long
    .type clamp_long, @function
clamp_long:
    cmpq %rsi, %rdi
    jle less
    cmpq %rdx, %rdi
    jge more
    movq %rdi, %rax
    ret
    less:
        movq %rsi, %rax
        ret
    more:
        movq %rdx, %rax
        ret
    

    .globl weighted_sum8
    .type weighted_sum8, @function
weighted_sum8:
    # TODO: Problem 3
    movq %rdi, %rax
    imulq $2, %rsi
    addq %rsi, %rax
    imulq $3, %rdx
    addq %rdx, %rax
    imulq $4, %rcx
    addq %rcx, %rax
    imulq $5, %r8
    addq %r8, %rax
    imulq $6, %r9
    addq %r9, %rax
    imulq $7, 8(%rsp), %r10
    addq %r10, %rax
    imulq $8, 16(%rsp), %r10
    addq %r10, %rax
    ret

    .globl alternating_sum
    .type alternating_sum, @function
alternating_sum:
    movq $0, %rax
    cmpq $0, %rdi
    je done
    movq $1, %r10
    movq $1, %r11
    loop:
        cmpq %rdi, %r11
        jg done
        cmpq $1, %r10
        je positive
        negative:
            subq %r11, %rax
            movq $1, %r10
            addq $1, %r11
            jmp loop
        positive:
            addq %r11, %rax
            movq $-1, %r10
            addq $1, %r11
            jmp loop

    .globl recursive_power
    .type recursive_power, @function
recursive_power:
    # TODO: Problem 5
    movq $0, %rax
    cmpq $0, %rsi
    je base_case:
    
    base_case:
        movq $1, %rax
        ret

    .globl combine_helpers
    .type combine_helpers, @function
combine_helpers:
    # TODO: Problem 6
    movq $0, %rax
    ret

    .section .note.GNU-stack,"",@progbits
