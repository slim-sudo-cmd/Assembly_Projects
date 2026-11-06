
.arch armv8-a
.global main

.section .rodata
.align 3
.LC_title:
    .string "\n========= • ASSEMBLY • BODMAS • DEMO • =========\n"
.LC_results:
    .string "\n>>> Your Bodmas result is :%d\n"
.LC_description:
    .string "\n\n>>> The bodmas operations is : a + b * c"
    .string "\n>>> Where A = 4,B = 7 and C = 10\n"

.text
.align 2

main:
    // selecting registers
    stp x29,x30,[sp,-32]!
    mov x29,sp

    // printing title
    adrp x0, .LC_title
    add x0,x0, :lo12:.LC_title
    bl printf

    adrp x0, .LC_description
    add x0,x0, :lo12:.LC_description
    bl printf

    mov w0,4 //first no is 4
    str w0,[sp,28] // slot 28

    mov w0,7 //second no is 7
    str w0,[sp,24] // slot 24

    mov w0,10 //second no is 10
    str w0,[sp,20] // slot 20

    // Loading to he computed 
    ldr w0,[sp,20] // selecting 10
    ldr w1,[sp,24] // selecting 7

    mul w0,w1,w0 // multiplying 10 * 7 and W0 = 70

    ldr w1,[sp,28]
    add w0,w1,w0

    mov w1,w0

    adrp x0, .LC_results
    add x0,x0, :lo12:.LC_results
    bl printf

    //clearing memory buffer
    mov w0,0
    ldp x29,x30,[sp],32
    ret







