# Debugging para solucionar fonte do menu de pausa
by Taihen

A fonte, apesar de ser visualmente igual a dos diálogos, são outras.
Neste caso, não há originalmente tiles em branco para por acento.
Também não há espaço na tabela de correlação ascii -> dupla de tiles para formar o glyph

Aqui, anotações e estudo para achar solução.

## Mapa da Memória Gráfica do GBA

```
Paletas (512 bytes @ 0x05000000)
 ├── 0x05000000 – 0x050001FF : 256 cores para Backgrounds (BG Palette)
 └── 0x05000200 – 0x050003FF : 256 cores para Sprites (OBJ Palette)

VRAM (96 KB @ 0x06000000)
 ├── 0x06000000 – 0x0600FFFF : 64 KB Background VRAM
 │     ├── Charblocks (tiles) : blocos de 16 KB cada
 │     │     ├── 0x06000000 – 0x06003FFF : Charblock 0
 │     │     ├── 0x06004000 – 0x06007FFF : Charblock 1
 │     │     ├── 0x06008000 – 0x0600BFFF : Charblock 2
 │     │     └── 0x0600C000 – 0x0600FFFF : Charblock 3
 │     └── Screenblocks (mapas) : blocos de 2 KB (total 32 SBs)
 │           Exemplo:
 │           0x06000000 – 0x060007FF : Screenblock 0
 │           ...
 │           0x0600F800 – 0x0600FFFF : Screenblock 31
 │
 └── 0x06010000 – 0x06017FFF : 32 KB OBJ VRAM (tiles de sprites)

OAM (1 KB @ 0x07000000)
 ├── 0x07000000 – 0x070003FF : Object Attribute Memory
      (tabelas de posição, tile, prioridade, flips dos sprites)
```      

## Registradores do canal DMA3

| Registrador | Endereço    | Função                                  |
|-------------|-------------|-----------------------------------------|
| DMA3SAD     | 0x040000D4  | Endereço de origem (Source Address)     |
| DMA3DAD     | 0x040000D8  | Endereço de destino (Destination Addr.) |
| DMA3CNT_L   | 0x040000DC  | Quantidade de unidades (Word Count)     |
| DMA3CNT_H   | 0x040000DE  | Controle (Control Register)             |

- **DMA3CNT_L** → Define o tamanho da transferência (em halfwords ou words).  
- **DMA3CNT_H** → Define parâmetros de controle (modo, trigger, incremento, enable etc.).  
- **DMA3CNT** também pode ser acessado como 32 bits, unindo `CNT_L` e `CNT_H`.  

## Debugging

Bloco de tiles iniciando em 0x9b9f08
Carrega ao pressionar start
- Transferdos 3968 bytes ($0F80)
- No DMA configurado 1984 unidades ($07C0)
- - Cada unidade 2 bytes - Modo 16 bits

Carregados para VRAM 0xd080 (cpu 0x600d080 - charblock 3)
- Carregados na VRAM até 0xdfff
- Utiliza canal 3 de DMA
Estes gráficos consistem unicamente na fonte

O espaço na VRAM antes disso, aparentemente não está sendo usado nesse momento
Contém lixo da tela anterior e é reatulizado quando conveniente
Hipótese: De VRAM 0xc420 a 0xdc7f poderia ser usado por nós

Em rom 0x9b9ca8, seis bytes carregados junto com os gráficos da fonte: 00 00 4B 00 7C 00
- 4B 00 é a origem dos dados para o DMA
- 7C 00 é o tamanho do DMA

Como a partir de 4B 00 chega no endereço de origem?

```
8021CE6  60 88          LDRH R0, [R4, #$02]         ; Carrega o $4B em R0
8021CE8  C0 00          LSL R0, R0, #$03            ; Shift Left 3 vezes -> $258
8021CEA  08 30          ADD R0, #$08                ; Soma com #$08 -> $260
8021CEC  22 18          ADD R2, R4, R0              ; Soma com o valor em R4 ($089B9CA8), guarda em R2
                                                    ; Resultado -> $089B9F08 (o endereço da origem)
```

Depois estudar melhor esse valor que estava em R4 -> $089B9CA8
- Possivelmente é alguma referência de região da rom

Dados coletados até aqui ajudam a no futuro fazer os próprios DMAs

Mas e o destino? Encontrar de onde veio 0x600d080 (no registrador de destino do DMA3)