.MODEL SMALL
.STACK 100H
.DATA 
N DB 0
MSG DB 'INPUT: $'
S DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
           
    XOR BX,BX
    
    MOV AH,1
    INT 21H
    
    WHILE:
        CMP AL,0DH
        JE BREAK1
        PUSH AX
        
        MOV AX,10;
        MUL BX
        MOV BX,AX
        
        POP AX
        AND AX,000FH
        ADD BX,AX
        
        MOV AH,1
        INT 21H
        JMP WHILE
    
    BREAK1:
        MOV AH,9
        LEA DX,S
        INT 21H
        
        MOV AH,2
        MOV DX,BX
        INT 21H    
         
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
