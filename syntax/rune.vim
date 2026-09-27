if exists("b:current_syntax")
  finish
endif

" Rune intentionally follows Rust's syntax closely; reuse its mature Vim syntax
" until a dedicated Rune Tree-sitter grammar is available.
runtime! syntax/rust.vim
let b:current_syntax = "rune"
