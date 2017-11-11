if has('mac')
  noremap <buffer><F9> :! g++-7 -O2 -Wall -Wshadow '%' -o '%<'<CR>
endif
if has('unix')
  noremap <buffer><F9> :! g++ -O2 -Wall -Wshadow '%' -o '%<'<CR>
endif

noremap <buffer><F5> :! './%<'<CR>
noremap <buffer><F6> :! './%<' < './%<.in'<CR>
noremap <buffer><F7> :! './%<' < './%<.in' > './%<.out'<CR>
