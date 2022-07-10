local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine not found!")
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = "  ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = "#98be65" },
    modified = { fg = "#ecbe7b" },
    removed = { fg = "#ec5f67" },
  },
  cond = hide_in_width
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = function()
  return vim.fn.line(".") .. "/" .. vim.fn.line("$")
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = { left = "", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_b = { branch, diagnostics },
    lualine_x = { diff, spaces, "encoding", "fileformat", filetype },
    lualine_y = {},
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_x = { location },
  },
  tabline = {},
  extensions = {},
})
