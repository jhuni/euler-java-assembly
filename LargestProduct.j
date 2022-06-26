.class public LargestProduct
.super java/lang/Object

; Compute the products of the digits of a string
; @param(0) the string we are dealing with
; @local(1) the length of the string
; @local(2) the current index of the string
; @local(3,4) the current product
.method public static digitalProduct(Ljava/lang/String;)J
    .limit stack 8
    .limit locals 5
    aload_0
    invokevirtual java/lang/String.length()I
    istore_1
    
    iconst_0
    istore_2
    
    lconst_1
    lstore_3
loop:
    iload_2
    iload_1
    if_icmpge loop_breakpoint

    aload_0
    iload_2
    iload_2
    iconst_1
    iadd
    invokevirtual java/lang/String.substring(II)Ljava/lang/String;
    invokestatic java/lang/Long.parseLong(Ljava/lang/String;)J
    lload_3
    lmul
    lstore_3

    iinc 2 1
    goto loop
loop_breakpoint:
    lload_3
    lreturn
.end method

; Compute the largest product in a string
; @param(0) the string
; @param(1) length of the substrings
; @param(2) largest starting index of any substring
; @param(3) the current index in the string
; @param(4,5) the largest product
.method public static largestProductInSeries(Ljava/lang/String;I)J
    .limit stack 8
    .limit locals 6

    aload_0
    invokevirtual java/lang/String.length()I
    iload_1
    isub
    istore_2

    iconst_0
    istore_3
    
    lconst_1
    lstore 4

loop:
    iload_3
    iload_2
    if_icmpgt loop_breakpoint   

    aload_0
    iload_3
    iload_3
    iload_1
    iadd
    invokevirtual java/lang/String.substring(II)Ljava/lang/String;
    invokestatic LargestProduct.digitalProduct(Ljava/lang/String;)J
    lload 4
    invokestatic java/lang/Math.max(JJ)J
    lstore 4

    iinc 3 1
    goto loop
loop_breakpoint:
    lload 4
    lreturn
.end method

.method public static eulerEight()J
    .limit stack 4
    ldc "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
    ldc 13
    invokestatic LargestProduct.largestProductInSeries(Ljava/lang/String;I)J
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 4
    getstatic java/lang/System.out Ljava/io/PrintStream;
    invokestatic LargestProduct.eulerEight()J
    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
