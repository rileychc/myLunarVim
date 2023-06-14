-- lvim.builtin.treesitter.ensure_installed = "maintained"
-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enabled = true

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 4
vim.wo.foldtext =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.textobjects.select = {
  enable = true,
  lookahead = true,
  keymaps = {
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["aa"] = "@parameter.outer",
    ["ia"] = "@parameter.inner",
  },
}
lvim.builtin.treesitter.textobjects.move = {
  enable = true,
  set_jumps = true, -- whether to set jumps in the jumplist
  goto_next_start = {
    ["]f"] = "@function.outer",
    ["]c"] = "@class.outer",
  },
  goto_next_end = {
    ["]F"] = "@function.outer",
    ["]C"] = "@class.outer",
  },
  goto_previous_start = {
    ["[f"] = "@function.outer",
    ["[c"] = "@class.outer",
  },
  goto_previous_end = {
    ["[F"] = "@function.outer",
    ["[C"] = "@class.outer",
  },
}
lvim.builtin.treesitter.textobjects.swap = {
  enable = true,
  swap_next = {
    ["<M-a>"] = "@parameter.inner",
  },
  swap_previous = {
    ["<M-A>"] = "@parameter.inner",
  },
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

