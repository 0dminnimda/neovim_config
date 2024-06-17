;; extends

; SEE: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md#adding-queries
; SEE: https://github.com/nvim-treesitter/nvim-treesitter#highlight

; Good references:
; https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries/python
; https://github.com/tree-sitter/tree-sitter-python/tree/master/queries/

; How this works:
; SEE: https://tree-sitter.github.io/tree-sitter/using-parsers#query-syntax
; also check out :InspectTree

(ellipsis) @ellipsis
(none) @none

(class_definition
  name: (identifier) @type.definition)

(class_definition
  superclasses: (argument_list
    (identifier) @type.inherited))

; Raw strings are almost always used in context of regula expressions
; Here it's better to add the highlighting than not
(string
  (string_start) @_raw_string_start
  (string_content) @string.regexp
  (#lua-match? @_raw_string_start "r"))

; TODO: builtin version of @variable.member
; @constant.builtin
; ((identifier) @foo (#set! "type" "parameter"))
; ((identifier) @foo (#set! @foo "kind" "parameter"))
; ((node1) @left (node2) @right (#set! "type" "pair"))
; ((codeblock) @markup.raw.block (#set! "priority" 90))

