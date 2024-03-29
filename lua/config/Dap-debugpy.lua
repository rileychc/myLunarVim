local dap = require("dap")

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			-- command = '/Users/riley/.virtualenvs/debugpy/bin/python3',
			-- command = "/opt/homebrew/bin/python3",
			command = "python3",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",
		console = "integratedTerminal",
		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			-- local cwd = vim.fn.getcwd()
			-- if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
			--   return cwd .. '/venv/bin/python'
			-- elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
			--   return cwd .. '/.venv/bin/python'
			-- else
			-- return '/usr/bin/python'
			-- return "/opt/homebrew/bin/python3"
			return "python3"
			-- end
		end,
	},
}
-- local function isempty(s)
-- 	return s == nil or s == ""
-- end

-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = "/usr/bin/python",
-- 	args = { "-m", "debugpy.adapter" },
-- }
-- dap.configurations.python = {
-- 	{
-- 		-- The first three options are required by nvim-dap
-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
-- 		request = "launch",
-- 		name = "Launch file",
-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

-- 		program = "${file}", -- This configuration will launch the current file if used.
-- 		pythonPath = function()
-- 			if not isempty(vim.env.CONDA_PREFIX) then
-- 				return vim.env.CONDA_PREFIX .. "/bin/python"
-- 			else
-- 				return "/usr/bin/python3"
-- 			end
-- 		end,
-- 	},
-- }

-- NOTE: for people using venv
-- pythonPath = function()
-- 	-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
-- 	-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
-- 	-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
-- 	local cwd, venv = vim.fn.getcwd(), os.getenv("VIRTUAL_ENV")
-- 	if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
-- 		return venv .. "/bin/python"
-- 	elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
-- 		return cwd .. "/venv/bin/python"
-- 	elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
-- 		return cwd .. "/.venv/bin/python"
-- 	else
-- 		return "/usr/bin/python"
-- 	end
-- end,
