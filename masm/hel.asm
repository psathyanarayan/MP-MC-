
.model tiny                              ;code, data & program in 1 64K segment

.code                                       ;code segment

MAIN PROC
                       
    MOV AH, 09h                    ;function to display a string
    MOV DX, offset message  ;offset of Message string terminated with $

    int 21h                                 ;DOS interrupt
    MOV AH, 4ch                    ;funtion to terminate
    int 21h                                 ;DOS interrupt

ENDP
message db "Hello World $"   ;Message to be displayed terminated with $(indicates end of string)

END MAIN
