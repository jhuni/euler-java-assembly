.class public Collatz
.super java/lang/Object

; @param(0,1) the start of the chain
; @local(2,3) the current number in the sequence
; @local(4,5) the length of the collatz sequence
.method public static collatzLength(J)J
    .limit stack 8
    .limit locals 6

    lload_0
    lstore_2
    
    lconst_1
    lstore 4

loop:
    lload_2
    lconst_1
    lcmp
    ifeq loop_breakpoint

    lload 2
    ldc2_w 2
    lrem
    l2i
    ifeq is_even
    goto is_odd

is_even:
    lload 2
    ldc2_w 2
    ldiv
    lstore 2
    goto conditional_breakpoint
is_odd:
    lload 2
    ldc2_w 3
    lmul
    lconst_1
    ladd
    lstore 2
conditional_breakpoint:
    lload 4
    lconst_1
    ladd
    lstore 4

    goto loop
loop_breakpoint:
    lload 4
    lreturn
.end method

; @locals the current integer, the current length, the current maximum length, the current maximum index
.method public static eulerProblemFourteen()J
    .limit stack 4
    .limit locals 6
    
    iconst_1
    istore_0

    lconst_1
    lstore 1
    
    lconst_1
    lstore 3

    iconst_1
    istore 5

loop:
    iload_0
    ldc 1000000
    if_icmpge loop_breakpoint

    iload_0
    i2l
    invokestatic Collatz.collatzLength(J)J
    lstore 1

    lload 1
    lload 3
    lcmp
    ifle is_not_greater

    lload 1
    lstore 3

    iload_0
    istore 5

is_not_greater:    
    iinc 0 1
    goto loop
loop_breakpoint:    
    iload 5
    i2l
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    .limit locals 4

    getstatic java/lang/System.out Ljava/io/PrintStream;

    invokestatic Collatz.eulerProblemFourteen()J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return

    return
.end method
