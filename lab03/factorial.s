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