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

// Extract, from the texts variable, only the words
// that start with *
$red_words_raw = [];
preg_match_all('/\*([^\s\*]+)/u', $texts, $matches);
if (!empty($matches[1])) {
    foreach ($matches[1] as $word) {
        $word = preg_replace('/[\.,!\?\^]+$/u', '', $word);
        if ($word !== '') {
            $red_words_raw[] = $word;
        }
    }
}

// Count alphabet letters from all red words (before deduplication)
$letter_counts = [];
foreach ($red_words_raw as $word) {
    preg_match_all('/\p{L}/u', $word, $letterMatches);
    foreach ($letterMatches[0] as $letter) {
        $letter = mb_strtoupper($letter, 'UTF-8');
        $letter_counts[$letter] = ($letter_counts[$letter] ?? 0) + 1;
    }
}
ksort($letter_counts, SORT_STRING | SORT_FLAG_CASE);
//arsort($letter_counts, SORT_NUMERIC);

// Optional: remove duplicates and sort red words
$red_words = array_unique($red_words_raw);
sort($red_words, SORT_STRING | SORT_FLAG_CASE);

print_r($red_words);

echo "\nLetter counts:\n";
print_r($letter_counts);
