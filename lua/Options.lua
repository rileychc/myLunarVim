-- 禁止警告
vim.g.loaded_perl_provider = 0
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cmdheight = 0
-- vim.opt.shell = "/bin/bash"
lvim.format_on_save = false
--主题
-- lvim.colorscheme = "tokyonight"
--状态栏风格
--  lvim.builtin.lualine.style = "default"
--检查
lvim.lint_on_save = true
--透明背景
-- lvim.transparent_window = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.backup = true
vim.opt.backupdir = join_paths(get_cache_dir(), "backup")
-- vim.opt.swapfile = true
-- vim.opt.directory = join_paths(get_cache_dir(), "swap")

vim.opt.updatetime = 250      --设置自动命令的更新时间间隔为 250 毫秒。这决定了在文件更改后多久触发自动命令。
vim.opt.list = true           --启用可见字符列表，用于显示制表符、行尾空格等特殊字符。
vim.opt.wildignorecase = true --在文件名自动补全中忽略大小写。
-- vim.opt.colorcolumn = "100"--在列号 100 的位置显示垂直辅助线，用于帮助保持代码对齐。
vim.opt.timeoutlen = 250      --设置在插入模式中按下 Esc 键后等待的时间长度，以毫秒为单位。
vim.opt.ttimeoutlen = 10      --设置在插入模式中按下特殊键（如方向键）后等待的时间长度，以毫秒为单位。
vim.opt.redrawtime = 1500     --设置自动重绘屏幕的时间限制，以毫秒为单位。超过此时间限制将停止自动重绘以提高性能。
vim.opt.confirm = true        --使 Vim 在执行可能破坏性操作之前提示用户保存文件。
vim.opt.wildignore = {        -- 配置在文件名自动补全时要忽略的文件类型或模式的列表。
    "*.aux,*.out,*.toc",
    "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
    -- media
    "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
    "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
    "*.eot,*.otf,*.ttf,*.woff",
    "*.doc,*.pdf",
    -- archives
    "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
    -- temp/system
    "*.*~,*~ ",
    "*.swp,.lock,.DS_Store,._*,tags.lock",
    -- version control
    ".git,.svn",
}


vim.opt.guicursor = "n:block-blinkon10,i-ci:ver15-blinkon10,c:hor15-blinkon10,v-sm:block,ve:ver15,r-cr-o:hor10" --光标闪烁方式

vim.opt.cursorline = true                                                                                       --在当前行添加光标行高亮效果
-- Cursorline highlighting control, only have it on in the active buffer
if vim.fn.has("nvim-0.7") ~= 0 then
    local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
    vim.api.nvim_create_autocmd("WinLeave", {
        group = group,
        callback = function()
            vim.opt_local.cursorline = false
        end,
    })
    vim.api.nvim_create_autocmd("WinEnter", {
        group = group,
        callback = function()
            if vim.bo.filetype ~= "alpha" then
                vim.opt_local.cursorline = true
            end
        end,
    })
end
