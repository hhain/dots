if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:dracula_colorterm = 0
colorscheme dracula

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
                  \ 'left': [[ 'mode', 'paste'], ['git_status'], [ 'readonly', 'relativepath', 'custom_modified' ]],
                  \ 'right': [['linter_errors', 'linter_warnings'], ['indent', 'percent', 'lineinfo'], ['anzu', 'filetype']],
                  \ },
      \ 'inactive': {
                  \ 'left': [[ 'readonly', 'relativepath', 'modified' ]],
                  \ 'right': [['lineinfo'], ['percent'], ['filetype']]
                  \ },
      \ 'component_expand': {
                  \ 'linter_warnings': 'LightlineLinterWarnings',
                  \ 'linter_errors': 'LightlineLinterErrors',
                  \ 'git_status': 'GitStatusline',
                  \ 'custom_modified': 'StatuslineModified',
                  \ 'indent': 'IndentInfo',
                  \ },
      \ 'component_function': {
                  \ 'anzu': 'anzu#search_status',
                  \ 'method': 'NearestMethodOrFunction',
                  \ },
      \ 'component_type': {
                  \ 'linter_errors': 'error',
                  \ 'custom_modified': 'error',
                  \ 'linter_warnings': 'warning'
                  \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! IndentInfo() abort
  let l:indent_type = &expandtab ? 'spaces' : 'tabs'
  return l:indent_type.': '.&shiftwidth
endfunction


function! StatuslineModified() abort
  return &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! GitStatusline() abort
  let l:head = fugitive#head()
  if !exists('b:gitgutter')
    return (empty(l:head) ? '' : printf(' %s', l:head))
  endif

  let l:summary = GitGutterGetHunkSummary()
  let l:result = filter([l:head] + map(['+','~','-'], {i,v -> v.l:summary[i]}), 'v:val[-1:]')

  return (empty(l:result) ? '' : printf(' %s', join(l:result, ' ')))
endfunction