;; extends

; SEE: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md#adding-queries
; SEE: https://github.com/nvim-treesitter/nvim-treesitter#highlight

(ellipsis) @ellipsis

(class_definition
  name: (identifier) @type.definition)

(class_definition
  superclasses: (argument_list
    (identifier) @type.inherited))

; TODO: builtin version of @variable.member

