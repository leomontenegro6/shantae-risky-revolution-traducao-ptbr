# Expandir fontes

Tomando o arquivo 315, da fonte de diálogos principais, ao abrir ela com um editor hexadecimal, temos o seguinte cabeçalho:

- No offset 0x02, ele é o ponteiro de posição de início dos tiles da fonte. Seu valor original é 62, mas Taihen aumentou pra 76.
  - 0x76 - 0x62 = 0x14 (20 em decimal)
- No offset 0x04, ele é o tamanho do bloco de tiles da fonte. Seu valor original é 9D, mas Taihen aumentou pra DC
  - 0xDC - 0x9D = 0x3F (63 em decimal)

Se esses valores do cabeçalho forem incrementados, então a partir do offset 0x314, é necessário incluir novas WORDs para cada caractere adicionado. Segundo o Taihen, para cada novo caractere, é preciso incluir quatro WORDs (ou 8 bytes).

Por exemplo, as seguintes DWORDs foram adicionadas entre os offsets 0x314 e 0x3B6:

9D 00 9D 00 9E 00 9E 00 9F 00 9F 00 A0 00 A0 00
A1 00 A1 00 A2 00 A2 00 A3 00 A3 00 A4 00 A4 00
A5 00 A5 00 A6 00 A6 00 A7 00 A7 00 A8 00 A8 00
A9 00 A9 00 AA 00 AA 00 AB 00 AB 00 AC 00 AC 00
AD 00 AD 00 AE 00 AE 00 AF 00 AF 00 B0 00 B0 00
B1 00 B1 00 B2 00 B2 00 B3 00 B3 00 B4 00 B4 00
B5 00 B5 00 B6 00 B6 00 B7 00 B7 00 B8 00 B8 00
B9 00 B9 00 BA 00 BA 00 BB 00 BB 00 BC 00 BC 00
BD 00 BD 00 BE 00 BE 00 BF 00 BF 00 C0 00 C0 00
C1 00 C1 00 C2 00 C2 00 C3 00 C3 00 C4 00 C4 00
C5 00 C5