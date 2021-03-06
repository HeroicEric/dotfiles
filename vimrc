" Leader
let mapleader = " "

set nocompatible   " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching
set laststatus=2   " Always display the status line
set vb             " No audible bell

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.plugs"))
  source ~/.vimrc.plugs
endif

filetype plugin indent on

" https://github.com/neoclide/coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.hbs set filetype=handlebars

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Color scheme
colorscheme nord

" set background=light
" colorscheme cosmic_latte

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Allow
set clipboard+=unnamed

" Numbers
set relativenumber
set numberwidth=5

" Allow switching between rel and abs number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Toggle relative line numbers
nnoremap <C-n> :call NumberToggle()<cr>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

let g:fzf_command_prefix = 'Fzf'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" NERDTree
map <leader>k :NERDTreeToggle<cr>

" Tab Movement
nnoremap <leader>] :tabnext<CR>
nnoremap <leader>[ :tabprevious<CR>

" Reorder tabs
nnoremap <leader>{ :tabm -1<CR>
nnoremap <leader>} :tabm +1<CR>

" Show current highlight group
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

let NERDTreeShowHidden=1

" Pick settings
nnoremap <leader>p :FzfGFiles --cached --exclude-standard --others<CR>

" Needed for italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

highlight Comment cterm=italic
highlight htmlArg cterm=italic

set foldmethod=indent
set nofoldenable

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

let g:markdown_fenced_languages = ['css', 'elixir', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'typescript=javascript', 'ruby', 'sass', 'xml']
