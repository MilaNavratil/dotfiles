"
" $HOME/.vimrc -- a configuration file for Vi IMproved
"
" Remaping the escape key
" :imap fj <Esc>

" General settings:
set nocompatible                  " Disable Vi-compatible mode.
set magic                         " Use classic regular expressions.
set ignorecase                    " Jarek had noignore case, I tried smartcase, but this is better.
set wrapscan                      " Search across multiple lines.
set backupcopy=no                 " Do not create backup copies.
"set formatoptions=tcqr           " Adjust automatic formatting. -- original
				  "from jhradile
set formatoptions=t               " Adjust automatic formatting.
				  " Better for my needs -- set with ptisnovs
set backspace=indent,eol,start    " Specify the backspace behavior.
set history=1000                  " Specify the number of possible undos.
set helplang=en                   " Specify the help language.
set spelllang=en_us               " Specify the spell checking language.
set nospell                       " Disable spell checking by default.
set wildmenu                      " Better tab completion -- by ptisnovs
set autowrite                     " File gets saved when changing buffers -- by mnavrati
filetype on                       " Enable file type detection.
filetype plugin on                " Enable automatic indentation.

" Environment settings:
set background=dark
set ruler                         " Display the ruler.
set showcmd                       " Display commands.
set showmode                      " Display the current mode.
set number                        " Display line numbers.
set hlsearch                      " Highlight all matching patterns.
set incsearch                     " Highlight matching text while typing.
syntax on                         " Highlight the syntax.
set guifont=Monospace\ 15	  

" Editing settings:
set textwidth=0                   " Do not set the default text width.
"set textwidth=74
set wrap                          " Wrap the displayed text.
set linebreak                     " Break lines at a word boundary.
"set expandtab                    " Replace tabulators with spaces
                                  " Jaromir has it on, tcapek told me to
                                  " comment it out: set expandtab 
set tabstop=8                     " Set the number of spaces for a tabulator.
				  " jhradile has it set to 2 (set tabstop=2),
				  " tcapek told me to set tabstop=8: set ts=2
set shiftwidth=8                  " Set the number of spaces for indentation.
				  " used to be 2 from jhradile, changed to 8
				  " becasue of IDM: set sw=8
set autoindent                    " Automatically insert line breaks.
set nojoinspaces                  " Do not insert a second space after
                                  " a sentence when joining lines.
set autochdir 		    	  " Autochange the working directory to the directory of the current buffer

" Configure the Vundle plug-in manager:
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Configure bundles:
Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'vim-pandoc/vim-pandoc'
Bundle 'jhradilek/vim-docbk'
"Bundle 'jhradilek/vim-mallard'
"Bundle 'jhradilek/vim-pressgang'
"Bundle 'jhradilek/vim-rng'
Bundle 'jhradilek/vim-snippets'
Bundle 'airblade/vim-gitgutter'
Bundle 'sickill/vim-pasta'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'tmhedberg/matchit'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-vinegar'
Bundle 'beloglazov/vim-online-thesaurus'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'istib/vifm.vim'

" Vifm integration
" nnoremap <Leader><Leader>f :VsplitVifm<CR>
" let g:vifm_exec_args= "--no-configs" "  neither .vifmrc nor .viminfo
" let g:vifm_exec_args.= " -c 'view'" " Use the second pane for preview
" let g:vifm_exec_args.= " -c 'set relativenumber'" " Counting aid for commands like '10k'
" let g:vifm_exec_args.= " -c 'nnoremap q :q<cr>'" " Exit by simply pressing 'q'
" let g:vifm_exec_args.= " -c 'nnoremap ; :'" " Open command line without holding Shift

" backup/persistence settings
" obtained from https://www.youtube.com/watch?v=vP4gEOUz4WM
" set undodir=~/.vim/tmp/undo//
" set backupdir=~/.vim/tmp/backup//
" set directory=~/.vim/tmp/swap//
" set backupskip=/tmp/*,/private/tmp/*"
" set backup
" set writebackup
" set noswapfile

" Gundo plugin settings
" persist (g)undo tree between sessions
set undofile
set undolevels=100
let g:gundo_help = 0 " set to 0 not to show help

" CtrlP plugin settings
let g:ctrlp_working_path_mode = 'ra'

" Sets Explorers default view
" let g:netrw_liststyle=3

" set directory=~/.vim/swap	  "prevent them cluttering your current directory - doesn't seem to be working

"""""""""
" Testing from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" Show all tabs:
"/\t

" Show trailing whitespace only after some text (ignores blank lines):
"/\S\zs\s\+$

" Show spaces before a tab:
"/ \+\ze\t

" Try the following if your GUI uses a dark background.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

""""""""

" Enhance the vertical movement over wrapped text:
noremap k gk
noremap j gj
noremap <Up> g<Up>
noremap <Down> g<Down>
inoremap <Up> <Esc>g<Up>a
inoremap <Down> <Esc>g<Down>a

"Highlight spelling mistakes -- from Peter Ondrejka
" nnoremap <buffer> <F5> :highlight SpellBad term=reverse guibg=Red guifg=White<cr>

"reset source file
" nnoremap <buffer> <F4> :so ~/.vimrc<cr>

nnoremap <F5> :GundoToggle<CR>

"" Customize keyboard mapping:
"nmap <F9> :make<CR>
"imap <F9> <ESC>:make<CR>
"cmap <F9> <ESC>:make<CR>

" Customize file type recognition:
au BufNewFile,BufRead *.rng set ft=rng
au BufNewFile,BufRead *.page set ft=mallard
au BufNewFile,BufRead *.page.stub set ft=mallard
au BufNewFile,BufRead *.contentspec set ft=contentspec
au FileType pandoc set ts=4 sw=4 expandtab
au FileType python set ts=4 sw=4 expandtab
au FileType xml set ft=docbk

" Configure the UltiSnips plug-in:
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-s-tab>'

"" Configure the NERDTree plug-in:
let g:NERDTreeWinPos = 'left'     " Place the window to the left.
let g:NERDTreeWinSize = 25        " Change the window width.

"" Configure the Tagbar plug-in: ??? From Jarek - I don't know what this does
"let g:tagbar_left = 0             " Place the window to the right.
"let g:tagbar_width = 40           " Change the window width.
"nmap <silent> <F12> :TagbarToggle<CR>
"imap <silent> <F12> <ESC>:TagbarToggle<CR>
"cmap <silent> <F12> <ESC>:TagbarToggle<CR>

" set mapleader to space
let mapleader = " "

" Press Space to turn off highlighting and clear any message already displayed.
" Added by Milan.
":nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" nmap <silent> <leader>l :nohlsearch<Bar>:echo<CR>
nnoremap <leader>l :nohlsearch<CR>

" Not bad, but it wasn't that convenient
" nnoremap <leader><space> :nohlsearch<CR>


"Remapping saving to Space-w
noremap <leader>w 	:w<CR>

" Online thesaurus
nnoremap <Leader>t :OnlineThesaurusCurrentWord<CR>
" Allow searching for multi-word entries
vnoremap <Leader>t "ty:Thesaurus <C-r>t<CR>

"EasyMotion
" Use single <Leader> instead of double <Leader>
let g:EasyMotion_leader_key = '<Leader>'
" Bi-directional find motion `f{char}{label}`
nmap f <Plug>(easymotion-s)
vmap f <Plug>(easymotion-s)
omap f <Plug>(easymotion-s)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" When searching for a character
" Default, but s/;/,/
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj,'

" comfortable switching it changelist.
"noremap ,e g;

" y/p for system clipboard yanking/putting
" from max - doesn't seem to be working
" set clipboard=unnamedplus
" This doesn't work either.
" set clipboard=unnamed

"F-keys mappings
"===============
"
"toggle Ctrl+F1 to show the menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR> 

"inserts the current date
nmap <F3> <C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
nmap <F3> <C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d")<CR>


"I wanted the exact time for time logging, but I started using Toggl.
nmap <C-F3> a<C-R>=strftime("%I:%M %p")<CR><Esc> 
imap <C-F3> <C-R>=strftime("%I:%M %p")<CR>

"Spelling mapping
:noremap <F6> :set nospell<CR>
:noremap <F7> :set spell spelllang=en_us<CR>
:noremap <F8> :set spell spelllang=cs<CR>

" Underline the current line with = in normal mode
nnoremap <F9> yyp<c-v>$r=
" Underline the current line with = in insert mode
inoremap <F9> <Esc>yyp<c-v>$r=A

" Underline the current line with dashes in normal mode
nnoremap <F10> yyp<c-v>$r-
" Underline the current line with dashes in insert mode
inoremap <F10> <Esc>yyp<c-v>$r-A

" Underline the current line with * in normal mode
nnoremap <F11> yyp<c-v>$r*
" Underline the current line with * in insert mode
inoremap <F11> <Esc>yyp<c-v>$r*A

"NerdTree Plugin Toggle
nmap <silent> <F12> :NERDTreeToggle<CR>
imap <silent> <F12> <ESC>:NERDTreeToggle<CR>
cmap <silent> <F12> <ESC>:NERDTreeToggle<CR>

" Maximise gvim window
" Added by Milan
" It's useful when I use the Firefox add-on It's all text. I definitely prefer having the window maximized.
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" map control-backspace to delete the previous word in insert mode.
" Added by Milan
:imap <C-BS> <C-W>

" Clipboard Shortcuts
" From Pavel Tisnovsky
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X>  "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>  "+y<Esc>
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
nnoremap <silent> <SID>Paste "=@+.'xy'<CR>gPFx"_2x
map  <S-Insert>         <SID>Paste
noremap  <C-V>          "+P
imap <C-V>              x<Esc><SID>Paste"_s
imap <S-Insert>         x<Esc><SID>Paste"_s
cmap <C-V>              <C-R>+
cmap <S-Insert>         <C-R>+
vmap <C-V>              "-cx<Esc><SID>Paste"_x
vmap <S-Insert>         "-cx<Esc><SID>Paste"_x

" Show invisibles 
" http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
" nmap <leader>l :set list!<CR>
"set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

" Disable beep and flash with gvimrc
" Added by Milan
set noeb vb t_vb=

" Yank from the cursor to the end of the line, to be consistent with C and D.
" Added by Milan
nnoremap Y y$

" Remaps Ctrl+v to ,v to do visual block 
" Added by Milan - from Pavel Tisnovsky
noremap ,v      <C-V>

noremap <A-d>   <C-d>
noremap <A-u>   <C-u>
noremap <A-b>   <C-b>
noremap <A-f>   <C-f>


"Right mouse is yank to system clipboard
vmap <RightMouse> "*y


" Remapping for moving among viewports
" Added by Milan
map<C-h> <C-w>h
map<C-j> <C-w>j
map<C-k> <C-w>k
map<C-l> <C-w>l

"Auto-save when focus is lost - very cool
autocmd BufLeave,FocusLost * silent! wall

"from Practical Vim p. 21
"This will cause Vim to treat all numerals as decimal, regardless of whether they are
"padded with zeros.
set nrformats=


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

"vnoremap UU :Underline<CR>
vnoremap SS :Strikethrough<CR>
vnoremap DD :delcombine<CR>

"highlight last inserted text
" nnoremap gV `[v`]
" na vyzkoušení -- doesn't seem to work
"This one is pretty cool. It visually selects the block of characters you added last time you were in INSERT mode.

"------------------
"------------------
"Not used any more:
"------------------
"------------------
" Press F4 to toggle highlighting on/off, and show current value. Added by Milan - very cool, but now probably not necessary. I can just press Space to disable highlighting whenever I want.
":noremap <F4> :set hlsearch! hlsearch?<CR>
"
"Using Tabs http://dailyvim.blogspot.cz/2008/11/tabs.html I used the § instead
"of a comma and it works just fine. However, it's possible to use gt and gT
"for switching tabs so it's not necessary to do it like that. I don't use tabs
"now.
"let mapleader ="",""there should be only a single pair of quotes, ofc
"map <leader>tt :tabnew<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>


" Milan's Notes
""""""""""""""
" move a cursor to a word and then press : to go to the command mode and
" Ctrl+r Ctrl+w
"
 " :set guifont=* This will pop up a menu that allows you to select the font. :set guifont?
" To show what the current guifont is set to After that copy that line into your vimrc or gvimrc. If there are spaces in the font add a \ to escape the space. I'm satisfied with my font size now.

