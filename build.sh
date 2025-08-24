#!/bin/bash

echo "== Gerando rom traduzida. =="

# Remove rom antiga
rm -f sarr.gba

# Copia rom original
cp orig.gba sarr.gba

echo "== Inserindo graficos. =="
./Ferramentas/armips-lzss/armips ./Asm/graficos.asm

echo "== Inserindo textos traduzidos. =="
./Ferramentas/armips-lzss/armips ./Asm/script.asm

echo "Done."