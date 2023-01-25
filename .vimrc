syntax on
set number
set ruler
set tabstop=4
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start "normalny backspace
"set laststatus=2
if has("gui_running")
	set cursorline
	set columns=80
	"set cursorcolumn
	colorscheme inkpot_gc

	au BufReadPost *.txt set syntax=txt
	set dictionary=C:\Vim\vim82\dictionary\c_cpp.dict

	"Folds
	"zo - open
	"zc - close
	"zR - open all
	"zm - increase depth
	"zr - decrease depth	
	"set foldmethod=syntax
	"auto close
	"set foldlevel=1
	"set foldclose=all

	"bracket coloring
	"au FileType c,cpp call rainbow#load() "load for *.c and *.cpp
	let g:rainbow_active=1 "active for all
	let g:rainbow_guifgs = ['yellow', 'magenta', 'aqua']	

	set guifont=Consolas:h12
	set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
	
	"add <CR> as end to admit(=confirm) compilation
	"<CR> emulate enter press (?)
	autocmd filetype cpp nnoremap <F5> :w <bar> !g++ % -o %:r && %:r.exe<CR>
	autocmd filetype c nnoremap <F5> :w <bar> !gcc % -o %:r && %:r.exe<CR>
	autocmd filetype asm nnoremap <F5> :w <bar> !nasm % -fwin64 -o %:r.obj -g && gcc %:r.obj -o %:r && %:r.exe -g<CR>
	autocmd filetype cpp,c,asm,rs nnoremap <F4> :w <bar> !make<CR>
	"nnoremap <F4> :w <bar> !make<CR>
	nnoremap <F9> :edit .vimrc<CR>
	autocmd filetype rust nnoremap <F5> :w <bar> !rustc % && %:r.exe<CR>
	autocmd filetype go nnoremap <F5> :w <bar> !go run %<CR>
	
	"Alt+Up Alt+Down <A-Up> or <M-Up> (same)
	nnoremap <M-Down> :m+1<CR>
	nnoremap <M-Up> :m-2<CR>
	"Copy to clipboard
	noremap <C-c> "+y
	"Cut to clipboard
	"inoremap <C-x> "+x
	"vnoremap <C-x> "+x
	"Paste from clipboard (+gP vs +gp ?)
	"noremap <C-v> "+gP 
	"Undo
	nnoremap <C-z> u
	"Redo (already exist <C-r>)
	nnoremap <C-y> :redo<CR>
	"Save
	noremap <C-s> <Esc>:w<CR>
	"Autocomplete from my own dictionary
	inoremap <C-Space> <C-x><C-k>
	"Duplicate
	nnoremap <C-d> Vyp
	"Select all
	nnoremap <C-a> ggVG
	"Hex view on
	nnoremap <C-q> :%!xxd<CR>
	"Hex view off
	nnoremap <C-e> :%!xxd -r<CR>
	"New tab
	nnoremap <C-t> :tabnew<CR>
	"Create Folds
	nnoremap <C-f> :set foldmethod=syntax<CR>
	"Jump over whole word
	inoremap <C-Right> w
	inoremap <C-Left>  b
	
	"Notes :
	"ga ascii of char under cursor
	"Visual Mode aw - select word
	"<C-k> is unmapped
endif