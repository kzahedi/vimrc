"" author: Keyan Zahedi (keyan.zahedi@gmail.com)

set nocp
filetype on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vim-scripts/TaskList.vim'
Plug 'DfrankUtil'
Plug 'LustyExplorer'
Plug 'The-NERD-Commenter'
Plug 'UltiSnips'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'VisIncr'
Plug 'a.vim'
Plug 'bufkill.vim'
Plug 'JuliaLang/julia-vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-pathogen'
Plug 'https://github.com/wincent/command-t'
Plug 'vim-easy-align'
Plug 'vimprj'
Plug 'flazz/vim-colorschemes'
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'bling/vim-airline'
Plug 'https://github.com/Shougo/neocomplete.vim'
Plug 'https://github.com/asenac/vim-airline-loclist.git'
Plug 'https://github.com/Rip-Rip/clang_complete'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/Shougo/vimshell.vim'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/mileszs/ack.vim'

call plug#end()

syntax on

set noswapfile
set undofile
set undodir=~/.vim/data/undofiles
set vb
set nohls
set noincsearch
set backupdir=$HOME/.vim/data/backup " where to put backup file
set directory=$HOME/.vim/data/swap " where to put swap file
set runtimepath+=/Applications/MacVim.app/Contents/Resources/vim/runtime
set runtimepath+=~/.vim
set macthinstrokes
set path+=/usr/local/include/
set path+=/Users/zahedi/projects/mpi/mis.gso/src
set path+=/Users/zahedi/projects/yars/src

set tags+=~/.vim/data/tags/ogre
set tags+=~/.vim/data/tags/sdl2
set tags+=~/.vim/data/tags/usr.include
set tags+=~/.vim/data/tags/bullet

set ve=block
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:2,=s,l0,b0,g2,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30
set backspace=indent,eol,start
set bs=2
set completeopt=menu
set encoding=utf-8
set termencoding=utf-8
set formatoptions=roqn2t
set fileformat=unix
set grepformat=%f:%l:%m
set guioptions=-T
set guioptions=Me
set hidden
set history=500  " keep 50 lines of command line history
set laststatus=1
set statusline=%f%m%r%w%=(%{&ff},\ %y)\ \ %{'Tab:'.tabpagenr()}\ \ %v,%l/%L\ %P
set statusline+=%#warningmsg#
set statusline+=%*
set magic
set mousehide
set nobackup
set nobuflisted
set nojoinspaces " so that only one ' ' is inserted when lines are joined
set nomore
set nosmartcase noignorecase
set nostartofline
set ruler
set shellslash
set shiftwidth=2
set showcmd      " display incomplete commands
set showmatch
set showmode
set whichwrap=b,s
set spelllang=en_gb
set tabstop=2
set expandtab
set tw=80
set vb t_vb=
set wildignore+=*.class,*.dvi,*.aux,*.ps,*.pdf,*.lot,*.lof,*.png,*.gz,*.ps.gz,*.idx,*.ind,*.ilg,*.bbl,*.blg,*.and,*.brf,*.adx,build/
set wildmenu
set list listchars=tab:>-

if has("gui_running")
  colorscheme mydarkZ
  set fuopt=
  set number
  set guiheadroom=0
  set spell
  set cursorline
  set guifont=Menlo:h14
  hi Pmenu ctermbg=darkblue ctermfg=lightgray guibg=darkblue guifg=lightgray
else
  colorscheme darkZ
endif

let data_dir   = $HOME.'/.vim/data/'
let backup_dir = data_dir . 'backup'
let swap_dir   = data_dir . 'swap'
if finddir(data_dir) == ''
  silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
  silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
  silent call mkdir(swap_dir)
endif

let mapleader = ","

" airline
let g:airline_section_a = ''
let g:airline_section_b = ''

" indent
let g:indent_guides_start_level=2
hi IndentGuidesOdd  guibg=white
hi IndentGuidesEven guibg=lightgrey

" super tab
let g:SuperTabDefaultCompletionType = '<C-n>'

" to avoid flickering
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
autocmd FileType nerdtree execute 'sign unplace 9999'

" ultisnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" goyo
let g:goyo_width=85
map ,G :Goyo:colorscheme mydarkZ

" syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers=['pylint']
let g:syntastic_disabled_filetypes=['vim', 'tex']
let s:wrapkeys = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_auto_loc_list = 2


" NERDTree
let NERDTreeIgnore=['\.project_tags$', '\~$']
let NERDSpaceDelims=1
let g:nerdtree_tabs_autofind=1
let NERDTreeChDirMode=2
map <C-BS> :NERDTree

" spell
map ,us   :set spelllang=en_us
map ,uk   :set spelllang=en_gb
map ,de   :set spelllang=de_DE

" change font quickly
map ,10   :set guifont=Menlo:h10
map ,11   :set guifont=Menlo:h11
map ,12   :set guifont=Menlo:h12
map ,13   :set guifont=Menlo:h13
map ,14   :set guifont=Menlo:h14
map ,15   :set guifont=Menlo:h15
map ,16   :set guifont=Menlo:h16
map ,17   :set guifont=Menlo:h17
map ,18   :set guifont=Menlo:h18
map ,19   :set guifont=Menlo:h19
map ,20   :set guifont=Menlo:h20
map ,22   :set guifont=Menlo:h22
map ,24   :set guifont=Menlo:h24
map ,26   :set guifont=Menlo:h26

" easy align
vnoremap <silent> <Enter> :EasyAlign<cr>

"" julia
au BufNewFile,BufEnter *.jl setl filetype=julia
au BufNewFile,BufEnter *.jl setl tw=0
au BufNewFile,BufEnter *.jl let g:latex_to_unicode_auto=1
au BufNewFile,BufEnter *.jl let g:latex_to_unicode_suggestions=1

" python
au BufNewFile,BufEnter *.py  setl sw=4

" xml
au BufNewFile,BufEnter *.xml setl foldmethod=marker
au BufNewFile,BufEnter *.xml let g:xml_syntax_folding=1

" C++
let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/"
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
map ,mm :call Make()
autocmd BufWritePost   *.cpp,*.h,*.c,*.hpp call UpdateTags()
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
autocmd BufEnter           *.cmake,CMakeLists.txt,*.cmake.in setl nospell
autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

" vimrc stuff
map ,lo :e ~/.vimrc
au! BufWritePost .vimrc so %
au! BufWritePost .gvimrc so %

function! s:BCA()
  bwipe
  bufdo :bw
  :cd
endfunc

:command! -nargs=0 BCA :call s:BCA()

" navigating long lines
map  <C-DOWN> gj
map  <C-UP>   gk
imap <C-UP>   <ESC>gki
imap <C-DOWN> <ESC>gji

" latex
map ,ff mzgq}'zz.

au BufNewFile,BufEnter,BufRead *.tex let g:syntastic_auto_loc_list = 2
" au BufNewFile,BufEnter,BufRead *.tex set formatoptions+=a
" au BufNewFile,BufEnter,BufRead *.tex set formatlistpat=^\\s*\\\\\\(end\\\\|item\\\\|begin\\)\\>

let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\*\?\_\s*{'
let g:LatexBox_quickfix = 0
let g:LatexBox_latexmk_options = '-r ~/.latexmkrc'
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p"<CR>

let g:Tex_IgnoredWarnings ='
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n".
      \"LaTeX Font Warning\n".
      \"Citation %.%# undefined\n".
      \"\oval, \circle, or \line size unavailable\n"'

"" neocomplete (copied from the internet)
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
