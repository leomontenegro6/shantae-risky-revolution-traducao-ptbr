; Script que insere edições gráficas na rom.
.gba
.open "sarr.gba", 0x08000000

;; Inserindo arquivo de graficos reempacotado pelo "ResourcesUnpacker.exe"
.org 0x08337674
    .incbin "Graficos.editados.bin"

; Ajustes adicionais de expansão de caracteres da fonte.
; #$A1 é um byte de controle que ainda não descobrimos o que é
; Foi alterado para #$C6 - Ficar de olho para identificar alguma anomalia
.org 0x08024ED8
    cmp r0, 0xC6

; Removendo limitação que impede uso de caracteres acentuados
; da fonte usada no prólogo e nos créditos do jogo.
.org 0x0802422E
    .thumb
    cmp r0, #0xF1

; Salvando a rom modificada.
.close