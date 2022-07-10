local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "n", "e", "u", "i" },
    v = { "n", "e", "u", "i" },
  },
}

local opts1 = {
  mode = "n", -- NORMAL mode
  prefix = "<Space>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local opts2 = {
  mode = "v", -- NORMAL mode
  prefix = "<Space>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
  h = {
    name = "Highlight",
    h = { ":<c-u>HSHighlight 1<cr>", "Highlight" },
    r = { ":<c-u>HSRmHighlight 1<cr>", "Remove highlight" },
  },
  r = {
    name = "Run",
    f = { ":%SnipRun<cr>", "SnipRun" },
  },
}
local mappings = {
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  c = { "<cmd>bd<cr>", "Close Buffer" },
  C = { "<cmd>%bd|e#<cr>", "Close Other Buffers" },
  e = { "<cmd>UltestSummary<cr>", "Unit Test" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  t = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>",
      "Toggle Breakpoint" },
    B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    T = { "<cmd>lua require'dapui'.toggle('sidebar')<cr>", "Toggle Sidebar" },
    X = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },

    -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    -- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    -- d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    -- e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    -- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    -- h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    -- S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    -- t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    -- u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },
  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit for file" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    f = { "<cmd>DiffviewFileHistory<cr>", "File History" },
    g = { "<cmd>Gitsigns setloclist<cr>", "Open changed hunk" },
    i = { "<cmd>LazyGit<cr>", "Lazygit" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>DiffviewOpen<cr>", "Diff Project" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
  },
  l = {
    name = "LSP",
    c = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Calltree" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    D = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    u = { "<cmd>Trouble lsp_references<cr>", "Usage" },
  },
  m = {
    name = "CMake",
    a = { "<cmd>CMake build_all<cr>", "BuildAll" },
    b = { "<cmd>CMake build<cr>", "BuildTarget" },
    c = { "<cmd>CMake cancel<cr>", "Cancel" },
    d = { "<cmd>CMake build_and_debug<cr>", "DebugTarget" },
    g = { "<cmd>CMake configure<cr>", "Configure" },
    r = { "<cmd>CMake build_and_run<cr>", "Run" },
    s = { "<cmd>CMake set_target_args<cr>", "SetArg" },
    t = { "<cmd>CMake select_target<cr>", "SelectTarget" },
    T = { "<cmd>CMake select_build_type<cr>", "SelectBuildType" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerClean<cr>", "Clean" },
    C = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  r = {
    name = "Run",
    d = { "<cmd>UltestDebugNearest<cr>", "UltestDebugNearest" },
    r = { "<cmd>UltestNearest<cr>", "UltestNearest" },
    f = { ":%SnipRun<cr>", "SnipRun" },
  },
  s = {
    name = "Search",
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    P = { "<cmd>SessionManager load_session<cr>", "Project Sessions" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    t = { "<cmd>Telescope live_grep_args<cr>", "Text" },
    T = { "<cmd>TodoTelescope<cr>", "Todo" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts1)
which_key.register(vmappings, opts2)
