.MODEL SAMLL
.STACK 100H
.DATA
S DB 10,13,'$'
PR DB 'INPUT: $'
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,PR
    INT 21H
    
    XOR BX,BX
    FOR:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE BREAK1
    
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    
    POP AX
    AND AX,000FH
    ADD BX,AX
    JMP FOR
    
    
    BREAK1:
    MOV AH,9
    LEA DX,S
    INT 21H
    
    MOV AX,BX 
    MOV CX,0
    MOV BX,10
    
    ST:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX,0
    JE PRINT
    JMP ST
    
   
    PRINT:
    POP DX
    ADD DX,30H
    MOV AH,2
    INT 21H
    LOOP PRINT
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
