.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,'0'  ;converting into ascii
    
    mov ah,1
    int 21h
    mov dl,al
    sub dl,'0' ;converting into ascii
    
    mov ah,2
    add dl,bl
    add dl,'0'  ;ASCII to int
    int 21h
    
    main endp
end main
