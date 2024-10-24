-- Auto loads all plugins in the directory
local function load_lua_files(directory)
	for _, file in ipairs(vim.fn.globpath(directory, "*.lua", 0, 1)) do
		local module_name = file:match(".*/(.*).lua$")
		if module_name and module_name ~= "init" then -- Avoid loading self
			require("/jmusgrave/custom_plugins." .. module_name) -- Correct module path
		end
	end
end

load_lua_files(vim.fn.stdpath("config") .. "/lua/jmusgrave/custom_plugins/")
