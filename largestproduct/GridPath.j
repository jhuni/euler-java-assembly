.class public GridPath
.super java/lang/Object

.field public startLocation LPoint;
.field public direction LPoint;
.field public length I

; @locals the grid path object, the start location, direction, and length
.method public <init>(LPoint;LPoint;I)V
    .limit stack 4
    .limit locals 4

    aload_0
    invokespecial java/lang/Object.<init>()V

    aload_0
    aload_1
    putfield GridPath.startLocation LPoint;
    aload_0
    aload_2
    putfield GridPath.direction LPoint;
    aload_0
    iload_3
    putfield GridPath.length I

    return
.end method

; @locals the grid path object, the array object, the current point, the current index, the return array
.method public getGridValues([[I)[I
    .limit stack 6
    .limit locals 5

    aload_0
    getfield GridPath.startLocation LPoint;
    astore_2
    
    iconst_0
    istore_3

    aload_0
    getfield GridPath.length I
    newarray int
    astore 4

loop:
    iload_3
    aload_0
    getfield GridPath.length I
    if_icmpge loop_breakpoint
    
    aload 4
    iload 3
    aload 2
    aload 1    
    invokevirtual Point.getGridValue([[I)I
    iastore

; translate the point
    aload_2
    aload_0
    getfield GridPath.direction LPoint;
    invokevirtual Point.translate(LPoint;)V
        
    iinc 3 1
    goto loop
loop_breakpoint:
    aload 4
    areturn
.end method

; @param(0) the grid path object
; @param(1) the array object
; @local(2) the current point
; @local(3) the current index
; @local(4) the return product
.method public getGridProduct([[I)I
    .limit stack 6
    .limit locals 5

    aload_0
    getfield GridPath.startLocation LPoint;
    astore_2
    
    iconst_0
    istore_3
    
    iconst_1
    istore 4

loop:
    iload_3
    aload_0
    getfield GridPath.length I
    if_icmpge loop_breakpoint

; multiply by the grid value    
    iload 4
    aload 2
    aload 1    
    invokevirtual Point.getGridValue([[I)I
    imul
    istore 4

; translate the point
    aload_2
    aload_0
    getfield GridPath.direction LPoint;
    invokevirtual Point.translate(LPoint;)V
        
    iinc 3 1
    goto loop
loop_breakpoint:
    iload 4
    ireturn
.end method

