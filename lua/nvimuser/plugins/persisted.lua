-- https://github.com/olimorris/persisted.nvim
-- Saves sessions to ~/.local/share/nvim/neovim_persisted_sessions
return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	autostart = true, -- Automatically start the plugin on load?

	config = function()
		require("persisted").setup({
			-- Function to determine if a session should be saved
			---@type fun(): boolean
			should_save = function()
				return false
			end,

            -- Directory where session files are saved
            -- Resolves to ~/.local/share/nvim/neovim_persisted_sessions
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/neovim_persisted_sessions/"),

			follow_cwd = true, -- Change the session file to match any change in the cwd?
			use_git_branch = false, -- Include the git branch in the session file name?
			autoload = false, -- Automatically load the session for the cwd on Neovim startup?
			-- autoload = true, -- Automatically load the session for the cwd on Neovim startup?

			-- Function to run when `autoload = true` but there is no session to load
			---@type fun(): any
			on_autoload_no_session = function() end,

			-- By design, the plugin will not autoload a session when any arguments are passed to Neovim such as nvim my_file.py
			allowed_dirs = {}, -- Table of dirs that the plugin will start and autoload from
			ignored_dirs = {}, -- Table of dirs that are ignored for starting and autoloading
			telescope = {
                mappings = { -- Mappings for managing sessions in Telescope
                    copy_session = "<C-c>",
                    change_branch = "<C-b>",
                    delete_session = "<C-d>",
                },
                icons = { -- icons displayed in the Telescope picker
                    selected = " ",
                    dir = "  ",
                    branch = " ",
                },
            },

			-- Callback function to Save your current session when loading a new one
			 vim.api.nvim_create_autocmd("User", {
				pattern = "PersistedTelescopeLoadPre",
				callback = function(session)
					-- Save the currently loaded session using the global variable
					require("persisted").save({ session = vim.g.persisted_loaded_session })

			 		-- Delete all of the open buffers
					vim.api.nvim_input("<ESC>:%bd!<CR>")
				end,
			}),

			-- Callback function to not include any .pyc files from being saved to the session
			vim.api.nvim_create_autocmd("User", {
				pattern = "PersistedSavePre",
				callback = function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.bo[buf].filetype == "pyc" then
							vim.api.nvim_buf_delete(buf, { force = true })
						end
                        if vim.bo[buf].filetype == "neo-tree" then
							vim.api.nvim_buf_delete(buf, { force = true })
						end
					end
				end,
			}),
		})
        -- set keymaps
        vim.keymap.set("n", "<leader>pt", "<cmd>SessionToggle<cr>", { desc = "Toggle Persisted Session" })
        vim.keymap.set("n", "<leader>pa", "<cmd>SessionStart<cr>", { desc = "Start Persisted Session" })
        vim.keymap.set("n", "<leader>po", "<cmd>SessionStop<cr>", { desc = "Stop Persisted Session" })
        vim.keymap.set("n", "<leader>ps", "<cmd>SessionSave<cr>", { desc = "Save Persisted Session" })
        -- vim.keymap.set("n", "<leader>pd", "<cmd>SessionLoad<cr>", { desc = "Load Persisted Session" })
        vim.keymap.set("n", "<leader>pm", "<cmd>Telescope persisted<cr>", { desc = "Manage Persisted Session" })
	end,
}
