; Script de inserção do textos traduzidos na rom.
.gba
.open "sarr.gba", 0x08000000
.loadtable "./Tabelas/textos.tbl"

.include "./Asm/Scripts/Editados/script.asm"
.include "./Asm/Scripts/Editados/script_2.asm"

.close