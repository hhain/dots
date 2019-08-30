filetype plugin on
syntax on
scriptencoding UTF-8
set noswapfile                                                                  "Disable creating swap file
set nobackup                                                                    "Disable saving backup file
set autoread
set autowrite
set confirm
set splitbelow                                                                  "Set up new horizontal splits positions
set browsedir=buffer
set encoding=UTF-8
set laststatus=2
set showtabline=2


let g:loaded_netrwPlugin = 1                                                    "Do not load netrw
let g:loaded_matchit = 1                                                        "Do not load matchit, use matchup plugin

set pyxversion=3                                                                "Python 3, of course, is the preferred version

" Python 3 Environment
let g:python3_host_prog = expand('~/.pyenv/versions/nvim/bin/python')           "Python 3 environment location

set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
" set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set guicursor=a:blinkon500-blinkwait500-blinkoff500                             "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:>\ ,trail:·                                                   "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
"set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep                                                       "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=300                                                              "Cursor hold timeout
set shortmess+=c                                                                "Disable completion menu messages in command line
set undofile                                                                    "Keep undo history across sessions, by storing in file
set nowritebackup                                                               "Disable writing backup file

set breakindent                                                                 "Preserve indent on line wrap
set foldenable                                                                "Disable folding by default
set colorcolumn=80                                                              "Highlight 80th column for easier wrapping
set foldmethod=syntax                                                           "When folding enabled, use syntax method

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

set sessionoptions+=globals                                                     "Restore workspace folders from sessions

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent smarttab
set signcolumn=yes

set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=.svn*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*mypy_cache*
set wildignore+=*__pycache__*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

if has('clipboard')
  set clipboard& clipboard+=unnamedplus
endif

augroup vimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow                                         "Open quickfix window after grepping
  autocmd BufWritePre * call s:strip_trailing_whitespace()                      "Auto-remove trailing spaces
  autocmd InsertEnter * set nocul                                               "Remove cursorline highlight
  autocmd InsertLeave * set cul                                                 "Add cursorline highlight in normal mode
  autocmd FocusGained,BufEnter * checktime                                      "Refresh file when vim gets focus
  autocmd FileType vim inoremap <buffer><silent><C-Space> <C-x><C-v>
  autocmd FileType markdown setlocal spell
  autocmd FileType json setlocal equalprg=python\ -m\ json.tool
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

function! s:strip_trailing_whitespace()
  if &modifiable
    let l:l = line('.')
    let l:c = col('.')
    call execute('%s/\s\+$//e')
    call histdel('/', -1)
    call cursor(l:l, l:c)
  endif
endfunction