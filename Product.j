.class public Product
.super java/lang/Object

.method public static reverseString(Ljava/lang/String;)Ljava/lang/String;
    .limit stack 4
    .limit locals 4
    new java/lang/StringBuilder
    dup
    aload_0
    invokespecial java/lang/StringBuilder.<init>(Ljava/lang/String;)V
    invokevirtual java/lang/StringBuilder.reverse()Ljava/lang/StringBuilder;
    invokevirtual java/lang/StringBuilder.toString()Ljava/lang/String;
    areturn
.end method

.method public static isPalindrome(I)I
    .limit stack 4
    .limit locals 4
    iload_0
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;
    dup
    invokestatic Product.reverseString(Ljava/lang/String;)Ljava/lang/String;
    invokevirtual java/lang/Object.equals(Ljava/lang/Object;)Z
    ireturn
.end method

.method public static largestPalindromeProduct()I
    .limit stack 4
    .limit locals 4
    ldc 100
    istore_0
    ldc 100
    istore_1
    iconst_0
    istore_2
loop:
    iload_0
    ldc 999
    if_icmpgt loop_breakpoint
    ldc 100
    istore_1
inner_loop:
    iload_1
    ldc 999
    if_icmpgt inner_loop_breakpoint
   
    iload_0
    iload_1
    imul
    invokestatic Product.isPalindrome(I)I
    ifne is_palindrome
    goto beyond_is_palindrome
is_palindrome:
    iload_0
    iload_1
    imul
    iload_2
    invokestatic java/lang/Math.max(II)I
    istore_2
beyond_is_palindrome:
    iinc 1 1
    goto inner_loop
inner_loop_breakpoint:   
    iinc 0 1
    goto loop
loop_breakpoint:
    iload_2
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 4
    .limit locals 4
    getstatic java/lang/System.out Ljava/io/PrintStream;
    invokestatic Product.largestPalindromeProduct()I
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method 
