" denite
nmap <leader>b :Denite buffer -split=floating -winrow=0<CR>
nmap <leader>p :Denite file/rec -split=floating -winrow=0<CR>

nmap <C-b> :FZF -split=floating<cr>
nmap <leader>e :Ex<cr>

" window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" page navigation
noremap <Space> <PageDown>
noremap - <PageUp>
