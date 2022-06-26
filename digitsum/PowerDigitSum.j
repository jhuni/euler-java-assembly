.class public PowerDigitSum
.super java/lang/Object

; Local variables
; argument string a0
; the current index i1
; the argument strings size i2
; the sum i3 
.method public static digitSum(Ljava/lang/String;)I
	.limit stack 4
	.limit locals 4

; Initialize the local variables
	iconst_0	
	istore_1

	aload_0
	invokevirtual java/lang/String.length()I
	istore_2

	iconst_0
	istore_3

loop:
	iload_1
	iload_2
	if_icmpge loop_breakpoint

	aload_0
	iload_1
	invokevirtual java/lang/String.charAt(I)C
	invokestatic java/lang/String.valueOf(C)Ljava/lang/String;
	invokestatic java/lang/Integer.parseInt(Ljava/lang/String;)I
	iload_3
	iadd
	istore_3

	iinc 1 1
	goto loop
loop_breakpoint:
	iload_3
	ireturn
.end method

.method public static powerDigits()Ljava/lang/String;
	.limit stack 4
	.limit locals 4

	iconst_2
	i2l
	invokestatic java/math/BigInteger.valueOf(J)Ljava/math/BigInteger;
	sipush 1000
	invokevirtual java/math/BigInteger.pow(I)Ljava/math/BigInteger;
	invokevirtual java/math/BigInteger.toString()Ljava/lang/String;
	areturn
.end method

.method public static sum()I
	.limit stack 4
	.limit locals 4

	invokestatic PowerDigitSum.powerDigits()Ljava/lang/String;
	invokestatic PowerDigitSum.digitSum(Ljava/lang/String)I
	ireturn
.end method
