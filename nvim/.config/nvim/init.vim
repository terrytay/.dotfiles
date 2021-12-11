source <sfile>:h/plugin/sets.vim
source <sfile>:h/plugin/go.vim
source <sfile>:h/plugin/harpoon.vim
source <sfile>:h/plugin/airline.vim

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ThePrimeagen/harpoon'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

"Project search for keyword in files' content
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <leader>ff :Telescope find_files<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PUPU
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
augroup END

"Indentation with tab/tab+shift
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

"Move line up/down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


"Undotree
nnoremap <leader>u :UndotreeToggle<CR> :UndotreeFocus<CR>

"Nerdtree
nnoremap <leader>m :NERDTree<CR>

nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <leader>t :FloatermNew<CR>
