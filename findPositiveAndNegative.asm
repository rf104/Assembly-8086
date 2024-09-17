.MODEL SMALL 
.STACK 100H
.DATA
S DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,0H
    JE L1
    JG L2
    JL L3
    
    L3:
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,'N'
    INT 21H
    JMP EXIT
    
    L2:
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,'P'
    INT 21H
    JMP EXIT
    
    L1:
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AH,2
    MOV DL,'Z'
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
