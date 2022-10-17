.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

// iteration
factorial:
    mv t0, a0
    li t1, 1

loop:
    addi t0, t0, -1
    blt t0, t1, factorial_exit
    mul a0, a0, t0
    j loop

factorial_exit:
    jr ra

// recursion
factorial:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)
    addi t0, a0, -1
    bge t0, zero, L1
    li a0, 1
    addi sp, sp, 8
    jr ra

L1:
    addi a0, a0, -1
    jal ra, factorial

    mv t1, a0
    lw ra, 4(sp)
    lw a0, 0(sp)
    addi sp, sp, 8
    mul a0, a0, t1
    jr ra
