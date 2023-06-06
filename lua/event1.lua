	--一键编译c/cpp
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "c",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F19>",
				"<ESC><cmd>!g++ -std=c++17 -Wshadow -Wall -o ~/Public/Bin_Files/%:t:r.out  % -g -I ./include/ -I .. -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR><CR>",
				{ silent = true, noremap = true }
			)
		end,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cpp",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F19>",
				"<ESC><cmd>!g++ -std=c++17 -Wshadow -Wall -o ~/Public/Bin_Files/%:t:r.out  % -g -I ./include/ -I .. -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR><CR>",
				{ silent = true, noremap = true }
			)
		end,
	}) --./src/*.cpp

	--一键运行代码文件
	--C
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "c",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te gcc  -std=c17 -Wshadow -Wall -o ~/Public/Bin_Files/%:t:r.out % -g -I ./include/ -I ..  -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ~/Public/Bin_Files/%:t:r.out<CR>i", --%:t:r
				{ silent = true, noremap = true }
			)
		end,
	})
	--C++
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cpp",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te g++ -std=c++17 -Wshadow -Wall -o ~/Public/Bin_Files/%:t:r.out %  -g -I ./include/  -I /Users/riley/Public/Leetcode/cpp/  -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ~/Public/Bin_Files/%:t:r.out<CR>i\n", --
				{ silent = true, noremap = true }
			)
		end,
	})
	--Python
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				":w<CR>:split<CR>:te  time python3 % <CR>i",
				{ silent = true, noremap = true }
			)
		end,
	})
	--Java
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "java",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				":w<CR>:split<CR>:te  time java % <CR>i",
				{ silent = true, noremap = true }
			)
		end,
	})

  vim.cmd([[
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:       rileychc")
        call append(line(".")+2, "\# mail:         rileychc8@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/* ************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        rileychc")
        call append(line(".")+2, "> mail:          rileychc8@gmail.com")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
]])

	vim.cmd([[
autocmd BufNewFile *.h,*.hpp exec ":call AddHHeader()"
func AddHHeader()
    let macro = "_".toupper(substitute(expand("%"), "[/.]", "_", "g"))."_"
    "normal o
    call setline(9, "#ifndef ".macro)
    call setline(10, "#define ".macro)
    call setline(11, "")
    call setline(12, "#endif  // ".macro)
endfunc
]])
