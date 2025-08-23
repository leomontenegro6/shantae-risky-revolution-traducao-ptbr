; Script que insere edições gráficas na rom.
.gba
.open "sarr.gba", 0x08000000

; Tela-título.
.org 0x088EC0DC
    .incbin "Graficos/Editados/Tela-titulo.gba"

; Fonte dos diálogos.
.org 0x088F3760
    .incbin "Graficos/Editados/Fonte dialogos.gba"
.org 0x088F344C
    db 0xC5

; Salvando a rom modificada.
.close