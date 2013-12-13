set et                  " Expand tabs to spaces
set tabstop=4           " One tab equals 4 spaces (default is 8)
set sw=4                " (shiftwidth) Auto-indent uses 4 spaces (default is 8)
set nowrapscan          " Don't search from the top if end-of-file is reached
set smartcase           " Smartcase: ignore case except when upper case is typed
set ignorecase          " Ignore case during searches
set hlsearch
set ruler

" Enable syntax highlighting
syntax on

" Highlight tabs in red so they can be removed!
highlight Tabs ctermbg=red guibg=red
match Tabs /\t/

" Highlight traling spaces in blue so they can be removed!
highlight TrailingSpace ctermbg=blue guibg=blue
2match TrailingSpace /\s\+$/

" turn off auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use 2 spaces instead of 4 for puppet files per the style guide
autocmd FileType puppet setlocal sw=2 ts=2

" Turn off expandtab for Makefiles
autocmd FileType make setlocal noexpandtab
