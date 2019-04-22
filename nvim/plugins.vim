" vim-one
let g:one_allow_italics = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#syntax#min_keyword_length = 2

" startify
let g:startify_fortune_use_unicode = 1

" fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'right': '~30%' }

" denite
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('buffer', 'date_format', '')

let s:denite_options = {'default' : {
      \ 'auto_resize': 1,
      \ 'prompt': 'λ:',
      \ 'direction': 'dynamicbottom',
      \ 'winminheight': '10',
      \ 'highlight_mode_insert': 'Visual',
      \ 'highlight_mode_normal': 'Visual',
      \ 'prompt_highlight': 'Function',
      \ 'highlight_matched_char': 'Function',
      \ 'highlight_matched_range': 'Normal' }}
