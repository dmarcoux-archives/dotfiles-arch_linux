" Use vim settings, rather than vi settings. It must be first because it changes other options
set nocompatible

"-------------------- Mouse & Mappings

" Mouse can be used in all modes
set mouse=a

" Mappings are recursive, so they will keep evaluating until they hit a dead end (a non-recursive mapping or the last mapping)
set remap

" Define extra key combinations with a map leader. For example, to save the current file, define: map <leader>w
let mapleader=","

" Backspace can be used over everything in insert mode
set backspace=indent,eol,start

" Left and right movements will go to the previous or next line when at start or end of line
set whichwrap+=<,>,h,l

"---------- Insert mode

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Non-recursive mapping for Shift+Tab to unindent
inoremap <S-Tab> <C-D>

"---------- Normal mode

" Non-recursive mapping for Space to open/close folds
nnoremap <Space> za

" Non-recursive mappings for Ctrl + J and Ctrl + K to move the current line(s)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Non-recursive mapping for > and < to indent/unindent quickly
nnoremap > >>
nnoremap < <<

"---------- Visual mode

" Non-recursive mappings for Ctrl + J and Ctrl + K to move selected line(s)
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"---------- Normal, visual and operator pending modes

" Non-recursive mapping to go quicker in command mode
noremap ; :

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Non-recursive mappings to move around long wrapped lines
noremap j gj
noremap k gk

" Non-recursive mapping for leader + Enter to disable text highlighting
noremap <silent> <leader><CR> :noh<CR>

" Non-recursive mapping for leader + a to search with ag (from the plugin ag.vim)
noremap <leader>a :Ag<Space>

" Non-recursive mapping for leader + b to list buffers and then be able to enter a buffer's number/name to switch to it
" Quite useful with the plugin ctrlp.vim
noremap <leader>b :buffers<CR>:buffer<Space>

" Recursive mapping of 0 to the first non-blank character of the line
map 0 ^

"-------------------- Command mode

" Non-recursive abbreviations for common typos when saving/quiting
cnoreabbrev W! w!
cnoreabbrev W w
cnoreabbrev Q! q!
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq

" Non-recursive abbreviation for ag.vim
cnoreabbrev ag Ag

" When forgetting to sudo before editing a file which requires root privileges, use w!! instead of w! to save changes
cmap w!! w !sudo tee % >/dev/null

"-------------------- UI Settings

" Enable syntax highlighting
syntax enable

" Set light solarized colorscheme
set background=light
colorscheme solarized

" Set the title of the terminal to the file name (up to maximum 70 characters)
set title
set titlestring=VIM:\ %F titlelen=70

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

" Folding based on syntax
set foldmethod=syntax

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
set softtabstop=2

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

"-------------------- History, Backup & System

" Hide buffers, instead of closing them.
" Having unwritten changes in a file and opening a new file using :e, won't force saving or undoing changes first.
" Undo buffers and marks are preserved while the buffer is open
set hidden

" Number of commands to remember
set history=1000

" Number of undos to remember
set undolevels=1000

" Link to the system clipboard
set clipboard^=unnamedplus

" Enable loading of plugins, settings, key mappings based on file types
filetype plugin indent on

" Read again files which were changed outside of vim
set autoread

" Set utf8 as standard encoding
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

" Use Unix as the standard file format
set fileformats=unix,dos,mac

" Disable backup
set nobackup
set nowritebackup

" Disable swap file
set noswapfile

"-------------------- Wildmenu

" Enable wildmenu, the command-line completion menu
set wildmenu

" Ignore case
set wildignorecase

" Ignore these files
set wildignore+=*~,.git\*,.hg\*,.svn\*

" List all matches without completing
set wildmode=longest,list,full

"-------------------- Functions

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

"-------------------- Plugins

" Start vim-plug (Vim plugin manager)
call plug#begin('~/.vim/plugged')

"---------- Search

" Use ag, a code searching tool
Plug 'https://github.com/rking/ag.vim'

" Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

"---------- Efficiency (Mappings & Movement)

" Motion on speed
Plug 'https://github.com/easymotion/vim-easymotion'

" Comment stuff out
Plug 'https://github.com/tpope/vim-commentary'

" Easily delete, change and add surroundings. Surroundings are parentheses, brackets, quotes, XML tags and more
Plug 'https://github.com/tpope/vim-surround'

"---------- Completion (Code & Snippets)

" Close parentheses and square/curly brackets automatically after pressing Enter
Plug 'https://github.com/rstacruz/vim-closer'

" End certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords
Plug 'https://github.com/tpope/vim-endwise'

" Snippets engine and the actual snippets
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'

" Add plugins to &runtimepath
call plug#end()

"-------------------- ctrlp.vim plugin settings

" Display match window at the bottom and order matching files top to bottom
let g:ctrlp_match_window='bottom,order:ttb'

" Files to ignore when matching
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'

" Use ag to find files
let g:ctrlp_user_command='ag %s -l --nocolor --hidden --ignore '+ g:ctrlp_custom_ignore +' -g ""'

"-------------------- UltiSnips plugin settings

" Press Tab to expand trigger
let g:UltiSnipsExpandTrigger="<Tab>"

" Press Tab and Shift+Tab to move back and forth inside snippet tabstops
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
