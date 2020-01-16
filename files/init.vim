
"  __      _______ __  __ _____   _____   "  
"  \ \    / /_   _|  \/  |  __ \ / ____|  "
"   \ \  / /  | | | \  / | |__) | |       "
"    \ \/ /   | | | |\/| |  _  /| |       "
"     \  /   _| |_| |  | | | \ \| |____   "
"      \/   |_____|_|  |_|_|  \_\\_____|  "
"                                         "
"
                                      
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ElmCast/elm-vim'

" Colour Scheme
Plug 'morhetz/gruvbox'

" Vim Wiki
Plug 'vimwiki/vimwiki'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'

"CoVIM
Plug 'makerforceio/CoVim'

call plug#end()

let mapleader=","
" Use Control A as Escape
imap <C-A> <Esc>
vmap <C-A> <Esc>
nmap <C-A> <Esc>

syntax on
set background=dark
colorscheme gruvbox
set number
set relativenumber
set tabstop=4
set softtabstop=2 shiftwidth=2 expandtab
set mouse=a

"" Auto compile with F5
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>sudo<space>R<space>--vanilla<enter>

"Map Ctrl + E and Ctrl + E then e to save and quit
map <C-E> :w<CR> 
map <C-E>e :wq<CR>

" Splits
set splitbelow
set splitright

" Control P Setup
let g:ctrlp_map = '<c-p>'

" Vim Wiki Setup.
let g:vimwiki_folding='custom'
let g:vimwiki_list = [{'path': '~/Documents/uni/Notes/', 'syntax': 'markdown', 'ext': '.Rmd'}, {'path': '~/Documents/IB/', 'syntax': 'markdown', 'ext': '.Rmd'}]
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


" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"   ___  __    ___  " 
"  / __)/  \  / __) "
" ( (__(  O )( (__  "
"  \___)\__/  \___) "
" 		    "

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> re <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
