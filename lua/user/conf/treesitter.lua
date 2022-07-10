local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!")
  return
end

configs.setup {
  ensure_installed = { "cpp", "c", "python", "go", "markdown", "json", "yaml", "html", "lua" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    config = {
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },
  textobjects = {
    swap = {
      enable = false,
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["kf"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["kc"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
      },
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
}
