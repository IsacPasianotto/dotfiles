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
