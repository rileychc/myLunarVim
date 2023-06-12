-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
require("dap-lldb")
require("dap-debugpy")
require("myEvent")
require("keymap")
require("myoptions")
require("plugin")


-- lvim.builtin.treesitter.ensure_installed = "maintained"
-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enabled = true
-- general
-- lvim.format_on_save = true
-- lvim.lint_on_save = true
-- lvim.colorscheme = "spacegray"

require("lvim.lsp.null-ls.formatters").setup({
		{ filetypes = { "sh" }, command = "shfmt", extra_args = { "-i", "2" } },
		{ filetypes = { "cmake" }, command = "cmake_format" },
		{ filetypes = { "go" }, command = "gofmt" },
		{ filetypes = { "python" }, command = "yapf", args = {"--style={based_on_style: google, column_limit: 120, indent_width: 4}"} },
		{ filetypes = { "lua" }, command = "stylua" },
		{ filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
		{ filetypes = { "html", "css", "markdown" }, command = "prettier" },
	})
require("lvim.lsp.null-ls.linters").setup({
		{ filetypes = { "sh" }, command = "shellcheck" },
		{ filetypes = { "go" }, command = "golangci_lint" },
		{ filetypes = { "python" }, command = "pylint" },
		{ filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
		{ filetypes = { "html" }, command = "tidy" },
		{ filetypes = { "css" }, command = "stylelint" },
		{ filetypes = { "markdown" }, command = "markdownlint", args = { "--disable", "MD013" } },
	})

--which-key
lvim.builtin.which_key.setup.plugins.presets =
{
  operators = false,    -- adds help for operators like d, y, ...
  motions = false,      -- adds help for motions
  text_objects = false, -- help for text objects triggered after entering an operator
  windows = false,      -- default bindings on <c-w>
  nav = false,          -- misc bindings to work with windows
  z = true,             -- bindings for folds, spelling and others prefixed with z
  g = true,             -- bindings for prefixed with g
}
lvim.builtin.which_key.setup.ignore_missing = true
--illuminate
local function map(key, dir, buffer)
  vim.keymap.set("n", key, function()
    require("illuminate")["goto_" .. dir .. "_reference"](false)
  end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
end
lvim.builtin.illuminate.options = {
  map("]]", "next"),
  map("[[", "prev"),
  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      local buffer = vim.api.nvim_get_current_buf()
      map("]]", "next", buffer)
      map("[[", "prev", buffer)
    end,
  }),
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
  -- providers: provider used to get references in the buffer, ordered by priority
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  -- delay: delay in milliseconds
  delay = 120,
  -- filetype_overrides: filetype specific overrides.
  -- The keys are strings to represent the filetype while the values are tables that
  -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
  filetype_overrides = {},
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "lazy",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
  -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
  filetypes_allowlist = {},
  -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
  modes_denylist = {},
  -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
  modes_allowlist = {},
  -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_allowlist = {},
  -- under_cursor: whether or not to illuminate under the cursor
  under_cursor = true,
}



--plugs: Dap
lvim.builtin.dap.ui.config.layouts = {
  {
    elements = {
      { id = "scopes",      size = 0.33 },
      { id = "watches",     size = 0.25 },
      { id = "breakpoints", size = 0.17 },
      { id = "stacks",      size = 0.25 },
    },
    size = 0.33,
    position = "left",
  },
  {
    elements = {
      { id = "console", size = 0.55 },
      { id = "repl",    size = 0.45 },
    },
    size = 0.27,
    position = "bottom",
  },
}
local dap, dapui = require("dap"), require("dapui")
local debug_open = function()
  dapui.open({})
end
local debug_close = function()
  dap.repl.close()
  dapui.close({})
end
dap.listeners.after.event_initialized["dapui_config"] = debug_open
dap.listeners.before.event_terminated["dapui_config"] = debug_close
dap.listeners.before.event_exited["dapui_config"] = debug_close
dap.listeners.before.disconnect["dapui_config"] = debug_close
