"|==============================================================================================|
"| My Personalised vimrc.                                              							|
"| @github.com/sandeeprenjith                                          							|
"| To use,                                                             							|
"|		- copy the file to ~/ with the name .vimrc (~/.vimrc)         							|
"|       - Install Vundle  											  							|
"|			- mkdir -p ~/.vim										  							|
"|			- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim	|
"|		- Open vim 																				|
"|		- From normal mode run :PluginInstall													|
"| At this point you are basically done; Modify as you like                                     |
"|==============================================================================================|


set number
set bg=light
syntax on
set tabstop=4
map gs :! gitsave % <CR>
set paste
highlight ColorColumn ctermbg=2 guibg=lightgrey 
colorscheme black_is_the_color
"Disable arrow keys
"nnoremap <Left> :echo "No left for you!"<CR>
"nnoremap <Right> :echo "No right for you!"<CR>
"nnoremap <Up> :echo "No up for you!"<CR>
"nnoremap <Down> :echo "No down for you!"<CR>


"Vundle stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle Plugins
""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
<<<<<<< HEAD:.vimrc
Plugin 'vim-perl/vim-perl'
=======
>>>>>>> 53c89439cf8872fd6bcffaea2a933b7e02e9a268:vimrc
""""""""""""""""""""""""""""""""""""""

call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"For Syntastic Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Function to add index numbers to Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Source:https://superuser.com/questions/331272/vim-show-the-index-of-tabs-in-the-tabline
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
