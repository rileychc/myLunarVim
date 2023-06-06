
 -- use treesitter folding
-- vim.opt.foldenable=false
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true -- relative line numbers
-- vim.opt.cmdheight = 0 
vim.opt.shell = "/bin/zsh"

  local actions = require("lvim.utils.modules").require_on_exported_call "telescope.actions"

  lvim.builtin.cmp.completion.keyword_length = 2
  lvim.builtin.telescope.defaults.layout_config.width = 0.8
  lvim.builtin.telescope.defaults.layout_config.height = 0.8
  lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  vim.g.loaded_perl_provider=0