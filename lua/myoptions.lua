-- use treesitter folding (已使用ufo代替)
-- vim.opt.foldenable=false
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 禁止警告
vim.g.loaded_perl_provider = 0
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cmdheight = 0

-- vim.opt.shell = "/bin/zsh"
--出现补全需多少字符
lvim.builtin.cmp.completion.keyword_length = 2
--Telescope
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.width = 0.8
lvim.builtin.telescope.defaults.layout_config.height = 0.8
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75
--透明背景
-- lvim.transparent_window = true
--状态栏风格
--  lvim.builtin.lualine.style = "default"
