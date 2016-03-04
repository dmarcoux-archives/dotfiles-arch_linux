" Use vim settings, rather than vi settings. It must be first because it changes other options
set nocompatible

"-------------------- Mouse & Mappings

" Mouse can be used in all modes
set mouse=a

" Mappings are recursive, so they will keep evaluating until they hit a dead end (a non-recursive mapping or the last mapping)
set remap

" Define extra key combinations with a map leader. For example, to save the current file, define: map <leader>w
let mapleader = ","

"---------- Insert mode

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"---------- Normal mode

" Non-recursive mapping for space to open/close folds
nnoremap <space> za

"---------- Normal, visual and operator pending modes

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Non-recursive mappings to move around long wrapped lines
noremap j gj
noremap k gk

" Non-recursive mapping for leader + Enter to disable text highlighting
noremap <silent> <leader><cr> :noh<cr>

" Recursive mapping of 0 to the first non-blank character of the line
map 0 ^

"-------------------- UI Settings

" Enable syntax highlighting
syntax enable

" Set light solarized colorscheme
set background=light
colorscheme solarized

" Show column and line numbers at the bottom
set ruler

" Always show the status line at the bottom
set laststatus=2

" Format the status line
set statusline=\ FILE:\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Highlight the column and line where the cursor is currently
set cursorcolumn
set cursorline

" Show line numbers on the left side
set number

" Height (in number of lines) of the command bar at the bottom
set cmdheight=2

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Minimal number of screen lines to keep above and below the cursor when moving vertically (if possible...)
set scrolloff=7

" Display tabs and trailing spaces as ·
set list listchars=tab:\ \ ,trail:·

" Enable word wrapping (only visually, without actually changing the buffer)
set wrap

" Visually line break on lines of 500 characters (without actually inserting line break)
set linebreak
set tw=500

" Don't redraw while executing macros, registers and other commands
set lazyredraw

"-------------------- Folding

" Enable folding
set foldenable

" Folding based on indentation
set foldmethod=indent

" When opening a file, open folds up to 10 levels deep
set foldlevelstart=10

" Folds have a maximum of 10 levels deep
set foldnestmax=10

"-------------------- Search Settings

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Match search pattern while typing
set incsearch

"-------------------- Space, Tabs & Indentation

" Use spaces instead of tabs
set expandtab

" 1 tab is always converted to 2 spaces
set tabstop=2

" When indenting with commands '<<' and '>>', it will add/remove 2 spaces
set shiftwidth=2

" When using <Tab> or <BS> (Backspace), it will indent itself with surrounding lines
set smarttab

" Copy indent from current line when starting a new line
set autoindent

" An indent is automatically inserted:
"	- After a line ending in '{'.
"	- After a line starting with a keyword from this list: if, else, while, do, for, switch
"	- Before a line starting with '}' (only with the 'O' command).
set smartindent

"-------------------- Misc (TODO: CLEAN UP & ADD BETTER COMMENTS)

" Hide buffers, not close them
set hidden

" Sets how many lines of history VIM has to remember
set history=1000

" Link to the system clipboard
set clipboard^=unnamedplus

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Lazy file name tab completion
set wildmode=longest,list,full

" Turn on the WiLd menu, ignore case and compiled files
set wildmenu
set wildignorecase
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Left and right movements will go to the previous or next line when at start or end of line
set whichwrap+=<,>,h,l

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

"-------------------- Functions

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
