:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set expandtab
:set splitright 
:set splitbelow
:set mouse=a
:set ignorecase  "ignore the case searching with /
:set clipboard=unnamedplus  
:set encoding=UTF-8
:set termguicolors
:set encoding=UTF-8

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/junegunn/vim-plug/'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/yegappan/taglist'
Plug 'chrisbra/sudoedit.vim'
Plug 'https://github.com/jceb/vim-orgmode'
Plug 'https://github.com/ap/vim-css-color'

call plug#end()

nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>

nnoremap <F8> :TlistToggle<CR>
nnoremap <C-i> :TagbarToggle<CR>

"  Needed only if nerd font is not installed
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"


" Move up and down lines
:nnoremap <A-Up> <Up>ddp<Up>
:nnoremap <A-Down> ddp


" toggle the terminal window
nnoremap <C-t> :call TermToggle()<CR>
vnoremap <C-t> <ESC>:call TermToggle()<CR>
inoremap <C-t> <ESC>:call TermToggle()<CR>
tnoremap <C-t> exit<CR>

function! TermToggle()
    if term_list() == []
        terminal
    else
        for term in term_list()
            call term_sendkeys(term, "exit\<cr>")
        endfor
    endif
endfunction
