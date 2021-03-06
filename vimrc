set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " Generate all tags

"""""""""""""""""""""""""""""""""""""""""""""""
"XPT
"""""""""""""""""""""""""""""""""""""""""""""""
let g:xptemplate_key = '<C-Space>'

"""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet
"""""""""""""""""""""""""""""""""""""""""""""""
let g:use_emmet_complete_tag = 1
"
"""""""""""""""""""""""""""""""""""""""""""""""
" => JSX highlight
"""""""""""""""""""""""""""""""""""""""""""""""
let javascript_enable_domhtmlcss = 1

"""""""""""""""""""""""""""""""""""""""""""""""
" => Tern
"""""""""""""""""""""""""""""""""""""""""""""""
let g:tern_show_argument_hints   = 'on_move'
let g:tern_show_signature_in_pum = 1
map <leader>tt :TernType<CR>
map <leader>td :TernDef<CR>
map <leader>tD :TernDoc<CR>
map <leader>tr :TernRename<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable filetype plugin
filetype plugin on
filetype indent on

" Set auto read when a file is changed outside
set autoread

"reload vimrc, When vimrc is edited, reload it
" if has("autocmd")
"   autocmd bufwritepost vimrc source ~/.vim_runtime/vimrc
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

set history=128

set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto relative numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au InsertEnter * :set nu
au InsertLeave * :set rnu

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
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" AutoComplPop
if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
            \   'command'   : "\<C-x>\<C-o>", 
            \   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
            \   'repeat'    : 0,
            \})
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
set pastetoggle=<F9>
"Usually annoys me
set wrapmargin =0
set linebreak
set cursorline
set number
set relativenumber

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
set background=dark


" Color Scheme (only if GUI running) {{{
if has("gui_running")

    colorschem plum
    nnoremap <silent> <F5> :exe 'set bg=' . (&bg == 'dark' ? 'light' : 'dark')<CR>

    " those are solarize
    "colorschem solarized
    "call togglebg#map("<F5>")

    set guioptions-=T " no toolbar
    "set guioptions-+m " no menu
    set transparency=5

    " call plum to 
    let g:plum_set_bg_at_start = 1

else " !gui colorschem
    colorschem badwolf
    let g:badwolf_html_link_underline = 1 " Turn off HTML link underlining
    let g:badwolf_css_props_highlight = 1 " Turn on CSS properties highlighting
endif
" }}}


"Make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

"The following should be done automatically for the default colour scheme
"at least, but it is not in Vim 7.0.17.
if &bg == "dark"
  highlight MatchParen ctermbg=darkblue guibg=blue

  " vim-js-context-coloring : https://github.com/bigfish/vim-js-context-coloring
  " colour table : http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
  let g:js_context_colors = [ 250, 10, 11, 173, 1, 161, 81 ]
endif

if &bg == "light"
  let g:js_context_colors = [ 22, 24, 3, 162, 1, 161, 57 ]
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" Synstatic linting
""""""""""""""""""""""""""""""""""""""""""""""""
let g:synstatic_check_on_open=0

let g:syntastic_error_symbol = '✗'            " Error Symbol
let g:syntastic_warning_symbol = '⚠'          " Warning Symbol
let g:syntastic_style_error_symbol = '⚡'      " Style Error Symbol
let g:syntastic_style_warning_symbol = '⚡'    " Style Warning Symbol

let g:Synstatic_javascript_jshint_conf="~/.jshintrc"

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
" use ; for <Leader>
let mapleader = ";"

"Map escape key to jj -- much faster
imap jk <esc>

imap <Leader>date   <C-R>=strftime("%d/%m/%y")<CR>
imap <Leader>time   <C-R>=strftime("%T")<CR>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
"Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x

" map Enter to tabalign
vnoremap <silent> <Enter> :Tabularize /

" Smart way to move btw. windows
"map <A-j> <C-W>j
"map <A-k> <C-W>k
"map <A-h> <C-W>h
"map <A-l> <C-W>l

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


" Close the current buffer
map <leader>bd :bd<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" ack find file
let g:ackprg = 'ag --nogroup --nocolor --column'         " replace ack.vim with the_silver_seracher
nmap <leader>g :Ack <C-R>=expand("<cword>")<CR><CR>
nmap <leader>s :vsp<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

vnoremap <C-h> <ESC>v<<ESC>
vnoremap <C-l> <ESC>v><ESC>


" fast command line access in normal mode
nmap <space> :


"""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""ctags
" Ctags {
        " This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
        set tags=./tags;/,$HOME/vimtags
        map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
" }

" Taglist Variables {
       map <F3> :silent! Tlist<CR>

       "let Tlist_Ctags_Cmd='/opt/local/var/macports/software/ctags/5.8_0/opt/local/bin/ctags'
       let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
       " Auto open TagList on supported files
       let Tlist_Auto_Open = 1
       " Exit if TagList is the only window left
       let Tlist_Exit_OnlyWindow = 1
       "" Auto close the fold for inactive files
       " let Tlist_File_Fold_Auto_Close = 1
       "" Only show the current file in TagList
       " let Tlist_Show_One_File = 1

       let Tlist_Use_Right_Window=0 
       let Tlist_Process_File_Always=1 
       let Tlist_Auto_Update=1
       let Tlist_Auto_Highlight_Tag = 1
       let Tlist_Highlight_Tag_On_BufEnter = 1
       let Tlist_Use_SingleClick = 1

       let g:ctags_statusline=1
       " Override how taglist does javascript
       let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
" }


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget      = 1 " active when using with taglist
let g:miniBufExplorerMoreThanOne   = 2 " only activate when more then one buffer
let g:miniBufExplUseSingleClick    = 1 " single click to change file
let g:miniBufExplMapWindowNavVim   = 1 " hjkl mappig
let g:miniBufExplSplitBelow        = 0 " 1 below, 0 above
let g:miniBufExplMapCTabSwitchBufs = 1 " tab s-tab navigation
let g:bufExplorerSortBy            = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jSon Highlights
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal completefunc=php#complete#CodeComplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au FileType php set omnifunc=phpcomplete#CompletePHP
"
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

imap <C-r> <C-x><C-o>


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
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coffee
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" watch on Insertleave
" au BufNewFile,BufReadPost *.coffee inoremap <buffer> <C-C> <Esc>

" auto compile on save
" autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c -b <afile>

" ctags work with coffee
let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

" tab stop goes back to 2 with coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab

" fold by indentation
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Less, Stylus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto BufWritePost,FileWritePost *.less silent !lessc <afile><afile>:r.css
" auto BufWritePost,FileWritePost *.styl silent !stylus <afile> >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jade
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePost,FileWritePost *.jade :silent !jade -P %


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Change Working Directory to that of the current file
cmap cd. lcd %:p:h<cr>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Remove trailing white space before save
autocmd! BufWritePost :%s/\s\+$//e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim pad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pad_dir = "~/.vim/notes/"
let g:pad_format = "org"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Php documentator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source ~/.vim/php-doc.vim 
inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-p> :call PhpDocSingle()<CR> 
vnoremap <C-p> :call PhpDocRange()<CR> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p_p>'
let g:ctrlp_working_path_mode = '.' " make it open the root directory
nnoremap <leader>x :CtrlP<CR>
nnoremap <leader>X :ClearCtrlPCache<cr>\|:CtrlP<CR>


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

" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1
let g:php_folding=2
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gundo :python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extradite / git commit browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4> :Extradite<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gist_show_privates = 1 " show personal private when using Gist -l
let g:gist_open_browser_after_post = 1 " open browser after post 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => backup files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InitBackupDir()
    let separator = "."
    let parent = $HOME .'/' . separator . 'vim/'
    let backup = parent . 'backup/'
    let tmp    = parent . 'tmp/'
    if exists("*mkdir")
        if !isdirectory(parent)
            call mkdir(parent)
        endif
        if !isdirectory(backup)
            call mkdir(backup)
        endif
        if !isdirectory(tmp)
            call mkdir(tmp)
        endif
    endif
    let missing_dir = 0
    if isdirectory(tmp)
        execute 'set backupdir=' . escape(backup, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if isdirectory(backup)
        execute 'set directory=' . escape(tmp, " ") . "/,."
    else
        let missing_dir = 1
    endif
    if missing_dir
        echo "Warning: Unable to create backup directories: " 
        . backup ." and " . tmp
        echo "Try: mkdir -p " . backup
        echo "and: mkdir -p " . tmp
        set backupdir=.                 
        set directory=.
    endif
endfunction          
call InitBackupDir()

