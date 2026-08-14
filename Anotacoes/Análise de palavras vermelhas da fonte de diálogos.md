# Análise de palavras vermelhas da fonte de diálogos

Tem cerca de 400 palavras maiúsculas vermelhas ao todo.

Dessas, é usado praticamente o alfabeto inteiro. E a maioria das letras maiúsculas acentuadas também.

A fonte do arquivo 315 possui letras pretas e vermelhas separadamente, com o jogo usando a letra vermelha se a palavra for antecedida de asterisco (ex.: *VERMELHO). Apenas as letras A-Z vermelhas maiúsculas estão disponíveis.

Expandir os tiles da fonte para adicionar letras vermelhas maiúsculas acentuadas só funciona até um certo ponto. E teve pelo menos um lugar que deu bugs de tiles por conta da expansão. Então expandir ainda mais poderia causar ainda mais bugs.

Dito isso, há duas abordagens possíveis:

1. Remover todas as ocorrências de palavras maiúsuclas vermelhas, e colocar no lugar as mesmas palavras maiúsculas envoltas em aspas duplas.
2. Aproveitar os poucos espaços disponíveis/não-usados da fonte, e adicionar os caracteres vermelhos maiúsculos neles, priorizando os mais essenciais/utilizados.

Considerando que a fonte foi expandida como explicado [aqui](Anotacoes/Expandir fontes.md), a segunda abordagem talvez se torne viável. Através ela, foi possível adicionar 7 caracteres vermelhos maiúsculos (-, Ç, Á, Â, Ã, Í, Ê), dos cerca de 10 necessários ao todo (faltou Ó, Ô, Õ e Ú). Isso permitiu acentuar a maioria das palavras vermelhas maiúsculas, porém infelizmente haverão umas exceções menores aqui e ali. Além disso, não foi testado se a expansão da fonte funcionaria na versão de PC quando jogando com assets originais de GBA, logo talvez a primeira abordagem seja necessária para esse caso.

Para a tradução da versão de GBA do jogo, a segunda abordagem foi usada. Pra isso, tomamos nota dos valores hexadecimais que, quando usados em combinação com palavras iniciando com asterisco, resulta nos novos caracteres sendo exibidos. Isso resultou nos scripts contendo palavras assim:

```
*PEDRArPOMES (PEDRA-POMES)
*CA'ADORES (CAÇADORES)
*LAVzPOLIS (LAVÁPOLIS)
*LANTEJOULäNDIA (LANTEJOULÂNDIA)
*BOTëO (BOTÃO)
*RELïQUIAS (RELÍQUIAS)
*TRèS (TRÊS)
```