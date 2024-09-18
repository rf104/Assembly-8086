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
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    CMP BL,BH
    JGE L1
    
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    JMP EXIT
    
    L1:
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
