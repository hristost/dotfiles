" vim: set foldmethod=marker:
" 
" Open folds with zo, close with zc
"

" Plugins{{{
call plug#begin(stdpath('data') . '/plugged')

Plug 'dhruvasagar/vim-markify'
Plug 'elbeardmorez/vim-loclist-follow'
Plug 'itchyny/lightline.vim'
" Color schemes{{{
Plug 'atelierbram/Base2Tone-vim'   
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'arzg/vim-colors-xcode'
Plug 'wadackel/vim-dogrun'
" Colour functions
Plug 'romgrk/lib.kom'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"}}}
" Prose and Markdown {{{
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'reedes/vim-pencil'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-liquid'
Plug 'mattn/emmet-vim'
" Plug 'gabrielelana/vim-markdown' " Slow table highlighting
Plug 'tpope/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
"}}}
" git{{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"}}}
" tmux integration{{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'keith/tmux.vim'"}}}
" Code navigation{{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-grepper' 
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'"}}}
" Swift / iOS{{{
if has('macunix')
    " XCode
    Plug 'gfontenot/vim-xcode'
    Plug 'ybian/smartim'
    " File types
    Plug 'hristost/swift.vim', {'branch': 'hs'}
    Plug 'darfink/vim-plist'
endif"}}}
" Pain
Plug 'pangloss/vim-javascript'

Plug 'metakirby5/codi.vim'
" Snippets
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-easy-align'

call plug#end()
"}}}
" Color scheme & Status bar {{{
"
" Favourite themes: Base2Tone_ForestDark, palenight, moonfly, dogrun, onedark
let g:palenight_terminal_italics=1
let g:onedark_terminal_italics=1

colorscheme dogrun
let g:lightline = {
      \ 'colorscheme': 'dogrun',
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
" Swift higlight extensions{{{
let s:colors = onedark#GetColors()
let s:comment_grey = s:colors.comment_grey.gui
let s:docstring = color#Lighten(s:comment_grey, '0.3')
let s:inline = color#Lighten(s:comment_grey, '0.6')

execute "highlight SwiftDocString gui=bold guifg=" (s:docstring)
execute "highlight SwiftDocStringParam guifg=" (s:inline)
execute "highlight SwiftDocStringInlineCode guifg=" (s:inline)
execute "highlight SwiftMarkerName gui=bold"

" }}}
" Highlight current line & column {{{
set nocuc
hi! link CursorLineNR CursorLine
hi! link CursorColumn CursorLine
" highlight Folded cterm=underline ctermbg=NONE

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    "utocmd WinEnter * set cuc
    "utocmd WinLeave * set nocuc
augroup END
"}}}
" Separator{{{
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE
" }}}
" Prose{{{

augroup prose
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END

let g:markdown_enable_folding = 1
let g:markdown_syntax_conceal = 0
"}}}
" Color previews{{{
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
"}}}
" Sytastic {{{
set timeoutlen=1000 ttimeoutlen=0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'swift': ['swiftlint'],
\}
let g:ale_javascript_eslint_executable = 'eslint'

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
" CtrlP & Grepper{{{
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
" Mark folders containing readme.md as root folders -- useful when working
" with qmk keyboard projects
let g:ctrlp_root_markers = ['readme.md']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|Pods|build|fastlane\/DerivedData)$',
  \ 'file': '\v\.(exe|so|dll|png)$',
  \ }

map <C-F> :Grepper<CR>
"}}}
" Quickfix{{{
let g:loclist_follow = 1
let g:loclist_follow_modes = 'n'            "[default: 'ni']
let g:loclist_follow_target = 'last'
"}}}

source $HOME/.config/nvim/coc.vim

set number                  " Show line number
set hlsearch                " Highlight search occurences
set inccommand=nosplit      " Show preview when substituting

if has("termguicolors")
    set termguicolors       " Use 24-bit colour when possible
endif

" Identation{{{
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set cino+=(0"}}}

set cursorline
set scrolloff=3             " Keep 3 lines below and above the cursor
set mouse=a
set laststatus=2

set modeline
set modelines=10

function! ChangeKey()
    " normal! vi"
	let curline = getline('.')
    " norl! gv"ay
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
