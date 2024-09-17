.MODEL SMALL
.STACK 100H
.DATA
M DB 1 ; here you can change the val of M to check the code is running ok or not!!
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BL,M
    
    CMP BL,0
    JE LZ
    JG LG
    JL LL
    
    LL:
    MOV AH,2
    MOV DL,'N'
    INT 21H
    JMP EXIT
    
    LG:
    MOV AH,2
    MOV DL,'P'
    INT 21H
    JMP EXIT
    
    LZ:
    MOV AH,2
    MOV DL,'Z'
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
