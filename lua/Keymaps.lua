local Util = require("Mutils")
-- Personal
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.normal_mode["<leader>-"] = "<C-W>s"
lvim.keys.normal_mode["<leader>|"] = "<C-W>v"
lvim.keys.normal_mode["U"] = "<C-r>"
lvim.keys.normal_mode["<leader>h"] = "<C-W>h"
lvim.keys.normal_mode["<leader>j"] = "<C-W>j"
lvim.keys.normal_mode["<leader>k"] = "<C-W>k"
lvim.keys.normal_mode["<leader>l"] = "<C-W>l"
lvim.keys.normal_mode["<M-w>"] = "<C-W>c"
--LSP
lvim.lsp.buffer_mappings.normal_mode['gd'] = lvim.lsp.buffer_mappings.normal_mode['gD']
lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
lvim.lsp.buffer_mappings.normal_mode['gr'] = nil
lvim.lsp.buffer_mappings.normal_mode['gk'] = nil
lvim.lsp.buffer_mappings.normal_mode['gl'] = nil
lvim.lsp.buffer_mappings.normal_mode['gi'] = lvim.lsp.buffer_mappings.normal_mode['gI']
lvim.lsp.buffer_mappings.normal_mode['gI'] = nil
lvim.keys.normal_mode["gw"] = { "*N" }
lvim.keys.normal_mode["gC"] = { "<cmd>CodeiumEnable<CR>" }
lvim.keys.normal_mode["gI"] = { "<cmd>Lspsaga outgoing_calls<CR>" }
lvim.keys.normal_mode["gO"] = { "<cmd>Lspsaga incoming_calls<CR>" }
lvim.keys.normal_mode["gp"] = { "<cmd>Lspsaga peek_definition<CR>" }
lvim.keys.normal_mode["gD"] = { "<cmd>Lspsaga goto_definition<CR>" }
lvim.keys.normal_mode["gr"] = { "<cmd>Lspsaga lsp_finder<CR>" }
lvim.keys.normal_mode["gk"] = { "<cmd>Lspsaga hover_doc<CR>" }
lvim.keys.normal_mode["ga"] = { "<cmd>Lspsaga code_action<CR>" } --{ " <Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
lvim.keys.normal_mode["go"] = { "<cmd>Lspsaga outline<CR>" }
lvim.keys.normal_mode["gl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>" }
lvim.keys.normal_mode["gF"] = { "<Cmd>lua require('lvim.lsp.utils').format()<CR>" }
lvim.keys.normal_mode["gh"] = { function() require("cppman").open_cppman_for(vim.fn.expand("<cword>")) end } --cpp Help
lvim.keys.normal_mode["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>" }
lvim.keys.normal_mode["]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>" }
lvim.keys.normal_mode["<F2>"] = { "<Cmd>Lspsaga rename<CR>" }
lvim.keys.normal_mode["<F14>"] = { "<Cmd>Lspsaga rename ++project<CR>" }

--Bufferline
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


--Alpha
lvim.builtin.which_key.mappings["H"] = { "<Cmd>Alpha<CR>", "Home page" }

--Translate
lvim.builtin.which_key.mappings["t"] = {
    name = "Translate",
    l = { "<cmd>Translate<CR>", "Translate" },
    i = { "<cmd>TranslateInput<CR>", "InputTranslate" },
    p = { "<cmd>TransPlay<CR>", "TransPlay" },
}
lvim.builtin.which_key.vmappings["t"] = {
    name = "Translate",
    l = { "<cmd>Translate<CR>", "Translate" },
    -- p = { "<cmd>TransPlay<CR>", "TransPlay" },
}

--MarkDown
lvim.builtin.which_key.mappings["m"] = {
    name = "MarkDown",
    d = { "<cmd>MarkdownPreviewToggle<CR>", "Preview markdown" },
}
--Notify
--"Delete All Notifications"
lvim.builtin.which_key.mappings["n"] = {
    name = "Notify",
    s = { "<Cmd>Telescope notify<CR>", "Telescope Notify" },
    c = { function()
        require("notify").dismiss({ silent = true, pending = true })
    end, "Clear Notify" }
}

lvim.builtin.which_key.mappings["b"] = {
    name = "Buffers",
    D = { "<Cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
    W = { "<Cmd>noautocmd w<CR>", "Save without formatting (noautocmd)" },
    e = { "<Cmd>BufferLinePickClose<CR>", "Pick which buffer to close" },
    j = { "<Cmd>BufferLinePick<CR>", "Jump" },
    h = { "<Cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
    s = { "<Cmd>Telescope buffers previewer=false<CR>", "Find" },
    L = { "<Cmd>BufferLineSortByExtension<CR>", "Sort by language" },
    n = { "<cmd>enew<CR>", "New File" },
    l = { "<Cmd>BufferLineCloseRight<CR>", "Close all to the right" },
    d = { "<Cmd>BufferKill<CR>", "Buffer Close" },
}

--Lunarvim
lvim.builtin.which_key.mappings["L"] = {
    name = "Lunarvim",
    t    = { ":TSConfigInfo<CR>", "Treesistter Info" },
    r    = { "<Cmd>LvimReload<CR>", "Reload LunarVim's configuration" },
    i    = { "<Cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<CR>", "Toggle LunarVim Info" },
    L    = { " <Cmd>LspInfo<CR>", "Lsp Info" },
    l    = {
        name = "+log",
        n    = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<CR>",
            "view neovim log" },
        L    = { "<Cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<CR>", "Open the LSP logfile" },
        l    = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<CR>", "view lsp log" },
        N    = { "<Cmd>edit $NVIM_LOG_FILE<CR>", "Open the Neovim logfile" },
        D    = { "<Cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<CR>",
            "Open the default logfile" },
        d    = { "<Cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<CR>",
            "view default log" },
    },
    I    = { "<Cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<CR>",
        "View LunarVim's changelog" },
    u    = { "<Cmd>LvimUpdate<CR>", "Update LunarVim" },
    d    = { "<Cmd>LvimDocs<CR>", "View LunarVim's docs" },
    s    = {
        name = "Search in LunarVim",
        f = { "<Cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<CR>",
            "Find LunarVim files" },
        w = { "<Cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<CR>",
            "Grep LunarVim files" },
    },
    c    = { "<Cmd>edit /Users/riley/.config/lvim/config.lua<CR>", "Edit config.lua" },
}
--Telescope
lvim.builtin.which_key.mappings["s"] = {
    name = "Search",
    k = { " <Cmd>Telescope keymaps<CR>", "Keymaps" },
    C = { " <Cmd>Telescope commands<CR>", "Commands" },
    r = { " <Cmd>Telescope oldfiles<CR>", "Recently Open File" },
    R = { " <Cmd>Telescope registers<CR>", "Registers" },
    l = { " <Cmd>Telescope resume<CR>", "Resume last search" },
    L = { "<cmd>CPPMan<CR>", "Find CPPMan" },
    b = { " <Cmd>Telescope git_branches<CR>", "Checkout branch" },
    h = { " <Cmd>Telescope help_tags<CR>", "Find Help" },
    H = { " <Cmd>Telescope highlights<CR>", "Find highlight groups" },
    c = { " <Cmd>Telescope colorscheme<CR>", "Colorscheme" },
    M = { " <Cmd>Telescope man_pages<CR>", "Man Pages" },
    w = { "<cmd>Telescope live_grep<CR>", "Search words (root dir)" },
    f = { function() require("lvim.core.telescope.custom-finders").find_project_files { previewer = false } end,
        "Find Files (root dir)" }, --find git project files
    -- F = { " <Cmd>Telescope find_files<CR>", " Find File (root dir)" },
}

--Dap
lvim.keys.normal_mode['<F5>'] = { function()
    local executable = "/Users/riley/Public/Drop\\ Box/"
        .. vim.fn.fnamemodify(vim.fn.expand("%"), ":t:r")
        .. ".out"
    if vim.bo.filetype == ("cpp" or "c") then --判断该可调试文件是否存在，如果存在则调试，如果不存在则先编译后调试
        vim.cmd(
            "!g++ -std=c++17 -Wshadow -Wall -o /Users/riley/Public/Drop\\ Box/%:t:r.out  % -g -I ./include/ -I .. -D_GLIBCXX_DEBUG"
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
-- Plugin: trouble
lvim.builtin.which_key.mappings['x'] = {
    name = "Trouble",
    t = { "<cmd>TodoTelescope<CR>", "Todo Trouble" },
    e = { " <Cmd>Telescope quickfix<CR>", "Telescope Quickfix" },
    l = { " <cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    s = { " <Cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Telescope Buffer Diagnostics" },
    o = { "<cmd>TroubleToggle loclist<CR>", "Open loclist" },

    q = { "<cmd>TroubleToggle quickfix<CR>", "Show quickfix list" },
    Q = { " <Cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },

    p = { " <Cmd>Telescope lsp_document_symbols<CR>", "Telescope Document Symbols" },
    P = { " <Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Telescope Workspace Symbols" },

    d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Show document diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Show workspace diagnostics" },

}


-- local ops = {}
-- local function formattoggle()
--     if vim.b.autoformat == false then
--         vim.b.autoformat = nil
--         ops.autoformat = true
--     else
--         ops.autoformat = not ops.autoformat
--     end
--     if ops.autoformat then
--         Util.info("Enabled format on save", { title = "Format" })
--     else
--         Util.warn("Disabled format on save", { title = "Format" })
--     end
-- end


local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
lvim.builtin.which_key.mappings["u"]
= {
    name = "Toggle",
    -- f = { "lua require("lazyvim.plugins.lsp.format").toggle<CR>", "Toggle format on Save" },
    -- s = { "<cmd>setlocal spell! spelllang=en_us<CR>", "Toggle Spell" },
    -- f = { formattoggle(), "t" },
    s = { function() Util.toggle("spell") end, "Toggle Spelling" },
    w = { function() Util.toggle("wrap") end, "Toggle Word Wrap" },
    l = { function()
        Util.toggle("relativenumber", true)
        Util.toggle("number")
    end, "Toggle Line Numbers" },
    d = { Util.toggle_diagnostics, "Toggle Diagnostics" },
    c = { function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
        "Toggle Conceal" },


}


-- tabs
-- lvim.builtin.which_key.mappings["<tab>"] =
-- {
--     name = "Tabs",
--     l = { "<cmd>tablast<cr>", "Last Tab" },
--     f = { "<cmd>tabfirst<cr>", "First Tab" },
--     N = { "<cmd>tabnew<cr>", "New Tab" },
--     n = { "<cmd>tabnext<cr>", "Next Tab" },
--     d = { "<cmd>tabclose<cr>", "Close Tab" },
--     b = { "<cmd>tabprevious<cr>", "Previous Tab" },
-- }
--Disabled keymap
lvim.keys.normal_mode["<M-n>"] = false
lvim.keys.normal_mode["<M-p>"] = false
lvim.keys.normal_mode["<C-q>"] = false
lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false

lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["p"] = {}
lvim.builtin.which_key.mappings['/'] = {}
lvim.builtin.which_key.vmappings['/'] = {}
lvim.builtin.which_key.mappings['q'] = {}
lvim.builtin.which_key.mappings[';'] = {}
lvim.builtin.which_key.mappings['h'] = {}
lvim.builtin.which_key.mappings["l"] = {}
lvim.builtin.which_key.mappings["T"] = {}
lvim.builtin.which_key.mappings["c"] = {}
lvim.builtin.which_key.mappings["w"] = {}
lvim.builtin.which_key.mappings["f"] = {}

lvim.lsp.buffer_mappings.normal_mode['K'] = nil
--Terminal
lvim.builtin["terminal"].execs = {
    { nil, "<M-\\>", "Vertical Terminal", "vertical", 0.4 },
}
vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })--It will can't quit smooth when use lazygit

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


local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map({ "n", "v", "o" }, "e", "$")
map({ "n", "v", "o" }, "E", "^")
map({ "n", "v", "o" }, "H", "5h")
map({ "n", "v", "o" }, "J", "5j")
map({ "n", "v", "o" }, "K", "5k")
map({ "n", "v", "o" }, "L", "5l")
map("n", "<M-}>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<M-{>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<M-k>", "<cmd>BufferLineMoveNext<CR>")
map("n", "<M-j>", "<cmd>BufferLineMovePrev<CR>")

-- "s": 选择模式（Select Mode）：选择模式与可视模式类似，允许你选择文本并执行操作。与可视模式不同的是，选择模式下的光标移动会影响选择区域，而在可视模式下，选择区域是通过移动光标来确定的。
-- "c": 命令行模式（Command-line Mode）：在命令行模式下，你可以输入各种命令来执行特定的操作，如保存文件、退出编辑器、搜索替换等。你可以通过按下冒号（:）进入命令行模式。
-- "t": 终端模式（Terminal Mode）：终端模式允许你在nvim中打开一个终端窗口，以执行命令行操作，如编译代码、运行测试等。
-- "o": 操作符等待模式（Operator-pending Mode）：操作符等待模式用于在执行操作符之前等待附加的动作。例如，你可以使用d（删除）操作符，然后等待动作（如w表示删除一个单词）。
-- "R": 替换模式（Replace Mode）：在替换模式下，你可以直接替换当前光标所在位置的字符，输入的字符将覆盖原有字符。
-- "l": Ex 模式（Ex Mode）：Ex 模式是一种行编辑模式，类似于传统的 Vi 编辑器的 Ex 命令模式。在 Ex 模式下，你可以执行各种行级别的操作，如保存、退出、查找、替换等。
-- "!": Shell 模式（Shell Mode）：Shell 模式允许你在nvim中执行外部的 shell 命令。你可以在命令行模式下使用感叹号（!）来进入 Shell 模式，并在其中执行需要的命令。
