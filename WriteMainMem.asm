NAME "Write_in_MainMemory"

.MODEL SMALL
.STACK

.DATA
preludio DB "Questao 8b lista Assembly!", 0AH, 0DH, '$'
quebraLinha DB 0AH, 0DH, '$'

.CODE
label_inicio:

MOV AX, seg preludio
MOV DS, AX

MOV AH,09
LEA DX, preludio
INT 21H

MOV AH, 09
LEA DX, quebraLinha
INT 21H

;;Printando caracter
MOV BX, 61h
PUSH BX

MOV BL, 30h
MOV CL, 0Ah

label_loopPrint:
;Print os 10 primeiros numeros
MOV DH, 00h
MOV DX, BX
MOV AH, 2
INT 21H

MOV AH, 09
LEA DX, quebraLinha
INT 21H

INC BL
DEC CL
JNZ label_loopPrint:

MOV AH, 09
LEA DX, quebraLinha
INT 21H

MOV AX, 61h
MOV CX, 0Ah

;Caso tenha recuperado o valor de BX da MP
;Volte ao loop e print as 10 primeiras letras
POP BX
CMP AX, BX
JE label_loopPrint

END label_inicio