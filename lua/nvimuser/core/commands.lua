# insert commands here
vim.api.nvim_create_user_command('Newbuff', 'silent! | :vsplit | enew', {})
vim.api.nvim_create_user_command('Black', 'silent! | :!black %', {})
