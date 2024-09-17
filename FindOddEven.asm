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
    
    CMP BL,1
    JE  L1
    CMP BL,3
    JE  L1
    
    CMP BL,2
    JE L2
    CMP BL,4
    JE L2
    
    
    
    
    L1:
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AH,2
    MOV DL,'O'
    INT 21H
    JMP EXIT
    
    L2:
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AH,2
    MOV DL,'E'
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
