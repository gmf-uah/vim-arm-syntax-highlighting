ARM Assembly syntax highlighting for Vim, ported from [Dan C. Underwood's ARM VS Code extension](https://marketplace.visualstudio.com/items?itemName=dan-c-underwood.arm).

## Installation

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

The plugin automatically detects ARM assembly files with the following extensions:
- `.s`
- `.S`
- `.asm`
- `.sx`

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

## Testing

To test the syntax highlighting, open the included test file:
```bash
vim dan-c-underwood.arm-1.7.4/test.s
```

## Credits

This Vim syntax plugin is a port of [Dan C. Underwood's ARM syntax highlighting extension](https://github.com/dan-c-underwood/vscode-arm) for Visual Studio Code.

Original VS Code extension:
- **Author**: Dan C. Underwood
- **License**: See original extension for licensing details
- **VS Code Marketplace**: [ARM Syntax Highlighter](https://marketplace.visualstudio.com/items?itemName=dan-c-underwood.arm)

## License

The MIT License (MIT)

Copyright 2026 Grant Fink

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
