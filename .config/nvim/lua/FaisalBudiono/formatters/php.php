<?php

declare(strict_types=1);
use PhpCsFixer\Config;

return (new Config())
    ->setRules([
        'array_indentation' => true,
        'array_syntax' => [
            'syntax' => 'short',
        ],
        'blank_line_before_statement' => true,
        'braces_position' => true,
        'compact_nullable_type_declaration' => true,
        'declare_strict_types' => true,
        'indentation_type' => true,
        'method_chaining_indentation' => true,
        'multiline_whitespace_before_semicolons' => true,
        'normalize_index_brace' => true,
        'no_multiline_whitespace_around_double_arrow' => true,
        'no_multiple_statements_per_line' => true,
        'no_spaces_around_offset' => true,
        'no_spaces_inside_parenthesis' => true,
        'no_singleline_whitespace_before_semicolons' => true,
        'no_trailing_comma_in_singleline' => true,
        'no_trailing_whitespace' => true,
        'no_unused_imports' => true,
        'no_whitespace_before_comma_in_array' => true,
        'ordered_imports' => true,
        'return_type_declaration' => true,
        'single_blank_line_at_eof' => true,
        'single_line_empty_body' => true,
        'single_quote' => true,
        'statement_indentation' => true,
        'spaces_inside_parentheses' => true,
        'trim_array_spaces' => true,
        'types_spaces' => true,
        'type_declaration_spaces' => true,
        'whitespace_after_comma_in_array' => [
            'ensure_single_space' => true,
        ],
        '@PSR12' => true,
        '@PER-CS2.0' => true,
        'trailing_comma_in_multiline' => [
            'elements' => ['arguments', 'arrays'],
            // 'elements' => ['arguments', 'array_destructuring', 'arrays', 'match', 'parameters'], // PHP 8.0++
        ],
    ]);
