.class public LargeProduct
.super java/lang/Object

; @param(0) the current grid
; @param(1) the start point
; @param(2) the end point
; @param(3) the direction
; @local(4) the current grid path object
; @local(5) x
; @local(6) y
; @local(7) the largest product
.method public static maximalSubgridPathProduct([[ILPoint;LPoint;LPoint;)I
    .limit stack 8  
    .limit locals 8

    new GridPath
    dup 
    aload_1
    aload_3
    bipush 4
    invokespecial GridPath.<init>(LPoint;LPoint;I)V
    astore 4

    aload_1
    getfield Point.x I
    istore 5
    
    aload_1
    getfield Point.y I
    istore 6

    iconst_1
    istore 7
loop_x:
    iload 5
    aload_2
    getfield Point.x I
    if_icmpge loop_x_breakpoint

    aload_1
    getfield Point.y I
    istore 6

loop_y:
    iload 6
    aload_2
    getfield Point.y I
    if_icmpge loop_y_breakpoint

; setup the start location
    aload 4
    new Point
    dup
    iload 5
    iload 6
    invokespecial Point.<init>(II)V
    putfield GridPath.startLocation LPoint;

; store the maximum value
    iload 7
    aload 4
    aload_0
    invokevirtual GridPath.getGridProduct([[I)I
    invokestatic java/lang/Math.max(II)I
    istore 7

    iinc 6 1
    goto loop_y
loop_y_breakpoint:

    iinc 5 1
    goto loop_x
loop_x_breakpoint:
    iload 7
    ireturn
.end method

.method public static getProduct([[I)I
    .limit stack 10
    .limit locals 1

    aload_0
    new Point
    dup
    bipush 0
    bipush 0
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 17
    bipush 20
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 1
    bipush 0
    invokespecial Point.<init>(II)V
    invokestatic LargeProduct.maximalSubgridPathProduct([[ILPoint;LPoint;LPoint;)I

    aload_0
    new Point
    dup
    bipush 0
    bipush 0
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 20
    bipush 17
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 0
    bipush 1
    invokespecial Point.<init>(II)V
    invokestatic LargeProduct.maximalSubgridPathProduct([[ILPoint;LPoint;LPoint;)I

    aload_0
    new Point
    dup
    bipush 0
    bipush 0
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 17
    bipush 17
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 1
    bipush 1
    invokespecial Point.<init>(II)V
    invokestatic LargeProduct.maximalSubgridPathProduct([[ILPoint;LPoint;LPoint;)I

    aload_0
    new Point
    dup
    bipush 3
    bipush 0
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush 20
    bipush 17
    invokespecial Point.<init>(II)V
    new Point
    dup
    bipush -1
    bipush 1
    invokespecial Point.<init>(II)V
    invokestatic LargeProduct.maximalSubgridPathProduct([[ILPoint;LPoint;LPoint;)I

    invokestatic java/lang/Math.max(II)I
    invokestatic java/lang/Math.max(II)I
    invokestatic java/lang/Math.max(II)I
    ireturn

.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    .limit locals 4

    new Point
    dup
    bipush 2
    bipush 3
    invokespecial Point.<init>(II)V
    astore_0 

    new Point
    dup
    bipush 1
    bipush 1
    invokespecial Point.<init>(II)V
    astore_1   

    new GridPath
    dup 
    aload_0
    aload_1
    bipush 4
    invokespecial GridPath.<init>(LPoint;LPoint;I)V
    astore_2
    
    getstatic java/lang/System.out Ljava/io/PrintStream;
    
;    aload_2
    getstatic ProblemData.grid [[I
;    invokevirtual GridPath.getGridProduct([[I)I

   invokestatic LargeProduct.getProduct([[I)I    
    
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;    

    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
