.arch armv8-a
.global main

.section .rodata
.align 3

// >>> Program prints statements
.LC_title:
    .string "\n============ • BODMAS • LESSON • TWO • ============\n"
.LC_description:
    .string "\n>>> [?] Program combines all arithmetic compulation i.e:\n>> 1: Addition\n>> 2: Subtraction\n>> 3: Multiplication\n>> 4: Division\n\n>>> [+] The Math Problem in particular is ;\n>> ( 20 × 3 + 2 - 18 ÷ 6 )\n>> EXPECTED ANS IS : 59\n"

.LC_operation_notify:
    .string "\n>>> Performing the BODMAS Operation"

.LC_bodmas_results:
    .string "\n>>> Bodmas Ans is : %d"

.text
// main function
main:
    // prologue
    stp x29,x30,[sp,#-16]!
    // >>> Displaying program title
    adrp x0, .LC_title
    add x0,x0, :lo12:.LC_title
    bl printf

    // >>> Displaying program calculations details
    adrp x0, .LC_description
    add x0,x0, :lo12:.LC_description
    bl printf

    // >>> Displaying Bodmas notice first
    adrp x0, .LC_operation_notify
    add x0,x0, :lo12:.LC_operation_notify
    bl printf

    // >>> Moving our values and storing them to a special register
    mov w0,20  // selecting 20
    mov w1,3 // selecting 3
    mul w0,w1,w0 // Multiplying 20 × 3 
    mov w9,w0 // storing multiplication product in  -> w9

    mov w0,18 // selecting 18
    mov w1,6// selecting 6
    sdiv w0,w0,w1 // dividing 18 ÷ 6
    mov w10,w0 // storing division value -> w10

    mov w0,w9 // selecting multiplication value
    mov w1,2 // selecting 2
    add w0,w1,w0 // adding 60 + 2
    mov w3,w0 // storing addition value in -> w3

    mov w0,w3 // selecting 62
    mov w1,w10 // selecting 3
    sub w0,w0,w1 // subtracting 62 - 3

    mov w1,w0 // sticky notes for display
    
    // >>> printing results  
    adrp x0, .LC_bodmas_results 
    add x0,x0, :lo12:.LC_bodmas_results 
    bl printf
    
    // epilogue
    mov w0,0
    ldp x29,x30,[sp],#16
    ret // exit the program
