scriptencoding UTF-8
set hidden                                                                      "Hide buffers in background
"set completefunc=emoji#complete
set completeopt=noinsert,menuone
set completeopt-=preview                                                        "Disable preview window for autocompletion
set list
set pumheight=10                                                                "Maximum number of entries in autocomplete popup
set cmdheight=1
set updatetime=300

let g:coc_user_config = {
      \ 'diagnostic.enable': v:true,
      \ 'prettier.printWidth': 100,
      \ 'prettier.singleQuote': v:true,
      \ }

"CoC configlet
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '✖︎'
let g:coc_status_warning_sign = '✔︎'

let g:coc_global_extensions = [
      \ 'coc-tag',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-python',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-vimlsp',
      \ ]

" Vim polyglot language specific settings
let g:python_highlight_space_errors = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lF <Plug>(coc-format)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lc <Plug>(coc-declaration)
nmap <leader>lg <Plug>(coc-implementation)
nmap <leader>lu <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>lq <Plug>(coc-fix-current)
nmap <silent><leader>lh :call CocAction('doHover')<CR>
vmap <leader>la <Plug>(coc-codeaction-selected)
inoremap <silent><C-Space> <C-x><C-o>

" Use K for show documentation in preview window
nnoremap <silent>K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1

let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""