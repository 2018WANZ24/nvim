vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_WindowLayout = 2
vim.g.undotree_DiffpanelHeight = 8
vim.g.undotree_SplitWidth = 24
vim.cmd [[
function g:Undotree_CustomMap()
  nmap <buffer> u <plug>UndotreeNextState
  nmap <buffer> e <plug>UndotreePreviousState
  nmap <buffer> U 5<plug>UndotreeNextState
  nmap <buffer> E 5<plug>UndotreePreviousState
endfunc
]]
