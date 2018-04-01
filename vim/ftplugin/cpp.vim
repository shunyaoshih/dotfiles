if has('unix')
  noremap <buffer><F9> :terminal g++ -O2 -Wall -Wshadow '%' -o '%<'<CR>
endif
if has('mac')
  noremap <buffer><F9> :terminal g++-7 -std=c++1z -O2 -Wall -Wshadow '%' -o '%<'<CR>
endif

noremap <buffer><F5> :terminal './%<'<CR>
noremap <buffer><F6> :terminal './%<' < './%<.in'<CR>
noremap <buffer><F7> :terminal './%<' < './%<.in' > './%<.out'<CR>
