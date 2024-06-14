;; extends

; SEE: https://tree-sitter.github.io/tree-sitter/syntax-highlighting#language-injection
; It's like "WOW! You can do that?!"

(string
  (string_start) @_raw_string_start
  (string_content) @injection.content
  (#lua-match? @_raw_string_start "r")
  (#set! injection.language "regex"))

