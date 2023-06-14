--跳过配置
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
--null-ls格式化
require("lvim.lsp.null-ls.formatters").setup({
  {
    filetypes = { "sh" },
    command = "shfmt",
    extra_args = {
      "-i", "2" }
  },
  -- { filetypes = { "cmake" }, command = "cmake_format" },
  { filetypes = { "go" },                                                             command = "gofmt" },
  -- { filetypes = { "python" }, command = "yapf", args = {"--style={based_on_style: google, column_limit: 120, indent_width: 4}"} },
  -- { filetypes = { "lua" }, command = "stylua" },
  { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
  { filetypes = { "html", "css" },                                                    command = "prettier" }, --, "markdown"
  { filetypes = { "markdown" },                                                       command = "markdownlint" },
})
require("lvim.lsp.null-ls.linters").setup({
  { filetypes = { "sh" },                                                             command = "shellcheck" },
  { filetypes = { "go" },                                                             command = "golangci_lint" },
  -- { filetypes = { "python" }, command = "pylint" },
  { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
  { filetypes = { "html" },                                                           command = "tidy" },
  { filetypes = { "css" },                                                            command = "stylelint" },
  {
    filetypes = { "markdown" },
    command = "markdownlint",
    args = {
      "--disable", "MD013" }
  },
})

