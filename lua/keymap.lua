-- lvim.lsp.buffer_mappings.normal_mode['gk'] = { vim.lsp.buf.hover, "Show documentation" }
-- Personal
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.normal_mode["<leader>-"] = "<C-W>s"
lvim.keys.normal_mode["<leader>|"] = "<C-W>v"
lvim.keys.normal_mode["U"] = "<C-r>"
lvim.keys.normal_mode["H"] = "5h"
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["L"] = "5l"
lvim.keys.normal_mode["e"] = "$"
lvim.keys.normal_mode["E"] = "^"
lvim.keys.visual_mode["H"] = "5h"
lvim.keys.visual_mode["J"] = "5j"
lvim.keys.visual_mode["K"] = "5k"
lvim.keys.visual_mode["L"] = "5l"
lvim.keys.visual_mode["e"] = "$"
lvim.keys.visual_mode["E"] = "^"
lvim.keys.normal_mode["<leader>h"] = "<C-W>h"
lvim.keys.normal_mode["<leader>j"] = "<C-W>j"
lvim.keys.normal_mode["<leader>k"] = "<C-W>k"
lvim.keys.normal_mode["<leader>l"] = "<C-W>l"
lvim.keys.normal_mode["<M-w>"] = "<C-W>c"


--"Delete All Notifications"
lvim.keys.normal_mode["<leader>nc"] =
    function()
      require("notify").dismiss({ silent = true, pending = true })
    end --LSP
lvim.lsp.buffer_mappings.normal_mode['gd'] = lvim.lsp.buffer_mappings.normal_mode['gD']
lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
lvim.lsp.buffer_mappings.normal_mode['gr'] = nil
lvim.lsp.buffer_mappings.normal_mode['gk'] = nil
lvim.lsp.buffer_mappings.normal_mode['gl'] = nil
lvim.lsp.buffer_mappings.normal_mode['gi'] = lvim.lsp.buffer_mappings.normal_mode['gI']
lvim.lsp.buffer_mappings.normal_mode['gI'] = nil
lvim.keys.normal_mode["gC"] = "<cmd>CodeiumEnable<CR>"
lvim.keys.normal_mode["gI"] = "<cmd>Lspsaga outgoing_calls<CR>"
lvim.keys.normal_mode["gO"] = "<cmd>Lspsaga incoming_calls<CR>"
lvim.keys.normal_mode["gp"] = "<cmd>Lspsaga peek_definition<CR>"
lvim.keys.normal_mode["gD"] = "<cmd>Lspsaga goto_definition<CR>"
lvim.keys.normal_mode["gr"] = "<cmd>Lspsaga lsp_finder<CR>"
lvim.keys.normal_mode["gk"] = "<cmd>Lspsaga hover_doc<CR>"
lvim.keys.normal_mode["ga"] = "<cmd>Lspsaga code_action<CR>"
lvim.keys.normal_mode["[g"] = "<cmd>Lspsaga diagnostic_jump_prev<CR>"
lvim.keys.normal_mode["]g"] = "<cmd>Lspsaga diagnostic_jump_next<CR>"
lvim.keys.normal_mode["go"] = "<cmd>Lspsaga outline<CR>"
lvim.keys.normal_mode["gl"] = "<cmd>Lspsaga show_line_diagnostics<CR>"
lvim.keys.normal_mode["gF"] = { "<Cmd>lua require('lvim.lsp.utils').format()<CR>" }
lvim.keys.normal_mode["<F2>"] = { "<Cmd>Lspsaga rename<CR>" }
lvim.keys.normal_mode["<F14>"] = { "<Cmd>Lspsaga rename ++project<CR>" }

--Bufferline
-- lvim.keys.normal_mode["<M-l>"] = "<cmd>BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<M-h"] = "<cmd>BufferLineCyclePrev<CR>"
-- lvim.keys.normal_mode["<M-j>"] = "<cmd>BufferLineMoveNext<CR>"
-- lvim.keys.normal_mode["<M-k"] = "<cmd>BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<M-1>"] = "<cmd>BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<M-2>"] = "<cmd>BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<M-3>"] = "<cmd>BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<M-4>"] = "<cmd>BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<M-5>"] = "<cmd>BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<M-6>"] = "<cmd>BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<M-7>"] = "<cmd>BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<M-8>"] = "<cmd>BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<M-9>"] = "<cmd>BufferLineGoToBuffer 9<CR>"
lvim.keys.normal_mode["<M-q>"] = "<Cmd>BufferKill<CR>"
lvim.builtin.which_key.mappings["md"] = { "<cmd>MarkdownPreviewToggle<CR>", "Preview markdown" }
lvim.builtin.which_key.mappings["bd"] = { "<Cmd>BufferKill<CR>", "Buffer Close" }
-- lvim.builtin.which_key.mappings["bN"] = { "<Cmd><CR>", "Buffer Close" }
lvim.builtin.which_key.mappings["bN"] = { "<cmd>enew<CR>", "New File" }
-- tabs
lvim.builtin.which_key.mappings["<tab>"] =
{
  name = "Tabs",
  l = { "<cmd>tablast<cr>", "Last Tab" },
  f = { "<cmd>tabfirst<cr>", "First Tab" },
  N = { "<cmd>tabnew<cr>", "New Tab" },
  n = { "<cmd>tabnext<cr>", "Next Tab" },
  d = { "<cmd>tabclose<cr>", "Close Tab" },
  b = { "<cmd>tabprevious<cr>", "Previous Tab" },
}
lvim.builtin.which_key.mappings["H"] = { "<Cmd>Alpha<CR>", "Home page" }
lvim.builtin.which_key.mappings["<CR>"] = { "<Cmd>nohlsearch<CR>", "No hightlight" }
lvim.builtin.which_key.mappings["L"] = {
  name = "LSP",
  d = { " <Cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Buffer Diagnostics" },
  e = { " <Cmd>Telescope quickfix<CR>", "Telescope Quickfix" },
  l = { " <cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
  q = { " <Cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
  s = { " <Cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
  i = { " <Cmd>LspInfo<CR>", "Info" },
  w = { " <Cmd>Telescope diagnostics<CR>", "Diagnostics" },
  I = { " <Cmd>Mason<CR>", "Mason Info" },
  k = { " <Cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
  a = { " <Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  S = { " <Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
  f = { " ", "Format" },
  j = { " <Cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
  t = { ":TSConfigInfo<CR>", "Treesistter Info" },
}
--Lunarvim
lvim.builtin.which_key.mappings["v"] = {
  name = "Lunarvim",
  r    = { "<Cmd>LvimReload<CR>", "Reload LunarVim's configuration" },
  i    = { "<Cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<CR>", "Toggle LunarVim Info" },
  l    = { name = "+log" },
  ln   = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<CR>", "view neovim log" },
  lL   = { "<Cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<CR>", "Open the LSP logfile" },
  ll   = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<CR>", "view lsp log" },
  lN   = { "<Cmd>edit $NVIM_LOG_FILE<CR>", "Open the Neovim logfile" },
  lD   = { "<Cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<CR>", "Open the default logfile" },
  ld   = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<CR>",
    "view default log" },
  I    = { "<Cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<CR>",
    "View LunarVim's changelog" },
  u    = { "<Cmd>LvimUpdate<CR>", "Update LunarVim" },
  g    = { "<Cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<CR>", "Grep LunarVim files" },
  d    = { "<Cmd>LvimDocs<CR>", "View LunarVim's docs" },
  k    = { "<Cmd>Telescope keymaps<CR>", "View LunarVim's keymappings" },
  f    = { "<Cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<CR>", "Find LunarVim files" },
  c    = { "<Cmd>edit /Users/riley/.config/lvim/config.lua<CR>", "Edit config.lua" },
}

--Telescope
lvim.builtin.which_key.mappings["s"] = {
  name = "Search",
  n = { "<Cmd>Telescope notify<CR>", "Telescope Notify" },
  k = { " <Cmd>Telescope keymaps<CR>", "Keymaps" },
  r = { " <Cmd>Telescope oldfiles<CR>", "Open Recent File" },
  C = { " <Cmd>Telescope commands<CR>", "Commands" },
  l = { " <Cmd>Telescope resume<CR>", "Resume last search" },
  b = { " <Cmd>Telescope git_branches<CR>", "Checkout branch" },
  H = { " <Cmd>Telescope highlights<CR>", "Find highlight groups" },
  h = { " <Cmd>Telescope help_tags<CR>", "Find Help" },
  R = { " <Cmd>Telescope registers<CR>", "Registers" },
  -- p = { " <Cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>", "Colorscheme with Preview" },
  t = { "<cmd>TodoTelescope<CR>", "Todo Trouble" },
  c = { " <Cmd>Telescope colorscheme<CR>", "Colorscheme" },
  M = { " <Cmd>Telescope man_pages<CR>", "Man Pages" },
  w = { "<cmd>Telescope live_grep<CR>", "Search words" },
  f = { function() require("lvim.core.telescope.custom-finders").find_project_files { previewer = false } end,
    "Find File" },
  -- f = { " <Cmd>Telescope find_files<CR>", " Find File" },
  Y = { "<cmd>CPPMan<CR>", "Find Lib Help" },
  y = { function() require("cppman").open_cppman_for(vim.fn.expand("<cword>")) end,
    "Cusor Library" }
}

lvim.builtin.which_key.mappings["f"] = {}


--Dap
lvim.keys.normal_mode['<F5>'] = { function()
  local executable = "/Users/riley/Public/Bin_Files/"
      .. vim.fn.fnamemodify(vim.fn.expand("%"), ":t:r")
      .. ".out"
  if vim.bo.filetype == ("cpp" or "c") then --判断该可调试文件是否存在，如果存在则调试，如果不存在则先编译后调试
    vim.cmd(
      "!g++ -std=c++17 -Wshadow -Wall -o ~/Public/Bin_Files/%:t:r.out  % -g -I ./include/ -I .. -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG"
    )
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
  end
  require("dap").continue()
end }
lvim.keys.normal_mode['<F9>'] = { "<Cmd>PBToggleBreakpoint<CR>" }
lvim.keys.normal_mode['<F10>'] = { "<Cmd>lua require'dap'.step_over()<CR>" }
lvim.keys.normal_mode['<F11>'] = { "<Cmd>lua require'dap'.step_into()<CR>" }
lvim.keys.normal_mode['<F17>'] = { function()
  require("dap").terminate()
  require("dapui").close()
end }
lvim.keys.normal_mode['<F23>'] = { "<Cmd>lua require'dap'.step_out()<CR>" }
lvim.builtin.which_key.mappings['d'] = {
  name = "Debug",
  c = { "<Cmd>PBClearAllBreakpoints<CR>", "Clear breakpoint" },
  g = { "<Cmd>lua require'dap'.session()<CR>", "Get Session" },
  q = { "<Cmd>lua require'dap'.close()<CR>", "Quit" },
  p = { "<Cmd>lua require'dap'.pause()<CR>", "Pause" },
  C = { "<Cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
  b = { "<Cmd>lua require'dap'.step_back()<CR>", "Step Back" },
  U = { "<Cmd>lua require'dapui'.toggle({reset = true})<CR>", "Toggle UI" },
  r = { "<Cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
  d = { "<Cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
}


--Disabled keymap
lvim.keys.normal_mode["<M-n>"] = ""
lvim.keys.normal_mode["<M-p>"] = ""
lvim.keys.normal_mode["<C-q>"] = false
lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["p"] = {}
lvim.builtin.which_key.vmappings['/'] = {}
lvim.builtin.which_key.mappings['/'] = {}
lvim.builtin.which_key.mappings['q'] = {}
lvim.builtin.which_key.mappings[';'] = {}
lvim.builtin.which_key.mappings['h'] = {}
lvim.builtin.which_key.mappings["l"] = {}
lvim.builtin.which_key.mappings["T"] = {}
lvim.builtin.which_key.mappings["c"] = {}
lvim.builtin.which_key.mappings["w"] = {}


lvim.lsp.buffer_mappings.normal_mode['K'] = nil
--Terminal
lvim.builtin["terminal"].execs = {
  { nil, "<M-\\>", "Vertical Terminal", "vertical", 0.4 },
}
vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })--It will can't quit smooth when use lazygit


-- Plugin: trouble
lvim.builtin.which_key.mappings['x'] = {
  name = "Trouble",
  l = { "<cmd>TroubleToggle<CR>", "lsp: Toggle trouble list" },
  d = { "<cmd>Telescope diagnostics<CR>", "Telescope Diagnostics" },
  D = { "<cmd>TroubleToggle document_diagnostics<CR>", "lsp: Show document diagnostics" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "lsp: Show workspace diagnostics" },
  q = { "<cmd>TroubleToggle quickfix<CR>", "lsp: Show quickfix list" },
  L = { "<cmd>TroubleToggle loclist<CR>", "lsp: Show loclist" },
}
--Resize Windows
lvim.keys.normal_mode["<M-Up>"] = false
lvim.keys.normal_mode["<M-Down>"] = false
lvim.keys.normal_mode["<M-Left>"] = false
lvim.keys.normal_mode["<M-Right>"] = false
lvim.keys.normal_mode["<C-Left>"] = false
lvim.keys.normal_mode["<C-Right>"] = false
lvim.keys.normal_mode["<M-;>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<M-[>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<M-]>"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<M-'>"] = ":resize +2<CR>"
