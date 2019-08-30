call plug#begin('~/.local/share/nvim/site/plugged')
  Plug 'kristijanhusak/defx-git', { 'type': 'opt' }
  Plug 'kristijanhusak/defx-icons', { 'type': 'opt' }
  Plug 'Shougo/defx.nvim'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
  Plug 'manasthakur/vim-commentor'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'davidhalter/jedi-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug '/usr/bin/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'haya14busa/vim-asterisk'
  Plug 'osyo-manga/vim-anzu'
  Plug 'mhinz/neovim-remote'
  Plug 'dyng/ctrlsf.vim'
  Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'itchyny/lightline.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'thaerkh/vim-workspace'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'moby/moby', { 'rtp': '/contrib/syntax/vim' }
  Plug 'Yggdroot/indentLine'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'dracula/vim', { 'as':'dracula' }
call plug#end()

" Don't let comfortable motion override current keybindings
let g:comfortable_motion_no_default_key_mappings = 1

"Remap space as leader key
noremap <Space> <Nop>
let mapleader="\<Space>"                                                        "Change leader to a space

augroup packager_filetype
  autocmd!
  autocmd FileType defx packadd defx-git | packadd defx-icons
augroup END

" Better search status
nnoremap <silent><Leader><space> :AnzuClearSearchStatus<BAR>noh<CR>
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
map * <Plug>(asterisk-z*)<Plug>(anzu-update-search-status)
map # <Plug>(asterisk-z#)<Plug>(anzu-update-search-status)
map g* <Plug>(asterisk-gz*)<Plug>(anzu-update-search-status)
map g# <Plug>(asterisk-gz#)<Plug>(anzu-update-search-status)

" Search mappings
nmap <Leader>f <Plug>CtrlSFPrompt
vmap <Leader>F <Plug>CtrlSFVwordPath
nmap <Leader>F <Plug>CtrlSFCwordPath

" Fuzzy finder
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>m :History<CR>
nnoremap <Leader>g :GFiles?<CR>

" Ripgrep settings {{{
" Set Ripgrep as grepping tool if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ -S
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

let g:ctrlsf_auto_close = 0                                                     "Do not close search when file is opened
let g:ctrlsf_mapping = {'vsplit': 's'}                                          "Mapping for opening search result in vertical split

" Make gutentags use ripgrep
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_ctags_extra_args = ['-n', '-u']
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 0
let g:gutentags_ctags_exclude = ['*.css', '*.html',
    \ '*.phar', '*.ini', '*.rst', '*.md',
    \ '*vendor/*/test*', '*vendor/*/Test*',
    \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
    \ '*var/cache*', '*var/log*']

let g:gutentags_ctags_exclude_wildignore = 1

" Use jq to format json files on gqq
augroup JSON
  autocmd!
  autocmd FileType json setlocal formatprg=jq\ .
augroup end

let g:vim_markdown_conceal = 0                                                  "Disable concealing in markdown

let g:vimwiki_list = [{'path': $HOME.'/Documents/wiki'}]                            "Use dropbox folder for easier syncing of wiki

let g:semshi#error_sign = 0

"function MyCustomHighlights()
"    hi semshiLocal           ctermfg=209 guifg=#ff875f
"    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"    hi semshiImported        ctermfg=202 guifg=#ff5f00 cterm=bold gui=bold
"    hi semshiParameter       ctermfg=63  guifg=#5f5fff
"    hi semshiParameterUnused ctermfg=131 guifg=#af5f5f cterm=underline gui=underline
"    hi semshiFree            ctermfg=218 guifg=#ffafd7
"    hi semshiBuiltin         ctermfg=200 guifg=#ff00d7
"    hi semshiAttribute       ctermfg=238 guifg=#444444
"    hi semshiSelf            ctermfg=126 guifg=#af0087
"    hi semshiUnresolved      ctermfg=124 guifg=#af0000 cterm=underline gui=underline
"    hi semshiSelected        ctermfg=255 guifg=#eeeeee ctermbg=38 guibg=#00afd7
"    hi semshiErrorSign       ctermfg=231 guifg=#c95044 ctermbg=160 guibg=#d70000
"    hi semshiErrorChar       ctermfg=231 guifg=#c95044 ctermbg=160 guibg=#d70000
"endfunction

"autocmd ColorScheme * call MyCustomHighlights()

augroup FileOptions
  autocmd!
  " indentation
  " (for comments moving to BOL): https://stackoverflow.com/questions/2063175/comments-go-to-start-of-line-in-the-insert-mode-in-vim
  autocmd Filetype python setlocal sts=4 sw=4 wrap
  " autocmd Filetype r setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype r setlocal ts=2 sw=2
  autocmd BufRead,BufNewFile *.md set wrap
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 syntax=javascript
  autocmd FileType yaml setlocal ts=2 sw=2 sts=2
  autocmd FileType json setlocal ts=2 sw=2 sts=2
  " https://calebthompson.io/crontab-and-vim-sitting-in-a-tree
  autocmd Filetype crontab setlocal nobackup nowritebackup
augroup END

augroup Folding
  autocmd!
  autocmd BufRead * setlocal foldmethod=marker    " using   fold method
  autocmd BufRead * normal zM
augroup END
