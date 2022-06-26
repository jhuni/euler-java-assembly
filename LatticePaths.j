.class public LatticePaths
.super java/lang/Object

; @param(0) n
; @param(1) k
; @local(2) the current index
; @local(4) the current coefficient
.method public static binomialCoefficient(II)J
    .limit stack 8
    .limit locals 6

    iconst_0
    istore_2
    
    lconst_1
    lstore 4
loop:
    iload_2
    iload_1
    if_icmpge loop_breakpoint

    lload 4
    iload_0
    iload_2
    isub
    i2l
    lmul
    iload_2
    iconst_1
    iadd
    i2l
    ldiv
    lstore 4

    iinc 2 1
    goto loop
loop_breakpoint:
    lload 4    
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    .limit locals 4

    getstatic java/lang/System.out Ljava/io/PrintStream;
    bipush 40
    bipush 20
    invokestatic LatticePaths.binomialCoefficient(II)J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return

    return
.end method
