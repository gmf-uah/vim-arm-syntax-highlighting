" Vim syntax file
" Language:     ARM Assembly
" Maintainer:   Ported from Dan C. Underwood's VS Code extension
" Last Change:  2026-02-09
" Filenames:    *.s *.S *.asm *.sx
" URL:          https://github.com/gmf-uah/vim-arm-syntax-highlighting

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Case insensitive matching for instructions
syn case ignore

" Preprocessor directives
syn match   armPreprocessor     "^\s*[#\.]\(define\|include\|\(end\|el\|else\)\?if\|if\(def\|ndef\)\?\|else\)\>"

" Labels - words ending with :
syn match   armLabel            "^\s*\.?\w\+:\s*\($\|;\)"

" Directives
syn match   armDirective        "\.\(globl\|global\|extern\|weak\|macro\|endm\|purgem\|section\|text\|data\|bss\|arm\|align\|balign\|irp\|rept\|endr\|\(un\)\?req\|error\|short\|\(end\)\?func\|hidden\|type\|cpu\|fpu\|arch\|code\|syntax\|altmacro\|object_arch\|word\|int\|string\|thumb\(_set\)\?\|set\|pragma\|undef\|line\|get\)\>"

" Condition codes
syn keyword armCondition        ne eq cs hs cc lo mi pl vs vc hi ls lt le gt ge al contained

" Arithmetic and logical instructions with condition codes
" Pattern: instruction + optional condition + optional 's'
" Examples: add, addne, adds, addnes
syn match   armInstruction      "\c\<\(v\?\(add\|cvt\|bic\|sub\|trn\|cmp\|cbz\|cbnz\|[us]\?div\|qdmulh\|mul\|ld1\|qadd\|qshrun\|st[1234]\|addw\|mull\|mlal\|rshrn\|swp\|qmovun\|and\|m\(rs\|sr\)\|eor\|rsb\|adc\|sbc\|rsc\|tst\|teq\|cmn\|orr\|mov\|mvn\|neg\|lsr\|lsl\|ror\|asr\)\|mul\|mla\|mull\|smlabb\|rev\(8\|16\)\?\|pld\|adr\|adrl\|vswp\)\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?s\?\>"

" Arithmetic with 's' before condition (e.g., movs, addnes where s comes before condition)
syn match   armInstruction      "\c\<\(v\?\(add\|cvt\|bic\|sub\|trn\|cmp\|cbz\|cbnz\|[us]\?div\|qdmulh\|mul\|ld1\|qadd\|qshrun\|st[1234]\|addw\|mull\|mlal\|rshrn\|swp\|qmovun\|and\|m\(rs\|sr\)\|eor\|rsb\|adc\|sbc\|rsc\|tst\|teq\|cmn\|orr\|mov\|mvn\|neg\|lsr\|lsl\|ror\|asr\)\|mul\|mla\|mull\|smlabb\|rev\(8\|16\)\?\|pld\|adr\|adrl\|vswp\)s\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\>"

" Memory instructions - ldr/str with variants
" Pattern: ldr/str + optional variant (b/h/d) + optional condition
" Examples: ldr, ldrb, ldrbeq, ldreq, strh, strheq
syn match   armMemoryInst       "\c\<v\?\(ldr\|str\)\(d\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\|\(s\?b\|s\?h\)\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\|\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\(s\?b\|s\?h\)\?\)\>"

" AArch64 memory instructions
syn match   armMemoryInst       "\c\<\(ldar[bh]\?\|ldax[pb\(rh\?\)]\|ldn\?p\|ldpsw\|ldr[bh]\?\|ldrsb\|ldrsh\|ldrsw\|ldtr[bh]\?\|ldtrsw\|ldurb\?\|ldursb\|ldursh\|ldursw\|ldx[pr]\|ldxr[bh]\)\>"
syn match   armMemoryInst       "\c\<\(prfu\?m\)\>"
syn match   armMemoryInst       "\c\<\(stlr[bh]\?\|stlx[pb\(rh\?\)]\|stn\?p\|str[bh]\?\|sttr[bh]\?\|stur[nh]\?\|stx[pb\(rh\?\)]\)\>"

" Memory definition directives
syn match   armMemoryInst       "\c\<\(dc[dubi]\([qw]u\?\)\?\|area\|space\|fill\)\>"

" Multiple load/store instructions
syn match   armMultipleInst     "\c\<\(ldm\(ia\)\?\|ldmf[da]\|ldmd[ab]\|ldmea\|ldmib\|ldmed\|v\?\(push\|pop\)\|stm\(ia\)\?\|stmd[ab]\|stmed\|stmfd\|stmib\|smfa\(\.\(n\|w\)\)\?\)\>"

" Branch and control instructions with condition codes
" Examples: b, bne, bl, blx, br
syn match   armBranchInst       "\c\<\(mov\(w\|t\)\?\|pac\(dz\?[a|b]\|ga\|i\([a|b]\(1716\|sp\|z\)\?\)\|z[a|b]\)\|swi\|svc\|hvc\|dmb\|clrex\|dsb\|isb\|tlbi\|b\(l\|l\?x\|l\?r\)\?\|\(i\|e\)\?ret\(aa\|ab\)\?\)\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?s\?\>"
syn match   armBranchInst       "\c\<\(mov\(w\|t\)\?\|pac\(dz\?[a|b]\|ga\|i\([a|b]\(1716\|sp\|z\)\?\)\|z[a|b]\)\|swi\|svc\|hvc\|dmb\|clrex\|dsb\|isb\|tlbi\|b\(l\|l\?x\|l\?r\)\?\|\(i\|e\)\?ret\(aa\|ab\)\?\)s\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\>"

" CPU control instructions
syn match   armCPUInst          "\c\<\(wf[ei]\|cps\(i[de]\)\?\)\>"

" Define directives
syn match   armDefine           "\c\<\(def\(b\|w\|s\)\|equ\s\+.*\.s\)\>"

" Evaluation operator
syn match   armOperator         "="

" NOP instruction with optional condition
syn match   armNOP              "\c\<nop\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|vs\|vc\|hi\|ls\|lt\|le\|gt\|ge\|al\)\?\>"

" Registers - ARM (r0-r15, sp, lr, pc, etc.)
syn match   armRegister         "\c\<\(\(r\|cp\)[0-9]\|r1[0-5]\|a[1-4]\|sl\|sb\|fp\|ip\|sp\|lr\|\(c\|s\)psr\(_c\)\?\|pc\|fpsid\|fpscr\|fpexc\|APSR_nzcv\|sy\)\>"

" Registers - AArch64 (x0-x31, w0-w31, etc.)
syn match   armRegister         "\c\<\([xwbhsdq]\([0-9]\|[12][0-9]\|3[01]\)\|wzr\|xzr\|wsp\|fpsr\|fpcr\)\>"

" NEON/SIMD registers
syn match   armRegister         "\c\<v\([0-9]\|[12][0-9]\|3[01]\)\.\(16b\|8[bh]\|4[sh]\|2[sd]\)\>"

" Register with trailing ! or word boundary
syn match   armRegister         "\c\<\(r\|cp\)\([0-9]\|1[0-5]\)\(!\|\>\)"

" Memory addressing - [register, offset]
syn region  armMemAddr          start="\[" end="\]!\?" contains=armRegister,armNumber,armVariable transparent

" Register lists - {r0-r2, lr}
syn region  armRegisterList     start="{" end="}^\?" contains=armRegister transparent keepend

" Numbers
syn match   armNumber           "#\?-\?\(0x\|&\)[0-9a-fA-F_]\+\>"
syn match   armNumber           "#\?[0-9]\+\>"
syn match   armNumber           "#\?0b[01]\+\>"

" Strings
syn region  armString           start=+"+ end=+"+
syn match   armChar             "'\S'"

" Variables and symbols - commented out as it conflicts with instructions
" syn match   armVariable         "\(\<\|#\)-\?[a-zA-Z_][0-9a-zA-Z_]*\>"

" Comments - support ;, @, //, and /* */ styles
" Defined last to have highest priority
syn match   armComment          "[;@].*$"
syn match   armComment          "//.*$"
syn region  armCommentBlock     start="/\*" end="\*/"

" Define highlighting
hi def link armComment          Comment
hi def link armCommentBlock     Comment
hi def link armPreprocessor     PreProc
hi def link armLabel            Label
hi def link armDirective        PreProc
hi def link armCondition        Special
hi def link armInstruction      Statement
hi def link armMemoryInst       Statement
hi def link armMultipleInst     Statement
hi def link armBranchInst       Statement
hi def link armCPUInst          Special
hi def link armDefine           Define
hi def link armOperator         Operator
hi def link armNOP              Comment
hi def link armRegister         Identifier
hi def link armNumber           Number
hi def link armString           String
hi def link armChar             Character
hi def link armVariable         Identifier

let b:current_syntax = "arm"

" Sync method - ensure proper highlighting when scrolling
syn sync minlines=50
syn sync maxlines=500

" vim: ts=8 sw=2
