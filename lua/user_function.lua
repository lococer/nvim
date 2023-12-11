function Open_initfile()
	-- local init_path="C:\\Users\\luozh\\Appdata\\Local\\nvim\\init.lua"
	local init_path="~\\Appdata\\Local\\nvim\\init.lua"
	-- vim.cmd("command! e "..init_path)
	-- vim.api.nvim_exec([[
	-- 	edit C:\\Users\\luozh\\Appdata\\Local\nvim\\init.lua
	-- ]],false)
	-- vim.api.nvim_exec("edit "..init_path,false)
    vim.cmd("edit "..init_path)
end

