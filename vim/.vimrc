" Use vim settings, rather than vi settings. It must be first because it changes other options
set nocompatible

"-------------------- Plugins

"---------- Plugins Initialization

" Start vim-plug (Vim plugin manager)
call plug#begin('~/.vim/plugged')

"---------- Search Plugins

" Full path fuzzy file, buffer, mru, tag, ... finder
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

"---------- Efficiency Plugins

" Remaps . in a way that plugins can tap into it
Plug 'https://github.com/tpope/vim-repeat'

" Comment stuff out
Plug 'https://github.com/tpope/vim-commentary'

" Easily delete, change and add surroundings. Surroundings are parentheses, brackets, quotes, XML tags and more
Plug 'https://github.com/tpope/vim-surround'

" Try to automatically adjust 'shiftwidth' and 'expandtab' based on the current file or its parents
Plug 'https://github.com/tpope/vim-sleuth'

" Class outline viewer
Plug 'https://github.com/majutsushi/tagbar'

" Simple and easy-to-use alignment plugin
Plug 'https://github.com/junegunn/vim-easy-align'

" Simplifies the transition between multiline and single-line code
Plug 'https://github.com/AndrewRadev/splitjoin.vim'

"---------- Completion Plugins

" Close parentheses and square/curly brackets automatically after pressing Enter
Plug 'https://github.com/rstacruz/vim-closer'

" End certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords
Plug 'https://github.com/tpope/vim-endwise'

" Insert or delete brackets, parens, quotes in pair
Plug 'https://github.com/jiangmiao/auto-pairs'

" Snippets engine and the actual snippets
" Group dependencies, vim-snippets depends on ultisnips
Plug 'https://github.com/SirVer/ultisnips' | Plug 'https://github.com/honza/vim-snippets'

"---------- Environment Specific Plugins

" Configuration files for Ruby
Plug 'https://github.com/vim-ruby/vim-ruby', { 'for': 'ruby' }

" Configuration files for Git runtime files
Plug 'https://github.com/tpope/vim-git'

" Configuration files for Elixir
Plug 'https://github.com/elixir-lang/vim-elixir', { 'for': 'elixir' }

" Configuration files for Go
Plug 'https://github.com/fatih/vim-go', { 'for': 'go' }

"---------- Colorscheme Plugins

" Solarized light and dark colorscheme
Plug 'https://github.com/altercation/vim-colors-solarized'

"---------- Loading Plugins

" Add plugins to &runtimepath
call plug#end()

"-------------------- Plugins Settings

"---------- ctrlp.vim

" Display match window at the bottom and order matching files top to bottom
let g:ctrlp_match_window='bottom,order:ttb'

" Use ag to find files
" %s -> Target directory
" -l -> display matching files, not matching lines
" --nocolor -> disable color printing
" --hidden -> match hidden files
" -g -> print matching filenames
let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'

" When opening a file, if it's already open in a window somewhere, try to jump to it instead of opening a new instance
let g:ctrlp_switch_buffer='Et'

"---------- UltiSnips

" Press Tab to expand trigger
let g:UltiSnipsExpandTrigger="<Tab>"

" Press Tab and Shift+Tab to move back and forth inside snippet tabstops
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"---------- vim-colors-solarized

" Set solarized light colorscheme
set background=light
colorscheme solarized

"---------- tagbar

autocmd BufEnter * :TagbarOpen

"---------- auto-pairs

" Remove the default mapping to toggle auto-pairs
let g:AutoPairsShortcutToggle = ''

" Remove the default mapping to jump to the next closed pair
let g:AutoPairsShortcutJump = ''

"---------- vim-go

" Change the gofmt command to goimports
let g:go_fmt_command='goimports'

" Always use the quickfix list for vim-go's output
let g:go_list_type="quickfix"

" Highlight all uses of the identifier under the cursor (:GoSameIds)
let g:go_auto_sameids=1

" Enable syntax highlithing for types, fields, etc...
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_extra_types=1
let g:go_highlight_generate_tags=1

"-------------------- Mappings

" Mouse can be used in all modes
set mouse=a

" Backspace can be used over everything in insert mode
set backspace=indent,eol,start

" Mappings are recursive, so they will keep evaluating until they hit a dead end (a non-recursive mapping or the last mapping)
set remap

" Define extra key combinations with a map leader. For example, to save the current file, define: map <leader>w
let mapleader=","

" Left and right movements will go to the previous or next line when at start or end of line
set whichwrap+=<,>,h,l

"---------- Insert Mode

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Non-recursive mapping for Shift+Tab to unindent
inoremap <S-Tab> <C-D>

"---------- Normal Mode

" Non-recursive mapping for Space to open/close folds
nnoremap <Space> za

" Non-recursive mappings for Ctrl + J and Ctrl + K to move the current line(s)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

"---------- Visual and Select Modes

" Non-recursive mappings for Ctrl + J and Ctrl + K to move selected line(s)
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"---------- Visual Mode

" Recursive mapping to start interactive EasyAlign (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"---------- Normal, Visual and Operator Pending Modes

" Non-recursive mappings for arrows keys to perform no operation (<NOP>)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Non-recursive mappings to move around long wrapped lines
noremap j gj
noremap k gk

" Recursive mapping to start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Non-recursive mapping for leader + Enter to disable text highlighting
noremap <silent> <leader><CR> :noh<CR>

" Non-recursive mapping for Ctrl + B to start ctrlp.vim in buffer mode, which is handy to switch between opened buffers
noremap <C-B> :CtrlPBuffer<CR>

"-------------------- Command Mode

" Non-recursive abbreviations for common typos when saving/quiting
cnoreabbrev W! w!
cnoreabbrev W w
cnoreabbrev Q! q!
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq

" When forgetting to sudo before editing a file which requires root privileges, use w!! instead of w! to save changes
cmap w!! w !sudo tee % >/dev/null

"-------------------- UI Settings

" Enable syntax highlighting
syntax enable

" Set the title of the terminal to the file name (up to maximum 70 characters)
set title
set titlestring=vim:\ %F titlelen=70

" Show column and line numbers at the bottom
set ruler

" Always show the status line at the bottom
set laststatus=2

" Format the status line
set statusline=\ FILE:\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Highlight the column and line where the cursor is currently
set cursorcolumn
set cursorline

" Show the line number where the cursor is located and around it, show relative line numbers
set number
set relativenumber

" Height (in number of lines) of the command bar at the bottom
set cmdheight=2

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Minimal number of screen lines to keep above and below the cursor when moving vertically (if possible...)
set scrolloff=10

" Display tabs and trailing spaces as ·
set list listchars=tab:\>·,trail:·

" Disable word wrapping
set nowrap

" Visually line break on lines of 500 characters (without actually inserting line break)
set linebreak
set tw=500

" Don't redraw while executing macros, registers and other commands
set lazyredraw

"-------------------- Search Settings

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Match search pattern while typing
set incsearch

"-------------------- Space, Tabs & Indentation

" Copy indent from current line when starting a new line
set autoindent

" An indent is automatically inserted:
"- After a line ending in '{'.
"- After a line starting with a keyword from this list: if, else, while, do, for, switch
"- Before a line starting with '}' (only with the 'O' command).
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

"-------------------- Autocommands

" Remove all trailing whitespaces right before saving
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufReadPost *.md call SetMarkdownOptions()
function SetMarkdownOptions()
    " Force Markdown type for all files with the .md extension (from tpope/vim-markdown)
    set filetype=markdown
    " Wrap lines at 80 characters
    setlocal textwidth=80
endfunction

" Move the quickfix window at the very bottom, no matter what
" See ':help :wincmd' and ':help ^WJ' for more info
autocmd FileType qf wincmd J
