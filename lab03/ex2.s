.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1
    sub t1, x0, a0
    mul a0, t0, t1
    jr ra

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0
    addi s0, x0, 0
    la s1, source       // load source[] address
    la s2, dest         // load dest[] address
loop:
    slli s3, t0, 2      // compute offset
    add t1, s1, s3      // get source[k] address
    lw t2, 0(t1)        // load source[k]
    beq t2, x0, exit    // if source[k] == 0, break the loop
    add a0, x0, t2      // put source[k] as argument
    addi sp, sp, -8     // save stack frame
    sw t0, 0(sp)
    sw t2, 4(sp)
    jal fun             // function call
    lw t0, 0(sp)
    lw t2, 4(sp)
    addi sp, sp, 8      // restore stack frame
    add t2, x0, a0      // get return value
    add t3, s2, s3      // get dest[k] address
    sw t2, 0(t3)        // save return value in dest[k]
    add s0, s0, t2      // sum += dest[k]
    addi t0, t0, 1      // k++
    jal x0, loop
exit:
    add a0, x0, s0
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra
