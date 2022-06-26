.class public Sieve
.super java/lang/Object

; Compute the sieve of an integer
; @param(0) the integer argument
; @local(1) the boolean array
; @local(2) the current index
; @local(3) the limit
; @local(4) the other index
.method public static sieve(I)[Z
    .limit stack 8
    .limit locals 8

    iload_0
    iconst_1
    iadd
    newarray boolean    
    astore_1

    iload_0
    i2d
    invokestatic java/lang/Math.sqrt(D)D
    d2i
    iconst_1
    iadd
    istore_3
        
    iconst_2    
    istore 4

    aload_1
    iconst_0    
    iconst_1    
    bastore

    aload_1
    iconst_1
    iconst_1
    bastore
    
    aload_1
    iconst_2
    iconst_0
    bastore

    bipush 4
    istore_2
initialization_loop:
    iload_2 
    iload_0
    if_icmpgt initialization_loop_breakpoint

    aload_1
    iload_2
    iconst_0
    bastore

    iinc 2 1
    goto initialization_loop
initialization_loop_breakpoint:
    iconst_2
    istore_2

loop:
    iload_2
    iload_3
    if_icmpge loop_breakpoint
    
    aload_1
    iload_2
    baload
    ifne inner_loop_breakpoint

    iload_2
    iload_2
    imul
    istore 4

inner_loop:
    iload 4
    iload_0
    if_icmpgt inner_loop_breakpoint

    aload_1
    iload 4
    iconst_1
    bastore    

    iload 4
    iload_2
    iadd
    istore 4
    goto inner_loop
inner_loop_breakpoint:

    iinc 2 1
    goto loop
loop_breakpoint:
    
    aload_1
    areturn
.end method

; @locals
; @param(0) the array argument
; @local(1) the count
; @local(2) the current index
; @local(3) the array argument length
.method public static falseCount([Z)I
    .limit stack 4
    .limit locals 4  

    iconst_0
    istore_1
    
    iconst_0
    istore_2
    
    aload_0
    arraylength
    istore_3
loop:
    iload_2
    iload_3
    if_icmpge loop_breakpoint

    aload_0
    iload_2
    baload
    ifeq is_false
    goto is_false_breakpoint

is_false:
    iinc 1 1
is_false_breakpoint:

    iinc 2 1
    goto loop
loop_breakpoint:
    iload_1
    ireturn
.end method

; Get the true indices of a boolean array
; @param(0) the argument array
; @local(1) the return array
; @local(2) the current index
; @local(3) the argument array length
; @local(4) the return array index
.method public static falseIndices([Z)[I
    .limit stack 4
    .limit locals 5

    aload_0
    invokestatic Sieve/falseCount([Z)I
    newarray int
    astore_1
    
    iconst_0
    istore_2
    
    aload_0
    arraylength
    istore_3
    
    iconst_0
    istore 4
loop:
    iload_2
    iload_3
    if_icmpge loop_breakpoint

    aload_0
    iload_2
    baload
    ifeq is_false
    goto is_false_breakpoint

is_false:
    aload_1
    iload 4
    iload_2
    iastore
    iinc 4 1
is_false_breakpoint:    

    iinc 2 1
    goto loop
loop_breakpoint:
    aload_1
    areturn
.end method

; @locals 
; @param(0) the boolean array
; @local(1) the current index
; @local(2) the boolean array length
; @local(3,4) the sum
.method public static sumOfFalseIndices([Z)J
    .limit stack 4
    .limit locals 5

    iconst_0
    istore_1
    
    aload_0
    arraylength
    istore_2
    
    lconst_0
    lstore 3
loop:
    iload_1
    iload_2
    if_icmpge loop_breakpoint

    aload_0
    iload_1
    baload
    ifeq is_false
    goto is_false_breakpoint

is_false:
    lload 3
    iload_1
    i2l
    ladd
    lstore 3
is_false_breakpoint:

    iinc 1 1
    goto loop
loop_breakpoint:
    lload 3
    lreturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    .limit locals 4

    getstatic java/lang/System.out Ljava/io/PrintStream;

    ldc 2000000
    invokestatic Sieve/sieve(I)[Z
    invokestatic Sieve/sumOfFalseIndices([Z)J
;    invokestatic Sieve/falseIndices([Z)[I
;    invokestatic java/util/Arrays.toString([I)Ljava/lang/String; 

    invokestatic java/lang/Long.toString(J)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
