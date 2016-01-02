"
" $HOME/.gvimrc -- A configuration file for GTK Vi IMproved
"

" General settings:
set spell                         " Enable spell checking.

" User interface settings:
set guioptions-=T                 " Disable the toolbar.
set guioptions-=m                 "remove menu bar - dal jsem to tam já - může být užitečné
set guioptions-=r                 " Disable the right-hand scrollbar.
set guioptions-=l                 " Disable the left-hand scrollbar.
set guioptions-=R                 " Disable the right-hand scrollbar in vertical split mode.
set guioptions-=L                 " Disable the left-hand scrollbar in vertical split mode.
"set guifont=Ubuntu\ Mono\ 12      " Set the default font.
"colorscheme koehler                 " Set the default color scheme.
"colorscheme solarized
colorscheme slate

if g:colors_name=="slate"
  hi PreProc guibg=NONE
endif

if g:colors_name=="slate"
  hi Modemsg guibg=DarkBlue
endif

"Disable beep and flash with gvimrc - Milan
set vb t_vb=

