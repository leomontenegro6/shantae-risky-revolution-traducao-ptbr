:: Arquivo .bat que remonta a rom traduzida.
@echo off
echo ==Gerando rom traduzida.==

del sarr.gba
copy orig.gba sarr.gba

echo ==Inserindo graficos.==
.\Ferramentas\armips-lzss\armips-lzss-v1.exe .\Asm\graficos.asm

echo ==Inserindo textos traduzidos.==
.\Ferramentas\armips-lzss\armips-lzss-v1.exe .\Asm\script.asm

echo Done.