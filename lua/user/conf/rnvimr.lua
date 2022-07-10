vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_bw_enable = 1
vim.cmd [[
let g:rnvimr_action = {
      \ '<C-t>': 'NvimEdit tabedit',
      \ '<C-x>': 'NvimEdit split',
      \ '<C-p>': 'NvimEdit vsplit',
      \ 'gw': 'JumpNvimCwd',
      \ 'yw': 'EmitRangerCwd'
      \ }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
]]
