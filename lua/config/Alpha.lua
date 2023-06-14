	lvim.builtin.alpha.dashboard.section.header = {
		type = "text",
		-- val = M.dashboard(),
		opts = {
			position = "center",
			hl = "Comment",
		},
	}
  local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
  if status_ok then
    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl_shortcut = "Include"
      return b
    end
    table.insert(lvim.builtin.alpha.dashboard.section.buttons.val, 1,
			button("l", "  Restore Session", "<CMD>lua require('persistence').load({ last = true })<CR>")
    )
  end
