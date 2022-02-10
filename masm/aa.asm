
DATA SEGMENT
MSG1 DB 10,13,'ENTER THE STRING: $'
MSG2 DB 10,13,'STRING IS PALINDROME$'
MSG3 DB 10,13,'STRING IS NOT PALINDROME$'
NEW DB 10,13,'$'
INST DB 20 DUP(0)
DATA ENDS
CODE SEGMENT              
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
LEA DX,MSG1
MOV AH,09H
INT 21H
MOV BX,00
UP:
MOV AH,01H
INT 21H
CMP AL,0DH
JE DOWN
MOV [INST+BX],AL
INC BX
LOOP UP
DOWN:
MOV DI,0
DEC BX
JNZ CHECK
CHECK:
MOV AL,[INST+BX]
CMP AL,[INST+DI]
JNE FAIL
INC DI
DEC BX
JNZ CHECK
LEA DX,NEW
MOV AH,09H
INT 21H
LEA DX,MSG2
MOV AH,09H
INT 21H
JMP FINISH
FAIL:
LEA DX,MSG3
MOV AH,09H
INT 21H
FINISH:
INT 3
CODE ENDS
END START
END