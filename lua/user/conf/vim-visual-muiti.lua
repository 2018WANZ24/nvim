vim.cmd [[
let g:VM_leader = {'default': '\', 'visual': '\', 'buffer': '\'}
let g:VM_maps = {}
let g:VM_custom_motions = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i'] = 'k'
let g:VM_maps['I'] = 'K'
let g:VM_maps['Find Under'] = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps["Select Cursor Down"] = 'E'
let g:VM_maps["Select Cursor Up"] = 'U'
let g:VM_maps['Find Next'] = ''
let g:VM_maps['Find Prev'] = ''
let g:VM_maps["Undo"] = 'l'
]]
