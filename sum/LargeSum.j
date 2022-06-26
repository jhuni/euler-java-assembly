.class public LargeSum
.super java/lang/Object

; Compute the sum of an array of strings of big integers
; @param(0) the string array argument
; @local(1) the string index
; @local(2) the string array length
; @local(3) the sum biginteger
.method public static sum([Ljava/lang/String;)Ljava/math/BigInteger;
    .limit stack 4
    .limit locals 4
    
    iconst_0
    istore_1

    aload_0
    arraylength
    istore_2

    lconst_0
    invokestatic java/math/BigInteger.valueOf(J)Ljava/math/BigInteger;
    astore_3
loop:
    iload_1
    iload_2
    if_icmpge loop_breakpoint

    new java/math/BigInteger
    dup
    aload_0
    iload_1
    aaload
    invokespecial java/math/BigInteger.<init>(Ljava/lang/String;)V 
    aload_3
    invokevirtual java/math/BigInteger.add(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    astore_3       

    iinc 1 1
    goto loop
loop_breakpoint:
    aload_3
    areturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 4
    getstatic java/lang/System.out Ljava/io/PrintStream;
;    ldc2_w 50
    getstatic ProblemData.data [Ljava/lang/String;
    invokestatic LargeSum.sum([Ljava/lang/String;)Ljava/math/BigInteger;
;    invokestatic java/math/BigInteger.valueOf(J)Ljava/math/BigInteger;    
    invokevirtual java/math/BigInteger.toString()Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V    
    return
.end method
