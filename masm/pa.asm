DATA SEGMENT
MSG DB "ENTER STRING:$"
MSG1 DB 0AH, "STRING IS PALINDROME$"
MSG2 DB 0AH, "STRING IS NOT PALINDROME$"
DATA ENDS
DATA SEGMENT
ASSUME CS:CODE, DS:DATA
START: MOV AX,DATA
MOV DS, AX
MOV DX, OFFSET MSG
MOV AH, 09H
INT 21H
MOV CL, 00H
MOV DI, 2000H
MOV SI, 1000H
UP: MOV AH, 01H
INT 21H
MOV [SI], AL
MOV [DI],AL
INC SI
INC DI
INC CL
CMP AL, 0DH
JNZ UP
MOV SI, 1000H
SUB DI, 02H
DEC CL
UP1: MOV BL, [SI]
CMP BL ,[DI]
JNZ  NOTPAL
INC SI
DEC DI
DEC CL
JZ DOWN
JMP UP1
