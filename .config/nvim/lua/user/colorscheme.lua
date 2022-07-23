-- Configure colorschemes

local gbox_status_ok, gruvbox = pcall(require, "gruvbox")
if gbox_status_ok then
  -- setup must be called before loading the colorscheme
  -- Default options:
  gruvbox.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    overrides = {},
  })
end

-- Apply colorscheme
local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
