.class public Nums
.super java/lang/Object

.method public static isDivisor(JJ)J
    .limit stack 4
    .limit locals 4
    lload_0
    lload_2
    lrem
    lconst_0
    lcmp
    ifeq is_divisor
    lconst_0
    goto done
is_divisor:
    lconst_1
done:
    lreturn
.end method

.method public static isPrime(J)J
    .limit stack 8
    .limit locals 8
    lload_0
    ldc2_w 2
    lcmp
    dup
    iflt is_less_then_two
    ifeq is_two
    goto default_case
is_less_then_two:
    lconst_0
    lreturn 
is_two:
    lconst_1
    lreturn
default_case:
    ldc2_w 2
    lstore_2
    
    lload_0
    l2d
    invokestatic java/lang/Math.sqrt(D)D
    invokestatic java/lang/Math.floor(D)D
    dconst_1
    dadd    
    d2l
    lstore 4

loop:
    lload_2 
    lload 4
    lcmp
    ifgt loop_breakpoint

    lload_0
    lload_2
    invokestatic Nums.isDivisor(JJ)J
    lconst_1
    lcmp
    ifeq is_divisor
    goto done
is_divisor:
    lconst_0
    lreturn
done:
    lload_2
    lconst_1
    ladd
    lstore_2
    goto loop
loop_breakpoint:
    lconst_1
    lreturn
.end method

.method public static isPrimeFactor(JJ)J
    .limit stack 4
    .limit locals 4
    lload_0
    lload_2
    invokestatic Nums.isDivisor(JJ)J
    lload_2
    invokestatic Nums.isPrime(J)J
    land
    lreturn
.end method

.method public static largestPrimeFactor(J)J
    .limit stack 8
    .limit locals 8

    ldc2_w 2
    lstore_2

    lconst_1
    lstore 4 
loop:
    lload_0
    lload_2
    ldiv
    lstore 4

    lload_0    
    lload 4
    invokestatic Nums.isPrimeFactor(JJ)J
    lconst_1
    lcmp
    ifeq is_prime_factor
    goto done
is_prime_factor:
    lload 4
    goto loop_breakpoint
done:
    lload_2
    lconst_1
    ladd
    lstore_2
    goto loop
loop_breakpoint:
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    getstatic java/lang/System.out Ljava/io/PrintStream;
    ldc2_w 600851475143
    invokestatic Nums.largestPrimeFactor(J)J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
