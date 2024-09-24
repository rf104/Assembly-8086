.MODEL SMALL
.STACK 100H
.DATA 
S DB 10,13,'$'
M DW 0;
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,0
    WHILE:
    MOV AH,1
    INT 21H
    CMP AL,0DH ; if press enter then it shold move to print section
    JE PRINT
    MOV BX,AX
    PUSH AX
    INC CX ; to know the size of the stack it will help us later when we use loop function of print 
    JMP WHILE

    ;printing the ecah value in a single line
    PRINT:
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AH,2
    POP BX
    MOV DX,BX
    INT 21H
    CMP BX,0
    JE EXIT
    LOOP PRINT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
