.MODEL SMALL
.STACK 100H
.DATA 
ARR DB 10 DUP(?)
S DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,ARR
    MOV CX,0
    
    INP:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE NEW_LINE
    AND AL,0FH
    MOV [SI],AL
    INC SI
    INC CX
    JMP INP
    
    NEW_LINE:
    MOV AH,9
    LEA DX,S
    INT 21H
    
    DEC SI
    OP:
    MOV AH,2
    MOV DL,[SI]
    OR DL,30H
    DEC SI
    INT 21H
    LOOP OP
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
