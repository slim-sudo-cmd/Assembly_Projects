.arch armv8-a
.global main

.section .rodata
.align 3

// program print statements
.LC_title:
    .string "\n========== • For • Loop • Flow • Control • ===============\n\n>>> Loop run from 0-10 but skips 5\n"

.LC_results:
    .string ">>> No = %d\n"

.text

main:
    // >>> Prologue
    stp x29,x30,[sp,#-32]!
    mov x29,sp
    str x19,[x29,#16] // initializing caller pointer 

    // >>> intro
    adrp x0,.LC_title
    add x0,x0,:lo12:.LC_title
    bl printf

    mov x19,#0

loop_body:
    cmp x19,#10 // compares x >= 10 if greater it breaks
    b.gt loop_end // ends the loop entirely

    cmp x19,#5 // compares if x == 5
    b.eq continue_fmt // initiates continue 

    adrp x0,.LC_results
    add x0,x0,:lo12:.LC_results
    mov x1,x19
    bl printf

continue_fmt:
    add x19,x19,#1 //adds 1 to the iterator before being called
    b loop_body // calls the head of the loop 

loop_end:
    mov w0,#0
    ldr x19,[sp,#16] // restoring the caller pointer
    ldp x29,x30,[sp],#32 // restore frame pointer 
    ret // Handles control back to CPU

