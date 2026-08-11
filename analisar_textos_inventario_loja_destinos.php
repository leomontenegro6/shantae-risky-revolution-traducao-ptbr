<?php

$textos = file_get_contents('textos_inventario_loja_destinos.txt');

// Analisar todos os caracteres únicos, e contar ocorrências
$char_count = [];
$length = mb_strlen($textos, 'UTF-8');

for ($i = 0; $i < $length; $i++) {
    $char = mb_substr($textos, $i, 1, 'UTF-8');
    if (!isset($char_count[$char])) {
        $char_count[$char] = 0;
    }
    $char_count[$char]++;
}

// Ordenar por ordem decrescente de ocorrências
arsort($char_count);

// Exibir os resultados
foreach ($char_count as $char => $count) {
    $hex = strtoupper(bin2hex(mb_convert_encoding($char, 'UTF-8')));
    $display_char = $char === "\n" ? '\n' : $char;
    echo "Caractere: '{$display_char}' | Hex: {$hex} | Ocorrências: {$count}\n";
}