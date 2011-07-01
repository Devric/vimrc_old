set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable filetype plugin
filetype plugin on
filetype indent on

" Set auto read when a file is changed outside
set autoread

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

set history=128

set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 7 lines to the cursor - when moving vertical..
set so=7

set wildmenu "turn on wild menu

set showcmd

set ruler " show ruller

"Always show the status line
set laststatus=2

set mousehide

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
"
"Map escape key to jj -- much faster
imap jj <esc>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"reload vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" make 'vi' less anoying when commands dont work
set vb t_vb=

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "ignore case when serch
set smartcase

set hlsearch "highlight search things
hi htmlTag guifg=#00bdec guibg=#200000 gui=bold "highlight html tags block

set incsearch "make search act like search in modern browsers
set nolazyredraw "dont redraw while executing macros

set magic "set magic on, for reugular expressions

set showmatch "show matching bracets when text indication is over them
set mat=2 "how many tenths of a second to blink

"no sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
       
set hidden "Always show cursor position

set title
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
"This is necessary to allow pasting from outside vim. It turns off auto stuff.
"You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
"Usually annoys me
set wrapmargin =0
set linebreak
set number

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""

"Default to autoindenting of C like languages
"This is overridden per filetype below
set noautoindent smartindent

"The rest deal with whitespace handling and
"mainly make sure hardtabs are never entered
"as their interpretation is too non standard in my experience
set softtabstop=4
" Note if you don't set expandtab, vi will automatically merge
" runs of more than tabstop spaces into hardtabs. Clever but
" not what I usually want.
set expandtab
set shiftwidth=4
set shiftround
set nojoinspaces


""""""""""""""""""""""""""""""""""""""""""""""""
" Dark background
""""""""""""""""""""""""""""""""""""""""""""""""
colorschem solarized
set background=dark
call togglebg#map("<F5>")


if has("gui_running")
set transparency=5
endif

set guioptions-=T " no toolbar
"set guioptions-+m " no menu

"Make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

"The following should be done automatically for the default colour scheme
"at least, but it is not in Vim 7.0.17.
if &bg == "dark"
  highlight MatchParen ctermbg=darkblue guibg=blue
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""

if v:version >= 700
    "The following are a bit slow
    "for me to enable by default
    "set cursorline   "highlight current line
    "set cursorcolumn "highlight current column
endif

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""

"Note <leader> is the user modifier key (like g is the vim modifier key)
"One can change it from the default of \ using: let mapleader = ","

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
"Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x

" Smart way to move btw. windows
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" use control h and l to indent line in insert mode and visual mode
inoremap <C-h> <ESC>v<i
inoremap <C-l> <ESC>v>i

nnoremap <C-h> <ESC>v<<ESC>
nnoremap <C-l> <ESC>v><ESC>


" fast command line access in normal mode
nmap <space> :

" auto space at operations
ino <= <space><=<space>
ino *= <space>*=<space>
ino /= <space>/=<space>
ino >> <space>>><space>
ino << <space><<<space>
ino >= <space>>=<space>
ino == <space>==<space>
ino += <space>+=<space>
ino && <space>&&<space>
ino != <space>!=<space>


"""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""ctags
"let Tlist_Ctags_Cmd='d:\coding\ctag\ctags.exe'
"" Auto open TagList on supported files
"let Tlist_Auto_Open = 1
"" Exit if TagList is the only window left
"let Tlist_Exit_OnlyWindow = 1
"" Auto close the fold for inactive files
"let Tlist_File_Fold_Auto_Close = 1
"" Only show the current file in TagList
""let Tlist_Show_One_File = 

"map <F1> :silent! Tlist<CR>
"let Tlist_Use_Right_Window=0 
"let Tlist_Show_One_File=0 
"let Tlist_Process_File_Always=1 
"let Tlist_Auto_Update=1

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim organiser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vars below are used to define default Todo list and
" default Tag list.  Will be changed in near future so
" that these are defined by config lines in each .org
" file itself, but now these are where you can change things:
let g:org_todo_setup='TODO | DONE'
" while g:org_tag_setup is itself a string
let g:org_tag_setup='{@home(h) @work(w) @tennisclub(t)} \n {easy(e) hard(d)} \n {computer(c) phone(p)}'

" leave these as is:
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufRead,BufNewFile *.org            call org#SetOrgFileType()
au BufRead *.org :PreLoadTags
au BufWrite *.org :PreWriteTags
au BufWritePost *.org :PostWriteTag


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SplitJoin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>sj :SplitjoinJoin<cr>
nmap <Leader>ss :SplitjoinSplit<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.less		setfiletype css
au BufRead,BufNewFile *.txt		setfiletype org


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a; :Tabularize /:<CR>
  vmap <Leader>a; :Tabularize /:<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Php documentator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => css folds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CssFoldText()
    let line = getline(v:foldstart)
    let nnum = nextnonblank(v:foldstart + 1)
    while nnum < v:foldend+1
        let line = line . " " . substitute(getline(nnum), "^ *", "", "g")
        let nnum = nnum + 1
    endwhile
    return line
endfunction

setlocal foldtext=CssFoldText()
setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal fillchars=fold:\ 

imap <Leader>date   <C-R>=strftime("%d/%m/%y")<CR>
imap <Leader>time   <C-R>=strftime("%T")<CR>

" use ; for <Leader>
let mapleader = ";"
