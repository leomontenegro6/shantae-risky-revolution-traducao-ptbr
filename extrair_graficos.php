<?php
$graficos = [
    (object)['nome' => 'All Players Press B to Rematch', 'offset' => '0x3373D2', 'tiles' => '1x26', 'codec' => '4bpp'],
    (object)['nome' => 'Plus MP', 'offset' => '0x40A7A4', 'tiles' => '1x2', 'codec' => '4bpp'],
    (object)['nome' => 'Fonte 1', 'offset' => '0x8EAFA4', 'tiles' => '1x108', 'codec' => '4bpp'],
    (object)['nome' => 'Tela-titulo', 'offset' => '0x8EC0DC', 'tiles' => '1x385', 'codec' => '8bpp'],
    (object)['nome' => 'Fonte 2', 'offset' => '0x8F3780', 'tiles' => '1x156', 'codec' => '4bpp'],
    (object)['nome' => 'Fonte 3', 'offset' => '0x8F9438', 'tiles' => '1x207', 'codec' => '4bpp'],
    (object)['nome' => 'Normal Beach Costume', 'offset' => '0x9035FC', 'tiles' => '8x27', 'codec' => '8bpp'],
    (object)['nome' => 'Establishing link', 'offset' => '0x9A0474', 'tiles' => '1x81', 'codec' => '4bpp'],
    (object)['nome' => 'Ready Press A Button to Transfer', 'offset' => '0x9A12C0', 'tiles' => '1x117', 'codec' => '4bpp'],
    (object)['nome' => 'Link Error', 'offset' => '0x9A2D54', 'tiles' => '1x366', 'codec' => '8bpp'],
    (object)['nome' => 'Fonte 4', 'offset' => '0x9B9F08', 'tiles' => '1x124', 'codec' => '4bpp'],
    (object)['nome' => 'Inventory', 'offset' => '0x9BEA00', 'tiles' => '1x377', 'codec' => '8bpp'],
    (object)['nome' => 'Inventory Dance List', 'offset' => '0x9C9A94', 'tiles' => '1x62', 'codec' => '8bpp'],
    (object)['nome' => 'Fonte Prologo', 'offset' => '0xA46458', 'tiles' => '1x211', 'codec' => '4bpp'],
    (object)['nome' => 'Chapter 1', 'offset' => '0xA48D24', 'tiles' => '1x415', 'codec' => '8bpp'],
    (object)['nome' => 'Chapter 2', 'offset' => '0xA4FD58', 'tiles' => '1x479', 'codec' => '8bpp'],
    (object)['nome' => 'Chapter 3', 'offset' => '0xA57D5C', 'tiles' => '1x473', 'codec' => '8bpp'],
    (object)['nome' => 'Chapter 4', 'offset' => '0xA5FBC8', 'tiles' => '1x451', 'codec' => '8bpp'],
    (object)['nome' => 'File Select', 'offset' => '0xB37EE0', 'tiles' => '8x8', 'codec' => '4bpp'],
    (object)['nome' => 'New Game CH Time', 'offset' => '0xB389B0', 'tiles' => '20x12', 'codec' => '4bpp'],
    (object)['nome' => 'Clear', 'offset' => '0xB3AC2C', 'tiles' => '1x39', 'codec' => '4bpp'],
    (object)['nome' => 'Copy', 'offset' => '0xB3B210', 'tiles' => '1x39', 'codec' => '4bpp'],
    (object)['nome' => 'Mensagens Menus', 'offset' => '0xB3BF48', 'tiles' => '1x726', 'codec' => '4bpp'],
    (object)['nome' => 'Saving Do Not Turn Off', 'offset' => '0xB4205C', 'tiles' => '20x9', 'codec' => '4bpp'],
    (object)['nome' => 'Game Over', 'offset' => '0xCEC0C0', 'tiles' => '1x271', 'codec' => '8bpp'],
    (object)['nome' => 'Try Again', 'offset' => '0xCF6C14', 'tiles' => '1x49', 'codec' => '4bpp'],
    (object)['nome' => 'Yes No', 'offset' => '0xCF72DC', 'tiles' => '9x12', 'codec' => '4bpp'],
    (object)['nome' => 'Destinations', 'offset' => '0xCF8854', 'tiles' => '1x372', 'codec' => '8bpp'],
    (object)['nome' => 'Buy Stuff', 'offset' => '0xE09F4C', 'tiles' => '1x378', 'codec' => '8bpp'],
    (object)['nome' => 'Mensagens Compras', 'offset' => '0xE10348', 'tiles' => '12x22', 'codec' => '4bpp'],

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