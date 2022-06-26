.class public Triplet
.super java/lang/Object

; @locals the a variable, the b variable, the c variable, the c variable as a double 
.method public static eulerProblemNine()[I
    .limit stack 8
    .limit locals 5
    
    iconst_1
    istore_0

    iconst_1
    istore_1
    
    iconst_1
    istore_2

    dconst_1
    dstore_3

loop_a:
    iload_0
    sipush 1000
    if_icmpgt loop_a_breakpoint 

    iload_0
    iconst_1
    iadd
    istore_1

loop_b:
    iload_1
    sipush 1000
    if_icmpge loop_b_breakpoint

    iload_0
    iload_0
    imul
    iload_1
    iload_1
    imul    
    iadd
    i2d
    invokestatic java/lang/Math.sqrt(D)D
    dstore_3

    dload_3
    dload_3
    invokestatic java/lang/Math.floor(D)D
    dcmpg
    ifne conditional_breakpoint

    dload_3
    d2i
    istore_2

    iload_0 
    iload_1
    iload_2
    iadd
    iadd
    sipush 1000
    if_icmpeq conditional
    goto conditional_breakpoint

conditional:
    goto loop_a_breakpoint   
conditional_breakpoint:

    iinc 1 1
    goto loop_b
loop_b_breakpoint:

    iinc 0 1
    goto loop_a
loop_a_breakpoint:
    bipush 3
    newarray int
    dup
    iconst_0
    iload_0
    iastore
    dup
    iconst_1
    iload_1
    iastore
    dup
    iconst_2
    iload_2
    iastore
    areturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 4
    .limit locals 4

    getstatic java/lang/System.out Ljava/io/PrintStream;

    invokestatic Triplet/eulerProblemNine()[I
    invokestatic java/util/Arrays.toString([I)Ljava/lang/String; 

    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
