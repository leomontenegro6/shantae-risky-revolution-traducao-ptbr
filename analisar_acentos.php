<?php

$scripts = [
    file_get_contents('Asm/Scripts/Editados/script_2.asm'),
    file_get_contents('Asm/Scripts/EditadosTermosOriginais/script_2.asm'),
];

$texts = '';
foreach ($scripts as $index => $script) {
    $lines = explode("\n", $script);
    foreach ($lines as $line) {
        preg_match_all('/"([^"]*)"/', $line, $matches);
        foreach ($matches[1] as $match) {
            if (str_starts_with($match, 'ERRO: ')) {
                continue;
            }
            $texts .= $match . "\n";
        }
    }
}

// Remove uppercase words that start with * from the extracted texts
$clean_text = preg_replace('/\*\p{Lu}[\p{L}\p{M}-]*[^\s\p{L}\p{M}-]*/u', '', $texts);
$clean_text = preg_replace('/[ \t]+/u', ' ', $clean_text);
$clean_text = preg_replace('/[ \t]+([\.,!\?;:])/u', '$1', $clean_text);
$clean_text = trim($clean_text);

// Count letters (both uppercase and lowercase) and punctuation in the cleaned text
$char_counts = [];
preg_match_all('/[\p{L}\p{P}]/u', $clean_text, $charMatches);
foreach ($charMatches[0] as $char) {
    $char_counts[$char] = ($char_counts[$char] ?? 0) + 1;
}
uksort($char_counts, function ($a, $b) {
    return mb_ord($a, 'UTF-8') <=> mb_ord($b, 'UTF-8');
});

// Show cleaned text and character counts
echo $clean_text;

echo "\n\nCharacter counts:\n";
print_r($char_counts);
