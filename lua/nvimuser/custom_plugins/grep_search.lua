-- [[
--   Grep Search Plugin
--
--   This plugin makes it easy to search through your project and refine the search results
--   directly within Neovim.
--
--   Features:
--     - Search for a term: Perform a project-wide search for a specific term using Ripgrep.
--     - Exclude specific terms: You can exclude search results from the quickfix list based on a pattern.
--     - Include specific terms: You can filter the quickfix list to only include search results that match a pattern.
--
--   Usage:
--     1. Search for a term:
--        - Press `<leader>sp` (or run `:lua GrepSearch()`).
--        - Enter the search term when prompted.
--        - The results will be displayed in the quickfix window.
--
--     2. Exclude specific entries:
--        - Run `:lua ExcludeText()`.
--        - Enter the pattern you want to exclude.
--        - Any entries matching the pattern (in either the filename or text) will be removed from the quickfix list.
--
--     3. Include specific entries:
--        - Run `:lua IncludeText()`.
--        - Enter the pattern you want to include.
--        - Only entries matching the pattern (in either the filename or text) will be kept in the quickfix list.
--
--     4. Navigating the results:
--        - Use vim keys like normal in the quickfix window.
--        - Press `<CR>` (Enter) to open the selected result in your editor.
--
--   Keybindings:
--     - `<leader>sp`: Start a new search with Ripgrep.
--     - `<leader>v`: Exclude search results based on a pattern.
--     - `<leader>g`: Include search results based on a pattern.
--
-- ]]

-- Function to perform initial grep search
function GrepSearch()
	local search_term = vim.fn.input("Grep for: ")
	vim.cmd('cgetexpr system("rg --vimgrep \\"' .. search_term .. '\\"")')
	vim.cmd("copen")
end

-- Function to include text and filename in the quickfix list
function IncludeText()
	local include_pattern = vim.fn.input("Include pattern: ")
	local new_qf_list = {}

	-- Get the current quickfix list
	local qf_list = vim.fn.getqflist()

	-- Iterate over each item and get the filename from the buffer number if available
	for _, item in ipairs(qf_list) do
		local filename = item.filename or (item.bufnr and vim.fn.bufname(item.bufnr)) -- Get filename from bufnr

		-- If either the item text or the filename matches the include pattern, keep it in the list
		if string.match(item.text or "", include_pattern) or string.match(filename or "", include_pattern) then
			table.insert(new_qf_list, item)
		end
	end

	-- Set the new quickfix list
	vim.fn.setqflist(new_qf_list)
end

-- Function to exclude text and filename from the quickfix list
function ExcludeText()
	local exclude_pattern = vim.fn.input("Exclude pattern: ")
	local new_qf_list = {}

	-- Get the current quickfix list
	local qf_list = vim.fn.getqflist()

	-- Iterate over each item and get the filename from the buffer number if available
	for _, item in ipairs(qf_list) do
		local filename = item.filename or (item.bufnr and vim.fn.bufname(item.bufnr)) -- Get filename from bufnr

		-- If neither the item text nor the filename matches the exclude pattern, keep it in the list
		if not (string.match(item.text or "", exclude_pattern) or string.match(filename or "", exclude_pattern)) then
			table.insert(new_qf_list, item)
		end
	end

	-- Set the new quickfix list
	vim.fn.setqflist(new_qf_list)
end

-- Function to open selected quickfix entry
function QuickfixOpen()
	-- Get the current cursor position in the quickfix window
	local cursor_pos = vim.fn.getcurpos()[2] -- Get the cursor's line number in the quickfix window

	-- Get the entire quickfix list
	local qf_list = vim.fn.getqflist()

	-- Get the quickfix item corresponding to the cursor position
	local qf_item = qf_list[cursor_pos]

	if qf_item and qf_item.bufnr and qf_item.lnum then
		-- Get the buffer name (file path) from the buffer number
		local filename = vim.fn.bufname(qf_item.bufnr)
		if filename ~= "" then
			-- Close the quickfix window and switch to the main window
			vim.cmd("wincmd p") -- Move to the previous window (main editor)
			-- Open the file and jump to the correct line and column
			vim.cmd("e " .. filename)
			vim.api.nvim_win_set_cursor(0, { qf_item.lnum, qf_item.col - 1 }) -- Move cursor to line and column
		else
			print("Unable to determine the file for the selected quickfix entry.")
		end
	else
		print("No valid quickfix entry selected.")
	end
end

-- Function to set key mappings for quickfix window --
vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>lua ExcludeText()<CR>", { noremap = true, silent = true, desc = "Grep search exclude text"})
vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua IncludeText()<CR>", { noremap = true, silent = true,  desc = "Grep search include text"})
vim.api.nvim_set_keymap("n", "<CR>", ":lua QuickfixOpen()<CR>", { noremap = true, silent = true, desc = "Grep search Quickfix" }) -- Specific to quickfix window
-- end

-- Set the main keymap for this, <leader>gs to open the search interface --
vim.api.nvim_set_keymap("n", "<leader>gs", ":lua GrepSearch()<CR>", { noremap = true, silent = true, desc = "Grep search" })

