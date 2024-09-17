.MODEL SMALL 
.STACK 100H
.DATA
PR DB 'NO CAP'
M DB 'ENTER A CHAR $'
S DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,M
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,'A'
    JNGE EXIT
    CMP BL,'Z'
    JNLE EXIT
    
    
    
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
