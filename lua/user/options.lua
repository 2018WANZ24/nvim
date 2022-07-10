local options = {
  backup = false,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8",
  ignorecase = true,
  mouse = "a",
  pumheight = 10, -- pop up menu height
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 250,
  backupdir = "/Users/wanz/.config/nvim/tmp/backup",
  directory = "/Users/wanz/.config/nvim/tmp/backup",
  undofile = true,
  undodir = "/Users/wanz/.config/nvim/tmp/backup",
  updatetime = 100,
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  scrolloff = 5,
  sidescrolloff = 5,
  foldmethod = "indent",
  -- foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,
  foldlevel = 99,
  spell = false,
  spelllang = { 'en_us' },
  diffopt = "vertical,filler,internal,context:4", -- vertical diff split view
  cscopequickfix = "s-,c-,d-,i-,t-,e-", -- cscope output to quickfix window
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
