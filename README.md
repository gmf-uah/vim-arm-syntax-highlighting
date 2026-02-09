"# vim-arm-syntax-highlighting

ARM Assembly syntax highlighting for Vim, ported from [Dan C. Underwood's ARM VS Code extension](https://marketplace.visualstudio.com/items?itemName=dan-c-underwood.arm).

## Features

This Vim syntax plugin provides comprehensive syntax highlighting for ARM assembly code, including:

- **ARM and AArch64 instruction sets** with full support for condition codes
- **Instruction variants**: Arithmetic, logical, memory, branch, and control instructions
- **Condition codes**: `ne`, `eq`, `cs`, `hs`, `cc`, `lo`, `mi`, `pl`, `vs`, `vc`, `hi`, `ls`, `lt`, `le`, `gt`, `ge`, `al`
- **Instruction modifiers**: Support for instructions with condition codes and 's' suffix (e.g., `addnes`, `movs`, `ldrbeq`)
- **Registers**: ARM registers (r0-r15, sp, lr, pc) and AArch64 registers (x0-x31, w0-w31)
- **Number formats**: Decimal, hexadecimal (0x or &), binary (0b)
- **Comment styles**: `;`, `@`, `//`, and `/* */`
- **Assembler directives**: `.globl`, `.section`, `.text`, `.data`, etc.
- **Labels**: Words ending with `:`

## Installation

### Using a Plugin Manager

#### vim-plug
Add to your `.vimrc`:
```vim
Plug 'gmf-uah/vim-arm-syntax-highlighting'
```

Then run `:PlugInstall`

#### Vundle
Add to your `.vimrc`:
```vim
Plugin 'gmf-uah/vim-arm-syntax-highlighting'
```

Then run `:PluginInstall`

#### Pathogen
```bash
cd ~/.vim/bundle
git clone https://github.com/gmf-uah/vim-arm-syntax-highlighting.git
```

### Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/gmf-uah/vim-arm-syntax-highlighting.git
```

2. Copy the files to your Vim directory:
```bash
mkdir -p ~/.vim/syntax ~/.vim/ftdetect
cp vim-arm-syntax-highlighting/syntax/arm.vim ~/.vim/syntax/
cp vim-arm-syntax-highlighting/ftdetect/arm.vim ~/.vim/ftdetect/
```

## Configuration

### Automatic File Type Detection

The plugin automatically detects ARM assembly files with the following extensions:
- `.s`
- `.S`
- `.asm`
- `.sx`

If you need to manually set the file type for a file, use:
```vim
:set filetype=arm
```

### Adding to .vimrc

To ensure syntax highlighting is enabled, add to your `.vimrc`:
```vim
syntax on
filetype plugin on
```

### Customizing Colors

You can customize the highlighting colors by adding highlight group definitions to your `.vimrc`. The available highlight groups are:

```vim
" Examples of color customization
hi armComment       ctermfg=gray    guifg=#808080
hi armInstruction   ctermfg=cyan    guifg=#00ffff
hi armBranchInst    ctermfg=yellow  guifg=#ffff00
hi armMemoryInst    ctermfg=green   guifg=#00ff00
hi armRegister      ctermfg=blue    guifg=#0000ff
hi armNumber        ctermfg=magenta guifg=#ff00ff
hi armLabel         ctermfg=red     guifg=#ff0000
hi armDirective     ctermfg=cyan    guifg=#00ffff
```

Available highlight groups:
- `armComment` - Comments
- `armInstruction` - Arithmetic and logical instructions
- `armBranchInst` - Branch instructions (b, bl, etc.)
- `armMemoryInst` - Memory instructions (ldr, str, etc.)
- `armMultipleInst` - Multiple load/store instructions
- `armRegister` - CPU registers
- `armNumber` - Numeric constants
- `armString` - String literals
- `armLabel` - Code labels
- `armDirective` - Assembler directives
- `armPreprocessor` - Preprocessor directives
- `armNOP` - NOP instructions
- `armCPUInst` - CPU control instructions

## Examples

The syntax highlighter correctly highlights:

```asm
@ Comments with @
; Comments with semicolon
// C++ style comments
/* Multi-line
   C-style comments */

.global _start
.text

_start:
    mov     r0, #42              @ Move immediate
    movs    r1, r2, lsr #1       @ Move with 's' suffix
    addnes  r0, r0, #1           @ Add with 'ne' condition and 's'
    ldrbeq  r3, [r1, #0x80]      @ Load byte with 'eq' condition
    bne     _start               @ Branch if not equal
    
    @ AArch64 examples
    add     x0, x1, x2
    ldr     w3, [x4, #8]
    str     x5, [sp, #-16]!
```

## Testing

To test the syntax highlighting, open the included test file:
```bash
vim dan-c-underwood.arm-1.7.4/test.s
```

## Credits

This Vim syntax plugin is a port of [Dan C. Underwood's ARM syntax highlighting extension](https://github.com/dan-c-underwood/arm-syntax-highlighter) for Visual Studio Code.

Original VS Code extension:
- **Author**: Dan C. Underwood
- **License**: See original extension for licensing details
- **VS Code Marketplace**: [ARM Syntax Highlighter](https://marketplace.visualstudio.com/items?itemName=dan-c-underwood.arm)

## License

This port maintains compatibility with the original extension. Please refer to the original project for licensing information.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## See Also

- [Original VS Code Extension](https://github.com/dan-c-underwood/arm-syntax-highlighter)
- [ARM Architecture Reference Manual](https://developer.arm.com/documentation/)
" 
