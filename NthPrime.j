.class public NthPrime
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
    invokestatic NthPrime.isDivisor(JJ)J
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

; Get the nth prime
; @param(0,1) the nth prime to calculate
; @param(2,3) the current index 
; @param(4,5) the number of primes
.method public static nthPrime(J)J
    .limit stack 8
    .limit locals 6

    lconst_1
    lstore_2
    
    lconst_0
    lstore 4

loop:
    lload 4    
    lload_0
    lcmp
    ifge loop_breakpoint

    lload_2
    lconst_1
    ladd
    lstore_2

    lload_2
    invokestatic NthPrime.isPrime(J)J
    lconst_1
    lcmp
    ifeq is_prime
    goto done
is_prime:
    lload 4
    lconst_1
    ladd
    lstore 4
done:
    goto loop
loop_breakpoint:
    lload_2
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    getstatic java/lang/System.out Ljava/io/PrintStream;
    ldc2_w 10001
    invokestatic NthPrime.nthPrime(J)J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
