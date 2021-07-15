Dosseg
.model small
.stack 100h
.code
label_Inicio:
MOV AX, @DATA
MOV DS, AX
MOV DX, OFFSET fileName
XOR CX, CX ;Atributo do arquivo padrao (somente leitura)
MOV AH, 3Ch ;Funcao DOS para criar arquivo
INT 21h
JC fileErrorA
MOV DX, OFFSET fileName
MOV AL, 2 ;Atributo de modo de acessor R/W
MOV AH, 3Dh ;Funcao DOS para abrir arquivo
INT 21h
JC fileErrorB
MOV fileHandle, AX
MOV DX, OFFSET impress
MOV BX, fileHandle
MOV CX, 51 ;Tamanho da informacao a ser gravada
MOV AH, 40h ;Funcao DOS para gravar em arquivo
INT 21h
JC fileErrorC
MOV BX, fileHandle
MOV AH, 3Eh ;Funcao DOS para fechar o arquivo
INT 21h
JC fileErrorD
MOV DX, OFFSET sucess ;Sucesso em todas as operacoes
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H
MOV AX, 4C00h ;Finaliza o programa
INT 21h
fileErrorA: ;Erro ao criar o arquivo
MOV DX, OFFSET errorA
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H
fileErrorB: ;Erro ao acessar o arquivo
MOV DX, OFFSET errorB
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H
fileErrorC: ;Erro ao escrever no arquivo
MOV DX, OFFSET errorC
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H
fileErrorD: ;Erro ao fechar o arquivo
MOV DX, OFFSET errorD
MOV AH, 09h
INT 21h
MOV AX, 4C01h
INT 21H
.data
fileName DB "E:\Arquivo\AssemblyFile.txt", 0 ; local de criacao do arquivo:
fileHandle DW ? ;Variavel que guarda manipulador de arquivo:
; string a ser gravada no arquivo gerado: (contem 51bytes)
impress DB "Escrevendo em arquivo txt atraves do montador x86!$", 0
; string de debugging de manipulacao de arquivo
errorA DB "Ocorreu um erro durante a manipulacao do arquivo - Ao criar$"
errorB DB "Ocorreu um erro durante a manipulacao do arquivo - Ao acessar$"
errorC DB "Ocorreu um erro durante a manipulacao do arquivo - Ao escrever$"
errorD DB "Ocorreu um erro durante a manipulacao do arquivo - Ao fechar$"
sucess DB "O programa obteve sucesso em todas as operacoes - Arquivo Criado e Dados Gravados$"
end label_Inicio