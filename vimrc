" Sets Vi compatibility to off. Put the first!
set nocompatible

" Let Pathogen do its thing and load its plugins.
call pathogen#infect()

" Enable loading the plugin files for specific file types
filetype plugin on

" Enable loading the indent file for specific file types
filetype indent on

" Enable syntax highlighting.
syntax on

" Automatically indent with braces, etc.
set smartindent

" By default, set tabs to 4 spaces.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Use UTF-8.
set encoding=utf-8

set laststatus=2

" Show line number and cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show the current editing mode.
set showmode

" Set the visual bell, but disable it in gvimrc with 'set vb t_vb=' so no beep
" or flash ever occurs: http://vim.wikia.com/wiki/Disable_beeping
set visualbell

" Unfold all folds by default.
set foldlevel=99



" Files to ignore (ctrl-p, CommandT, etc.)
set wildignore+=*.pyc,*.png,*.o,.build*

" ------------------------------------------------------------------
" KEYBOARD

" I always hit W instead of w to save files. This aliases W.
command W write

" This causes the navigation keys to go across wrapped lines, instead of
" skipping over them to the next actual numbered line.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" These also enable 0 and $ to go to the beginning and end of the wrapped
" line, instead of the actual line.
"nnoremap 0 g0
"nnoremap $ g$
"vnoremap 0 g0
"vnoremap $ g$

" Don't outdent Python comments when typing #
inoremap # <space><C-H>#

" For convenience, use C-hjkl to navigate between windows.
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Press <C-w><C-e> to move the error window in the bottom right to the bottom
" taking the whole width. Enables the window to stay out of the way until
" needed.
nnoremap <C-w><C-e> <C-W>b<C-w>J


" ------------------------------------------------------------------
" GUI-RELATED

if has("mouse")
    set mouse=a
endif

if has("gui_running")
    " Start NERDTree and focus the main window.
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    " Show the Tagbar on startup.
    autocmd VimEnter * TagbarOpen
endif

if has("gui_running")
    set background=dark
    " Render whitespace characters subtly.
    let g:solarized_visibility = "low"
    " Set the options before setting the color scheme.
    colorscheme solarized
else
    colorscheme desert-awm
endif

" Show whitespace characters, end of line, trailine space, etc.
set listchars=eol:¶,tab:⌐ ,trail:~,extends:>,precedes:<
set list


" ------------------------------------------------------------------
" Python-Mode plugin settings

let g:pymode_lint_checker = "pyflakes,mccabe"

" Override some of the default format, text wrapping, etc.
let g:pymode_options_other = 0
set complete+=t
set formatoptions-=t
" Set the column indicator to 100 characters wide
set colorcolumn=100
" Wrap at 100 characters.
set textwidth=100
" Show line numbers
set number
set nowrap

" ------------------------------------------------------------------
" NERDTree Plugin

" Ignores for NERDTree.
let NERDTreeIgnore = ['\.pyc','\.png']


" ------------------------------------------------------------------
" Custom Syntax Files

" Syntax for Fora source files.
au BufRead,BufNewFile *.fora set filetype=fora
au BufRead,BufNewFile *.cppml set filetype=cpp
au BufRead,BufNewFile *.hppml set filetype=cpp

" Set Ruby tabs to 2 spaces.
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab


