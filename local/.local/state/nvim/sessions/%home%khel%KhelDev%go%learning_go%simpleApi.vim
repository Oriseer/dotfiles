let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/KhelDev/go/learning_go/simpleApi
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +25 ~/KhelDev/go/learning_go/simpleApi/CLI.go
badd +24 ~/KhelDev/go/learning_go/simpleApi/cmd/cli/main.go
badd +15 ~/KhelDev/go/learning_go/simpleApi/CLI_test.go
badd +138 ~/KhelDev/go/learning_go/simpleApi/filesystem_store_test.go
badd +88 ~/KhelDev/go/learning_go/simpleApi/filesystem_store.go
badd +32 ~/KhelDev/go/learning_go/simpleApi/server.go
badd +31 ~/KhelDev/go/learning_go/simpleApi/testing.go
badd +19 ~/KhelDev/go/learning_go/simpleApi/cmd/webserver/main.go
argglobal
%argdel
edit ~/KhelDev/go/learning_go/simpleApi/CLI.go
argglobal
balt ~/KhelDev/go/learning_go/simpleApi/cmd/cli/main.go
setlocal foldmethod=expr
setlocal foldexpr=v:lua.require'lazyvim.util'.ui.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
14
sil! normal! zo
let s:l = 15 - ((14 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
