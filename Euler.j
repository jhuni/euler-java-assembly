.class public Euler
.super java/lang/Object

.method public static isMultiple(II)I
    .limit stack 4
    .limit locals 4
    iload_0
    iload_1
    irem
    ifeq isMultiple
    iconst_0
    goto done
isMultiple:
    iconst_1
done:
    ireturn
.end method

.method public static isEulerMultiple(I)I
    .limit stack 4
    iload_0
    iconst_3
    invokestatic Euler.isMultiple(II)I
    iload_0
    iconst_5
    invokestatic Euler.isMultiple(II)I
    ior
    ireturn
.end method

.method public static eulerOne(I)I
    .limit stack 4
    .limit locals 3

    iconst_0
    istore_1
   
    iconst_0
    istore_2
loop:
    iload_1
    iload_0
    if_icmpge loop_breakpoint

    iload_1
    invokestatic Euler.isEulerMultiple(I)I
    ifeq not_multiple
    
    iload_1
    iload_2
    iadd
    istore_2
not_multiple:
    iinc 1 1
    goto loop
loop_breakpoint:
    iload_2
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
	.limit stack 4
	getstatic java/lang/System.out Ljava/io/PrintStream;
    ldc 1000
    invokestatic Euler.eulerOne(I)I
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;
	invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
	return	
.end method
