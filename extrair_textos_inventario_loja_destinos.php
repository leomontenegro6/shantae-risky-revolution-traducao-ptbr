<?php

$scripts = [
    file_get_contents('Asm/Scripts/Editados/script.asm'),
    file_get_contents('Asm/Scripts/Editados/script_3.asm'),
];

$texts = [];
foreach ($scripts as $index => $script) {
    $lines = explode("\n", $script);
    foreach ($lines as $line) {
        preg_match_all('/"([^"]*)"/', $line, $matches);
        foreach ($matches[1] as $match) {
            if (str_starts_with($match, 'ERRO: ')) {
                continue;
            }
            $texts[] = $match;
        }
    }
}

file_put_contents('textos_inventario_loja_destinos.txt', implode("\n", $texts));