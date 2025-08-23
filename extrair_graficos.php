<?php
$graficos = [
    (object)['nome' => 'Tela-titulo', 'offset' => '0x8EC0DC', 'tiles' => '1x385', 'codec' => '8bpp'],
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