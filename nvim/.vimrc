" vim: set foldmethod=marker:
" 
" Open folds with zo, close with zc
"

syntax on
filetype plugin indent on
" Plugins
" Vundle plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-orgmode

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dhruvasagar/vim-markify'
Plugin 'elbeardmorez/vim-loclist-follow'
" Status bar
Plugin 'itchyny/lightline.vim'

" Color scheme
Plugin 'atelierbram/Base2Tone-vim'   
Plugin 'drewtempelmeyer/palenight.vim'
" OpenSCAD
Plugin 'sirtaj/vim-openscad'   
Plugin 'guns/xterm-color-table.vim'
"Plugin 'challenger-deep-theme/vim'
" Focus
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'airblade/vim-gitgutter'
" tmux integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'keith/tmux.vim'

" Code navigation
Plugin 'mhinz/vim-grepper' 
Plugin 'ctrlpvim/ctrlp.vim.git' 
Plugin 'tpope/vim-liquid'
Plugin 'gabrielelana/vim-markdown'

" Use release branch (Recommend)
Plugin 'neoclide/coc.nvim'

Plugin 'chrisbra/Colorizer'
if has('macunix')
    " XCode
    Plugin 'gfontenot/vim-xcode'
    Plugin 'ybian/smartim'
    " File types
    Plugin 'keith/swift.vim'
    Plugin 'darfink/vim-plist'
endif
Plugin 'pangloss/vim-javascript'
Plugin 'lervag/vimtex'
Plugin 'mattn/emmet-vim'

Plugin 'metakirby5/codi.vim'
Plugin 'tpope/vim-eunuch'
" Snippets
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" NVIM
if has("nvim")
Plugin 'machakann/vim-highlightedyank'
endif
Plugin 'junegunn/vim-easy-align'
call vundle#end()
" }}}

" Appearance
" Color scheme & Status bar {{{
" Favourite themes: Base2Tone_ForestDark, palenight
let g:palenight_terminal_italics=1
colorscheme palenight

let g:lightline = {
      \ 'colorscheme': g:colors_name,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
	  \'tabline' : {
	  \   'left': [ ['tabs'] ],
	  \   'right': [  ]
	  \ }
      \ }
set guioptions-=e  " Don't use GUI tabline


"}}}
" Highlight current line & column {{{
" hi CursorLine   ctermfg=NONE ctermbg=235 guibg=#3E4452
hi CursorLineNR   cterm=NONE ctermbg=235
hi ColorColumn ctermbg=235 guibg=#2C323C
set nocuc
highlight Folded cterm=underline ctermbg=NONE

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    "utocmd WinEnter * set cuc
    "utocmd WinLeave * set nocuc
augroup END
"}}}
" Line number column {{{
highlight SignColumn ctermbg=NONE
highlight LineNr ctermbg=NONE

" GIT
set updatetime=250
highlight GitGutterAdd ctermfg=2 ctermbg=234
highlight GitGutterChange ctermfg=11 ctermbg=234
highlight GitGutterDelete ctermfg=9 ctermbg=234
highlight GitGutterChangeDelete ctermfg=13 ctermbg=234

"}}}
" Separator{{{
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE"}}}

" Sytastic {{{
set timeoutlen=1000 ttimeoutlen=0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'swift': ['swiftlint'],
\}
let g:ale_javascript_eslint_executable = 'eslint'

let g:ycm_semantic_triggers = {
 \ 'objc' : ['re!\@"\.*"\s',
 \ 're!\@\w+\.*\w*\s',
 \ 're!\@\(\w+\.*\w*\)\s',
 \ 're!\@\(\s*',
 \ 're!\@\[.*\]\s',
 \ 're!\@\[\s*',
 \ 're!\@\{.*\}\s',
 \ 're!\@\{\s*',
 \ "re!\@\’.*\’\s",
 \ '#ifdef ',
 \ 're!:\s*',
 \ 're!=\s*',
 \ 're!,\s*', ],
 \ }
"}}}
" Autocmds {{{
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead *.scad setf openscad
augroup END
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.scss set shiftwidth=2 
au BufReadPost *.hbs set syntax=html
autocmd! BufNewFile,BufRead *.fsh,*.vsh set filetype=glsl
autocmd BufNewFile,BufRead *.md hi link MarkdownJekyllLiquidTag Comment
autocmd BufNewFile,BufRead *.md hi link MarkdownJekyllLiquidBlockTag Comment
autocmd BufNewFile,BufRead *.md hi link MarkdownJekyllFrontMatter Comment


" autocmd BufNewFile,BufRead *.md syntax region Comment start="{% comment %}" end="{% endcomment %}"
"}}}
" Fugitive{{{
let g:gitlab_api_keys = {'gitlab.com': '41KqRyT5WP4QqDTMc1Qx'}
"}}}

" Mac / XCode{{{
let g:smartim_default = 'com.apple.keylayout.Canadian'
let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'
let g:vim_pbcopy_local_cmd = "pbcopy"
" augroup swift
"     au!
"     autocmd FileType swift set colorcolumn=110,120
" augroup END
autocmd BufNewFile,BufRead *.swift set filetype=swift

if has("nvim")
let g:deoplete#enable_at_startup = 1
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
autocmd FileType swift set formatoptions+=ro
endif

" if executable('sourcekit-lsp')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'sourcekit-lsp',
"         \ 'cmd': {server_info->['sourcekit-lsp']},
"         \ 'whitelist': ['swift'],
"         \ })
" endif
" autocmd FileType swift setlocal omnifunc=lsp#complete


"}}}
" Javascript{{{
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
  augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"set conceallevel=1}}}
" Snippets{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set runtimepath+="~/.vim/my_snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
"}}}
" LaTeX{{{
let g:vimtex_view_general_viewer = 'open'
let g:vimtex_view_general_options = '-a Preview'
let g:vimtex_latexmk_options = '-pdf  -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
"}}}
" CtrlP & Grepper{{{
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
" Mark folders containing readme.md as root folders -- useful when working
" with qmk keyboard projects
let g:ctrlp_root_markers = ['readme.md']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|Pods|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

map <C-F> :Grepper<CR>
"}}}
" Quickfix{{{
let g:loclist_follow = 1
let g:loclist_follow_modes = 'n'            "[default: 'ni']
let g:loclist_follow_target = 'last'

"}}}
" COC{{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"}}}
if has("nvim")
    set inccommand=nosplit
endif
if has("termguicolors")
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set autoindent
set hlsearch
set number
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set scrolloff=3 " Keep 3 lines below and above the cursor
set mouse=a
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    " set ttymouse=xterm2
endif
set laststatus=2
set modeline
set modelines=10

function! ChangeKey()
    " normal! vi"
	let curline = getline('.')
    " normal! gv"ay
    normal! 02t"
    normal! "ayi"
    let old = @a
    call inputsave()
    let new = input('Enter substitution for "' . old . '": ')
    call inputrestore()
	let script="./Scripts/changekey.sh \"" . old . "\" \"" . new . "\""
	call system(script)
    :e
endfunction
nnoremap <C-q> :call ChangeKey()<CR>

hi link SwiftDocString Comment
hi link SwiftDocStringParam Comment
hi SwiftDocString gui=bold guifg=#697098
hi SwiftDocStringParam guifg=#a9b0d8
hi SwiftDocStringInlineCode guifg=#a9b0d8
