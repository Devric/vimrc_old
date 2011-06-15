function! s:SynStars(perlevel)
	let b:levelstars = a:perlevel
	exe 'syntax match OL1 +^\(*\)\{1}\s.*+ contains=stars'
	exe 'syntax match OL2 +^\(*\)\{'.( 1 + 1*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL3 +^\(*\)\{'.(1 + 2*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL4 +^\(*\)\{'.(1 + 3*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL5 +^\(*\)\{'.(1 + 4*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL6 +^\(*\)\{'.(1 + 5*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL7 +^\(*\)\{'.(1 + 6*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL8 +^\(*\)\{'.(1 + 7*a:perlevel).'}\s.*+ contains=stars'
	exe 'syntax match OL9 +^\(*\)\{'.(1 + 8*a:perlevel).'}\s.*+ contains=stars'
endfunction
command! ChangeSyn  call <SID>SynStars(b:levelstars)

syntax match Properties +^\s*:\s*\S\{-1,}\s*:+
syntax match Tags +\s*:\S*:\s*$+
syntax match Dates +<\d\d\d\d-\d\d-\d\d.\{-1,}>+
syntax match stars +\*\+\*+me=e-1 contained
syntax match NEXT '\* \zsNEXT' containedin=OL1,OL2,OL3,OL4,OL5,OL6
syntax match CANCELED '\* \zsCANCELED' containedin=OL1,OL2,OL3,OL4,OL5,OL6
syntax match TODO '\* \zsTODO' containedin=OL1,OL2,OL3,OL4,OL5,OL6
syntax match STARTED '\* \zsSTARTED' containedin=OL1,OL2,OL3,OL4,OL5,OL6
syntax match DONE '\* \zsDONE' containedin=OL1,OL2,OL3,OL4,OL5,OL6

syntax match OL1 +^\(*\)\{1}\s.*+ contains=stars
syntax match OL2 +^\(*\)\{2}\s.*+ contains=stars
syntax match OL3 +^\(*\)\{3}\s.*+ contains=stars
syntax match OL4 +^\(*\)\{4}\s.*+ contains=stars
syntax match OL5 +^\(*\)\{5}\s.*+ contains=stars
syntax match OL6 +^\(*\)\{6}\s.*+ contains=stars
syntax match OL7 +^\(*\)\{7}\s.*+ contains=stars
syntax match OL8 +^\(*\)\{8}\s.*+ contains=stars
syntax match OL9 +^\(*\)\{9}\s.*+ contains=stars


syn match code '=\S.\{-}\S='
syn match itals '/\zs\S.\{-}\S\ze/'
syn match boldtext '*\zs\S.\{-}\S\ze\*'
syn match undertext '_\zs\S.\{-}\S\ze_'
syn match lnumber '^\t*\(\d\.\)*\s\s' contained


" ***********************************************
" section below is example for having subregions
" of code in an .org file that use syntax highlighting
" for the language in the code block itself 
" not regular Org syntax highlighting.
"  See Emacs' Org documentation for some details:
" http://orgmode.org/manual/Working-With-Source-Code.html#Working-With-Source-Code
" Notice that much of the functionality of 
" source code blocks is for when they are exported or 'tangled'.
" VimOrganizer calls out to an Emacs server for exports (and,
" -- soon to come -- for tangling) so the functionality described
" in the Emacs Org-mode docs already exists for VimOrganizer.
"
" The example below is for Lisp, other languages could be added
" using same priciple. In addition to using context-sensitive
" syntax highlighting for code blocks, VimOrganizer will
" eventually use context-sensitive language indent-rules. . . 
" ************************************************"
let b:current_syntax=''
unlet b:current_syntax
syntax include @Lispcode $VIMRUNTIME/syntax/lisp.vim
syntax region orgLisp start='^#+begin_src/semacs-lisp' end='^#+end_src$' contains=@Lispcode
let b:current_syntax = 'combined'
hi orgLisp gui=bold


" vim600: set foldmethod=marker foldlevel=0:


" define foreground colors for ****UNfolded**** outline heading levels
hi OL1 guifg=#7744ff ctermfg=blue
hi OL2 guifg=#aaaa22 ctermfg=brown
hi OL3 guifg=#00ccff ctermfg=cyan
hi OL4 guifg=#999999 gui=italic  	ctermfg=gray
hi OL5 guifg=#eeaaee ctermfg=lightgray
hi OL6 guifg=#9966ff 	ctermfg=yellow
hi OL7 guifg=#dd99dd  	ctermfg=red
hi OL8 guifg=cyan	ctermfg=grey
hi OL9 guifg=magenta	ctermfg=blue

" define highlighting for ***FOLDED*** outline heading levels
" 'Folded' is used for folded OL1
hi Folded gui=bold guifg=#6633ff guibg=#111111 	ctermfg=blue
" 'WarningMsg' is used for folded OL2
hi WarningMsg gui=bold guifg=#aaaa22  guibg=#111111	ctermfg=brown
" 'WildMenu' is used for folded OL3
hi WildMenu gui=bold guifg=#00ccff  guibg=#111111	ctermfg=cyan
" 'DiffAdd' is used for folded OL4
hi DiffAdd gui=bold guifg=#999999 gui=italic  guibg=#111111	ctermfg=gray
" 'DiffChange' is used for folded OL5
hi DiffChange gui=bold guifg=#eeaaee  guibg=#111111	ctermfg=lightgray

" various text item highlightings are below
hi Properties guifg=pink ctermfg=lightred
hi Tags guifg=pink ctermfg=lightred
hi Dates guifg=magenta ctermfg=magenta
hi stars guifg=#444444 ctermfg=darkgray
hi Props guifg=#ffa0a0 ctermfg=lightred
hi code guifg=orange gui=bold ctermfg=14
hi itals gui=italic guifg=#aaaaaa ctermfg=lightgray
hi boldtext gui=bold guifg=#aaaaaa ctermfg=lightgray
hi undertext gui=underline guifg=#aaaaaa ctermfg=lightgray
hi lnumber guifg=#999999 ctermfg=gray

hi TODO guifg=orange guibg=NONE ctermfg=14 ctermbg=NONE
hi CANCELED guifg=red guibg=NONE ctermfg=red ctermbg=NONE
hi STARTED guifg=yellow guibg=NONE ctermfg=yellow ctermbg=NONE
hi NEXT guifg=cyan guibg=NONE ctermfg=cyan ctermbg=NONE
hi DONE guifg=green guibg=NONE ctermfg=green ctermbg=NONE
