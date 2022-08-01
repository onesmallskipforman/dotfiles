local status_ok, _ = pcall(require, "illuminate")
if not status_ok then
  return
end

-- Time in milliseconds (default 0)
-- vim.g.Illuminate_delay = 50
vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree'}
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- TODO: add condition for if LspReferenceText is not defined + case for when lsp is not being used + move some of this to lsp config in event you dont use this plugin
if vim.g.colors_name == 'gruvbox' then
  vim.api.nvim_command [[ hi! illuminatedWord gui=underline guibg=#504945 ]]
  vim.api.nvim_command [[ hi! link LspReferenceText  illuminatedWord ]]
  vim.api.nvim_command [[ hi! link LspReferenceWrite illuminatedWord ]]
  vim.api.nvim_command [[ hi! link LspReferenceRead  illuminatedWord ]]
else
  vim.api.nvim_command [[ hi! link illuminatedWord LspReferenceText ]]
end
