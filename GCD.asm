.MODEL SMALL
.STACK 100H
.DATA
S DB 10,13,'$'
M DW ?
N DW ?
.CODE

DEC_IN PROC
    XOR BX,BX
    FOR:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE BREAK
    
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    
    POP AX
    AND AX,000FH
    ADD BX,AX
    JMP FOR
    
    BREAK:
    RET

DEC_IN ENDP

DEC_OUT PROC 
    MOV CX,0
    MOV AX,BX
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
    
    RET
DEC_OUT ENDP



MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CALL DEC_IN  ;INPUT M
    MOV AX,BX
    PUSH AX      ;SAVE M ON STACK
    
    MOV AH,9
    LEA DX,S
    INT 21H
    
    CALL DEC_IN ;INPUT N
    MOV AX,BX
    PUSH AX     ;SAVE N ON STACK
    
    XOR BX,BX
    
    POP BX
    POP AX
    
    CMP AX,BX
    JL SWAP
    JMP GCD 
    
    
    SWAP:
    MOV M,AX
    MOV AX,BX
    MOV BX,M
    
    GCD:
    XOR DX,DX
    MOV N,BX
    DIV N
    CMP DX,0
    JE FOUND
    MOV AX,BX
    MOV BX,DX
    JMP GCD
    
    FOUND:
    
    MOV AH,9
    LEA DX,S
    INT 21H
    MOV AX,N
    CALL DEC_OUT
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
