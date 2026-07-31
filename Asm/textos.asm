; Script de inserção do textos traduzidos na rom.
.gba
.open "sarr.gba", 0x08000000

.loadtable "./Tabelas/textos_inventario_loja_destinos.tbl"
.if termos == "adaptados"
    .include "./Asm/Scripts/Editados/script.asm"
.elseif termos == "originais"
    .include "./Asm/Scripts/EditadosTermosOriginais/script.asm"
.endif

.loadtable "./Tabelas/textos.tbl"
.if termos == "adaptados"
    .include "./Asm/Scripts/Editados/script_2.asm"
.elseif termos == "originais"
    .include "./Asm/Scripts/EditadosTermosOriginais/script_2.asm"
.endif

.loadtable "./Tabelas/textos_inventario_loja_destinos.tbl"
.if termos == "adaptados"
    .include "./Asm/Scripts/Editados/script_3.asm"
.elseif termos == "originais"
    .include "./Asm/Scripts/EditadosTermosOriginais/script_3.asm"
.endif

.loadtable "./Tabelas/textos_prologo_creditos.tbl"
.if termos == "adaptados"
    .include "./Asm/Scripts/Editados/script_4.asm"
.elseif termos == "originais"
    .include "./Asm/Scripts/EditadosTermosOriginais/script_4.asm"
.endif

.close