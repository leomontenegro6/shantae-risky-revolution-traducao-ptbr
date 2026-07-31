:: Arquivo .bat que remonta a rom traduzida.
@echo off
echo ==Gerando rom traduzida.==

set termos=adaptados
IF "%1" == "o" SET termos=originais

del sarr.gba
copy orig.gba sarr.gba

echo ==Inserindo graficos.==
call repack.bat %termos%
.\Ferramentas\armips-lzss\armips-lzss-v1.exe .\Asm\graficos.asm -strequ termos %termos%

echo ==Inserindo textos traduzidos.==
.\Ferramentas\armips-lzss\armips-lzss-v1.exe .\Asm\textos.asm -strequ termos %termos%

echo Done.