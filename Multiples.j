.class public Multiples
.super java/lang/Object

.method public static gcd(JJ)J
    .limit stack 8
    .limit locals 4
    lload_2
    lconst_0
    lcmp    
    ifeq is_zero
    lload_2
    lload_0
    lload_2
    lrem
    invokestatic Multiples.gcd(JJ)J
    goto done    
is_zero:
    lload_0
done:
    lreturn
.end method

.method public static lcm(JJ)J
    .limit stack 8
    .limit locals 4
    lload_0
    lload_2
    lmul
    lload_0
    lload_2
    invokestatic Multiples.gcd(JJ)J
    ldiv
    lreturn
.end method

.method public static range(J)[J
    .limit stack 4
    .limit locals 4
    lload_0
    l2i
    newarray long
    astore_2

    iconst_0
    istore_3
loop:
    iload_3
    lload_0
    l2i
    if_icmpge loop_breakpoint

    aload_2
    iload_3    
    iload_3
    iconst_1
    iadd
    i2l
    lastore

    iinc 3 1
    goto loop
loop_breakpoint:
    aload_2
    areturn
.end method

.method public static reducelcm([J)J
    .limit stack 8
    .limit locals 5

    aload_0
    arraylength
    istore_1
    
    iconst_1
    istore_2
    
    aload_0
    iconst_0
    laload
    lstore_3
loop:
    iload_2
    iload_1
    if_icmpge loop_breakpoint

    lload_3
    aload_0
    iload_2
    laload
    invokestatic Multiples.lcm(JJ)J
    lstore_3
        
    iinc 2 1
    goto loop
loop_breakpoint:
    lload_3
    lreturn    
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    getstatic java/lang/System.out Ljava/io/PrintStream;
    ldc2_w 20
    invokestatic Multiples.range(J)[J
    invokestatic Multiples.reducelcm([J)J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
