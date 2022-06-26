.class public Point
.super java/lang/Object

.field public x I
.field public y I

; @locals the point object object, the first integer, the second integer
.method public <init>(II)V
    .limit stack 4
    .limit locals 3

    aload_0
    invokespecial java/lang/Object.<init>()V

    aload_0
    iload_1
    putfield Point.x I
    aload_0
    iload_2
    putfield Point.y I
    return

.end method

; @locals the point object
.method public getX()I
    .limit stack 4
    .limit locals 1

    aload_0
    getfield Point.x I
    ireturn
.end method

; @locals the point object
.method public getY()I
    .limit stack 4
    .limit locals 1

    aload_0
    getfield Point.x I
    ireturn
.end method

; @locals the point object, the integer argument
.method public setX(I)V
    .limit stack 4
    .limit locals 2

    aload_0
    iload_1
    putfield Point.x I
    return
.end method

; @locals the point object, the integer argument
.method public setY(I)V
    .limit stack 4
    .limit locals 2

    aload_0
    iload_1
    putfield Point.y I
    return
.end method

; @locals the point object, the temp variable
.method public swapXY()V
    .limit stack 4
    .limit locals 2
   
    aload_0
    getfield Point.x I
    istore_1
    
    aload_0
    dup
    getfield Point.y I
    putfield Point.x I

    aload_0
    iload_1
    putfield Point.y I
    return
.end method

; @locals the point object, the current integer to be added
.method public addX(I)V
    .limit stack 4
    .limit locals 2
    
    aload_0
    dup
    getfield Point.x I
    iload_1
    iadd
    putfield Point.x I
    return
    
.end method

; @locals the point object, the current integer to be added
.method public addY(I)V
    .limit stack 4
    .limit locals 2

    aload_0
    dup
    getfield Point.y I
    iload_1
    iadd
    putfield Point.y I
    return

.end method

; @locals the point object, the scale factor
.method public scale(I)V
    .limit stack 4
    .limit locals 2

    aload_0
    dup
    getfield Point.x I
    iload_1
    imul
    putfield Point.x I

    aload_0
    dup
    getfield Point.y I
    iload_1
    imul
    putfield Point.y I
    
    return     
.end method

; @locals the point object, the x factor, the y factor
.method public translate(II)V
    .limit stack 4
    .limit locals 3

    aload_0
    iload_1
    invokevirtual Point.addX(I)V

    aload_0
    iload_2
    invokevirtual Point.addY(I)V

    return
    
.end method

; @locals the point object, the point object to be added
.method public translate(LPoint;)V
    .limit stack 4
    .limit locals 2

    aload_0
    aload_1
    getfield Point.x I
    aload_1
    getfield Point.y I
    invokevirtual Point.translate(II)V
    return
.end method

; @locals the point object, the grid
.method public getGridValue([[I)I
    .limit stack 4
    .limit locals 2
    
    aload_1
    aload_0
    getfield Point.y I
    aaload
    aload_0
    getfield Point.x I
    iaload
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 8
    .limit locals 1

    new Point
    dup
    bipush 5
    bipush 10
    invokespecial Point.<init>(II)V
    astore_0

    getstatic java/lang/System.out Ljava/io/PrintStream;
    aload_0
    aload_0
    invokevirtual Point.translate(LPoint;)V
    aload_0
    getfield Point.x I
    invokestatic java/lang/Integer.toString(I)Ljava/lang/String;
    invokevirtual java/io/PrintStream.println(Ljava/lang/String;)V
    return
.end method
