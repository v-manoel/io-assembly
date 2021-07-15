NAME Write_In_HardDisk.ASM 

.MODEL SMALL
.STACK
.CODE

label_Inicio:
MOV AX, @DATA
MOV DS, AX

MOV DX, OFFSET fileName
XOR CX, CX ;Atributo do arquivo padrao (somente leitura)
MOV AH, 3Ch ;Funcao DOS para criar arquivo
INT 21h

JC fileError

MOV DX, OFFSET fileName
MOV AL, 2 ;Atributo de modo de acessor R/W
MOV AH, 3Dh ;Funcao DOS para abrir arquivo
INT 21h

JC fileError

MOV fileHandle, AX
MOV DX, OFFSET impress
MOV BX, fileHandle
MOV CX, 51 ;Tamanho da informacao a ser gravada
MOV AH, 40h ;Funcao DOS para gravar em arquivo
INT 21h

JC fileError

MOV BX, fileHandle
MOV AH, 3Eh ;Funcao DOS para fechar o arquivo
INT 21h

JC fileError

MOV AX, 4C00h ;Finaliza o programa
INT 21h

fileError:
MOV DX, OFFSET error
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H 

.DATA
;Definindo local do disco em que sera criado o arquivo:
fileName DB "C:\emu8086\vdrive\C\AssemblyFile.txt", 0
;Variavel que guarda manipulador de arquivo:
fileHandle DW ?
;Variavel contendo string a ser gravada no arquivo gerado:
impress DB "Escrevendo em arquivo txt atraves do montador x86!", 0 ;(contem 51bytes) ;
Variavel contendo string de erro de manipulacao de arquivo 
error DB "Ocorreu um erro durante a manipulacao do arquivo$"

END label_Inicio
