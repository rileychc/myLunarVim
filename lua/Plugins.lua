lvim.plugins = {

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        keys = {
          { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
          { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
          -- { "",  mode = { "n", "x", "o" }, desc = "Leap from windows" }, --窗口跳转
        },
        config = function(_, opts)
          local leap = require("leap")
          for k, v in pairs(opts) do
            leap.opts[k] = v
          end
          leap.add_default_mappings(true)
          vim.keymap.del({ "x", "o" }, "x")
          vim.keymap.del({ "x", "o", "n" }, "gs")
          vim.keymap.del({ "x", "o" }, "X")
        end,
      },
    },
    keys = function()
      local ret = {}
      for _, key in ipairs({ "f", "F", "T", "t" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" } }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- 跳到 //FIX or  NOTE 等注释
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    -- 需要调整nodejs版本
    build = ":call mkdp#util#install()",
    ft = { "markdown" },
    config = function()
      vim.cmd([[let g:mkdp_auto_start = 1]]) --这是格式
      vim.g.mkdp_theme = "light"
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_markdown_css = "/Users/riley/.config/node_modules/github-markdown-css/github-markdown.css"
      vim.g.mkdp_highlight_css = "/Users/riley/.config/node_modules/github-markdown-css/github-markdown.css"
    end,
  },
  -- {
  --   "ekickx/clipboard-image.nvim", --markdown插入图片
  --   -- lazy = true,
  --   keys = {
  --     { "<leader>mi", "<cmd>PasteImg<cr>", desc = "PasteImg" },
  --   },
  --   config = function()
  --     require("clipboard-image").setup({
  --       -- Default configuration for all filetype
  --       default = {
  --         img_dir = "./img",
  --         img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
  --         affix = "<\n  %s\n>"                                           -- Multi lines affix
  --       },
  --       -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  --       -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  --       -- Missing options from `markdown` field will be replaced by options from `default` field
  --       markdown = {
  --         img_dir = { "./img", "assets", "img" }, -- Use table for nested dir (New feature form PR #20)
  --         img_dir_txt = "./img/assets/img",
  --         img_handler = function(img)             -- New feature from PR #22
  --           local script = string.format('./image_compressor.sh "%s"', img.path)
  --           os.execute(script)
  --         end,
  --       }
  --     })
  --   end,
  -- },


  --  代码折叠功能
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      { "kevinhwang91/promise-async" }, {
      "luukvbaal/statuscol.nvim",
      event = "BufReadPost",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { "%s" },                  click = "v:lua.ScSa" },
            {
              text = { "", builtin.foldfunc, "" },
              condition = { builtin.not_empty, true, builtin.not_empty },
              click = "v:lua.ScFa",
            },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
        vim.cmd([[hi FoldColumn guibg=none]])
      end,
    },
    },
    event = "BufReadPost",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.fillchars = [[eob:~,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup({
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ("  %d "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- str width returned from truncate() may less than 2nd argument, need padding
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
        preview = {
          win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
          mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
            jumpTop = "[",
            jumpBot = "]",
            close = "q",
          },
        },
      })
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
      -- vim.keymap.set("n", "gk", function()
      --     local winid = require("ufo").peekFoldedLinesUnderCursor()
      --     if not winid then
      --         -- choose one of coc.nvim and nvim lsp
      --         vim.fn.CocActionAsync "definitionHover" -- coc.nvim
      --         vim.lsp.buf.hover()
      --     end
      -- end)
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
  -- 这个插件可以让你更好地看到代码的缩进结构。它会在每个缩进层级的前面添加一个小箭头，让你更容易看到代码的层次结构。
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  --浮动命令行
  -- 这个插件可以让你更方便地进行文件操作。它提供了一些常用的文件操作命令，例如创建、删除、重命名、移动等。
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {
      lsp = {
        --hover and signature was overrided by LunarVim
        hover = { enabled = false },
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,     -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#000000",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.3)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.3)
      end,
      --我修改
      render = "minimal",
    },
    init = function()
      require("telescope").load_extension("notify") --加载
      -- when noice is not enabled, install notify on VeryLazy
      vim.notify = require("notify")
    end,
  },

  {
    "Weissle/persistent-breakpoints.nvim", --断点插件
    event = { "BufReadPost" },
    opts = { load_breakpoints_event = { "BufReadPost" } },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { "nvim-web-devicons" }, -- 使用的是本地图标
    config = function()
      require("lspsaga").setup({
        preview = {
          lines_above = 1,
          lines_below = 17,
        },
        request_timeout = 3000,
        finder = {
          keys = {
            jump_to = "e",
            expand_or_jump = "<CR>",
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = { "q", "<ESC>" },
            close_in_preview = "<ESC>",
          },
        },
        definition = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>s",
          tabe = "<C-c>t",
          quit = "q",
        },
        code_action = {
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },
        lightbulb = {
          enable = false,
          sign = true,
          enable_in_insert = true,
          sign_priority = 20,
          virtual_text = false,
        },
        diagnostic = {
          text_hl_follow = true, --默认为假，您可以定义DiagnostcText来自定义诊断文本颜色
          on_insert = true,
          on_insert_follow = false,
          border_follow = true,
          extend_relatedInformation = false,
        },
        rename = {
          quit = "<Esc>",
          mark = "x",
          confirm = "<CR>",
          exec = "<CR>",
          in_select = true,
        },
        hover = {
          open_link = "gl",
          open_browser = "!safari",
        },
        outline = {
          win_position = "right",
          win_with = "_sagaoutline",
          win_width = 30,
          auto_preview = true,
          auto_refresh = true,
          auto_close = true,
          close_after_jump = true,
          keys = {
            expand_or_jump = "<CR>",
            quit = "q",
          },
        },
        symbol_in_winbar = {
          enable = false,
          -- separator = " " .. icons.ui.Separator,
          hide_keyword = true,
          show_file = false,
          color_mode = true,
        },
        beacon = {
          enable = true,
          frequency = 12,
        },
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "💡",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          kind = {},
        },
      })
    end,
  },
  -- 这个插件可以让你更方便地查看 NeoVim 中的错误和警告信息。它提供了一个可视化的界面，让你更容易地查看和定位错误。
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
  },
  {
    "madskjeldgaard/cppman.nvim",
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim", event = "VeryLazy" },
    },
    config = function()
      require("cppman").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    config = function() --好中文补全不太好使
      -- vim.g.codeium_manual = true
      vim.g.codeium_enabled = false

      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-e>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-n>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<C-p>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<C-S-e>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  {
    --翻译插件
    "JuanZoran/Trans.nvim",
    event = "VeryLazy",
    build = function()
      require("Trans").install()
    end,
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("Trans").setup({
        frontend = {
          default = {
            title = vim.fn.has("nvim-0.9") == 1 and {
              { "",         "TransTitleRound" },
              { "Translation", "TransTitle" },
              { "",         "TransTitleRound" },
            } or nil, -- need nvim-0.9+
            auto_play = false,
          },
          hover = {
            order = {
              default = {
                "translation",
              },
              offline = {
                "translation",
              },
              youdao = {
                "translation",
              },
            },
          },
        },
      })
    end,
  },
}
