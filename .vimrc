"My VIMRC
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 " Plugin 'ascenator/L9', {'name': 'newL9'}

" My Plugins
Bundle "scrooloose/nerdtree"

"" Autocomplete
" Bundle \"Shougo/neocomplcache.vim" 
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neosnippet-snippets'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
Plugin 'honza/vim-snippets'

" Command-t (File Navigation)
" Plugin 'wincent/command-t'
Plugin 'kien/ctrlp.vim'

" Colorscheme
Plugin 'morhetz/gruvbox'

" Vim latex
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'

" Vim Wiki (Markdown)
Plugin 'vimwiki/vimwiki'
Plugin 'shime/vim-livedown'

Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'

" Vim and Tmux seemless navigation
Plugin 'christoomey/vim-tmux-navigator'

" Commenting
Plugin 'scrooloose/nerdcommenter'

" Grammer checker
Plugin 'rhysd/vim-grammarous'

" Auto close brackets but like smart
" Plugin 'Townk/vim-autoclose'
Plugin 'https://github.com/Raimondi/delimitMate'

"Dart
Plugin 'https://github.com/dart-lang/dart-vim-plugin'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"Auto Complet Setup
"Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
" let g:neocomplcache_enable_smart_case = 1

" YouCompleteMe and UltiSnips compatibility.
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsEditSplit = 'vertical'
" Latex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'evince'
nmap <F12> :LLPStartPreview<cr>

" Vim Wiki Setup
let g:vimwiki_folding='custom'
let g:vimwiki_list = [{'path': '~/CS/Notes/', 'syntax': 'markdown', 'ext': '.Rmd'}, {'path': '~/Documents/IB/', 'syntax': 'markdown', 'ext': '.Rmd'}]
let mapleader=","
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>sudo<space>R<space>--vanilla<enter>
autocmd Filetype rmd map <F6> :! google-chrome-stable<space>'<c-r>%<backspace><backspace><backspace>html'

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = "firefox"

" File Search - Control P
let g:ctrlp_show_hidden = 1

syntax on
set background=dark
colorscheme gruvbox
set number
set relativenumber
set tabstop=4

" Use Control A as Escape
imap <C-A> <Esc>
vmap <C-A> <Esc>
nmap <C-A> <Esc>

" Cop and Paste Setiings
set pastetoggle=<F2> "F2 before pasting to preserve indentation

"Map Ctrl + E and Ctrl + E then e to save and quit
map <C-E> :w<CR> 
map <C-E>e :wq<CR>

" Splits
set splitbelow
set splitright

" Folding
set foldmethod=expr
function! RmdFold()
		let line = getline(v:lnum)
		if match(line, '^\\begin') > -1
				return ">1"
		elseif match(line, '^\\end') > -1
				return "<1"
		else
				return "="
		endif
endfunction

autocmd Filetype vimwiki setlocal foldmethod=expr foldexpr=RmdFold()

vmap <C-c> "+yi
