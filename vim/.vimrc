map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <SPACE> *
set nocp
filetype plugin on

set nu
set tabstop=4
set shiftwidth=4

" Tlist setting
" let Tlist_Use_Right_Window = 1
let Tlist_File_Fode_Auto_Close = 1
" let Tlist_Auto_Open = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Show_Menu = 1
map <F8> :Tlist<CR> 

" cscope {{{
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
  endif
  set csto=0

  " auto load cscope.out file (TODO:not work in window now)
  function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      echo db
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  "au BufEnter /* call LoadCscope()
autocmd FileType c,cpp call LoadCscope()
  " short command
  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap ff :cs find f <C-R>=expand("<cfile>")<CR><CR>:botright copen<CR>
  nmap fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright copen<CR>
  nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
endif
"}}}
" Path setting {{{
set path+=;,include;inc;
"}}}
