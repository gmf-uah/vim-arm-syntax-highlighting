" Vim filetype detection file
" Language:     ARM Assembly
" Maintainer:   Ported from Dan C. Underwood's VS Code extension

" Detect ARM assembly files
au BufRead,BufNewFile *.s,*.S,*.asm,*.sx set filetype=arm
