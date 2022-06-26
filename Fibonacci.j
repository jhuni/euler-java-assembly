.class public Fibonacci
.super java/lang/Object

.method public static isEven(I)I
    .limit stack 4
    iload_0
    iconst_2
    irem
    ifeq is_even
    iconst_0
    goto done
is_even:
    iconst_1
done:
    ireturn
.end method

.method public static fibonacciNumber(I)I
    .limit stack 8
    iload_0
    iconst_2
    if_icmplt special_case
    goto normal_case
special_case:
    iload_0
    ireturn
normal_case:
    iload_0
    iconst_1
    isub
    invokestatic Fibonacci.fibonacciNumber(I)I
    iload_0
    iconst_2
    isub
    invokestatic Fibonacci.fibonacciNumber(I)I
    iadd
    ireturn
.end method

.method public static eulerTwo()I
    .limit stack 8
    .limit locals 4
    ldc 4000000
    istore_0
    
    iconst_0    
    istore_1

    iconst_0
    istore_2
    
    iconst_0    
    istore_3
loop:
    iload_1
    invokestatic Fibonacci.fibonacciNumber(I)I
    istore_2
    
    iload_2   
    iload_0
    if_icmpge loop_breakpoint

    iload_2
    invokestatic Fibonacci.isEven(I)I
    ifgt is_even
    goto done
is_even:
    iload_2
    iload_3
    iadd
    istore_3
done:
    iinc 1 1
    goto loop
loop_breakpoint:
    iload_3
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
	.limit stack 4
	getstatic java/lang/System.out Ljava/io/PrintStream;
    invokestatic Fibonacci.eulerTwo()I
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;
	invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
	return	
.end method

