.class public TriangularDivisors
.super java/lang/Object

; Compute the nth triangular number
; @param(0) the integer argument
.method public static triangularNumber(I)I
    .limit stack 4
    iload_0
    iload_0
    iconst_1
    iadd
    imul
    iconst_2
    idiv
    ireturn
.end method

; Compute the number of divisors faster
; @param(0) the integer argument
; @local(1) the current divisor
; @local(2) the limit
; @local(3) the number of divisors
.method public static numberOfDivisors(I)I
    .limit stack 4
    .limit locals 4

    iconst_1
    istore_1

    iload_0
    i2d
    invokestatic java/lang/Math.sqrt(D)D
    invokestatic java/lang/Math.ceil(D)D
    d2i
    istore_2

    iconst_0
    istore_3

loop:
    iload_1
    iload_2
    if_icmpge loop_breakpoint

    iload_0
    iload_1
    irem
    ifeq is_divisor
    goto is_divisor_breakpoint

is_divisor:
    iinc 3 2
is_divisor_breakpoint:

    iinc 1 1
    goto loop
loop_breakpoint:
    iload_1
    iload_1
    imul
    iload_0
    if_icmpne is_not_square
    iinc 3 1
is_not_square:
    iload_3
    ireturn
.end method

; Get the answer to problem twelve
.method public static eulerProblemTwelve()I
    .limit stack 4
    .limit locals 4

    bipush 28
    istore_0

loop:
    iload_0
    invokestatic TriangularDivisors.triangularNumber(I)I
    invokestatic TriangularDivisors.numberOfDivisors(I)I
    sipush 500
    if_icmpgt loop_breakpoint
    
    iinc 0 1
    goto loop
loop_breakpoint:
    iload_0
    invokestatic TriangularDivisors.triangularNumber(I)I
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 4
    .limit locals 4

    getstatic java/lang/System.out Ljava/io/PrintStream;

    invokestatic TriangularDivisors/eulerProblemTwelve()I
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String; 

    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
