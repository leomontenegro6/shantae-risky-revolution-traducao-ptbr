<?php
$graficos = [
    (object)['nome' => 'All Players Press B to Rematch', 'offset' => '0x3373D2', 'tiles' => '1x26', 'codec' => '4bpp'],
];

foreach($graficos as $g) {
    $caminho = "Graficos/Originais/{$g->nome}.gba";
    $offset_decimal = hexdec(str_replace('0x', '', $g->offset));
    $tiles = explode('x', $g->tiles);
    $codec = $g->codec ?? '4bpp';
    $tile_size = ($codec == '8bpp') ? (64) : (32);
    $tamanho = $tiles[0] * $tiles[1] * $tile_size;

    shell_exec("dd if=\"orig.gba\" of=\"$caminho\" skip=$offset_decimal count=$tamanho bs=1");
}