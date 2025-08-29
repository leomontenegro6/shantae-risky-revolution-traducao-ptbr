; Script que insere edições gráficas na rom.
.gba
.open "sarr.gba", 0x08000000

; Tela-título.
.org 0x088EC0DC
    .incbin "Graficos/Editados/Tela-titulo.gba"

; Menu principal
.org 0x08B37EE0
    .incbin "Graficos/Editados/File Select.gba"
.org 0x08B389B0
    .incbin "Graficos/Editados/New Game CH Time.gba"

; Fonte dos diálogos.
.org 0x088F3760 ; Endereço original da fonte - Colocaremos 160 bytes a frente
    .fill 160, 0xFF
.org 0x088F3800
    .incbin "Graficos/Editados/Fonte dialogos.gba"
.org 0x088F344A
    db 0x76         ; Ponteiro de posição de início dos tiles da fonte
.org 0x088F344C
    db 0xDC         ; Tamanho do bloco de tiles da fonte

    ; #$A1 é um byte de controle que ainda não descobrimos o que é
    ; Foi alterado para #$C6 - Ficar de olho para identificar alguma anomalia
    .org 0x08024ED8
        cmp r0, 0xC6


; Nova tabela de relação entre índice da fonte o diálogo e tiles 8x16
.org 0x088F3450
    .incbin "Graficos/Editados/Tabela de tiles 8x16.gba"

; Salvando a rom modificada.
.close