; Script de inserção do textos traduzidos na rom.
.gba
.open "sarr.gba", 0x08000000

.loadtable "./Tabelas/textos_inventario_loja_destinos.tbl"
.include "./Asm/Scripts/Editados/script.asm"

.loadtable "./Tabelas/textos.tbl"
.include "./Asm/Scripts/Editados/script_2.asm"

.loadtable "./Tabelas/textos_inventario_loja_destinos.tbl"
.include "./Asm/Scripts/Editados/script_3.asm"

.loadtable "./Tabelas/textos_prologo_creditos.tbl"
.include "./Asm/Scripts/Editados/script_4.asm"

.close