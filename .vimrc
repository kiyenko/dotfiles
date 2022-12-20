set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

"set number          " Show line numbers

colorscheme desert  " Set dark colorcheme

highlight TrailingSpace ctermbg=darkred guibg=red

autocmd VimEnter,Colorscheme * :hi TrailingSpace ctermbg=darkred guibg=red

highlight TrailingTab ctermbg=red guibg=green

autocmd VimEnter,Colorscheme * :hi TrailingTab ctermbg=red guibg=green

call matchadd('TrailingSpace', '\s\+$', 80)

call matchadd('TrailingTab', '\t\+$', 99)

" Enable filetype detection: https://superuser.com/questions/632657/how-to-setup-vim-to-edit-both-makefile-and-normal-code-files-with-two-different
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType diff set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType gitsendemail set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

" Remove trailing spaces on save
"autocmd BufWritePre * :%s/\s\+$//e
fun! StripTrailingWhitespace()
  " Don't strip on these filetypes
  if &ft =~ 'ruby\|javascript\|perl\|diff\|gitsendemail'
    return
  endif
  %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" :set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set listchars=tab:•◦
"set listchars=tab:▸▹
"set list   " Make tabs visible

syntax on
set laststatus=2
set backspace=indent,eol,start  " more powerful backspacing

" Statusline
set statusline=%.20F  " Full path to file (limit 20)
set statusline+=%=    " Switch to the right side
set statusline+=%l    " Current line
set statusline+=/     " Separator
set statusline+=%L    " Total lines
