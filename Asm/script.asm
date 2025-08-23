; Script de inserção do script traduzido na rom.
.gba
.open "sarr.gba", 0x08000000
.loadtable "./Tabelas/script.tbl"

org 0x0806E8A8
.stringn "Ahh, steve doido pira!ÀÁÂÃ"
db 0x00

.close