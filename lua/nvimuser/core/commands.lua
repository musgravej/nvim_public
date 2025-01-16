# insert commands here
vim.api.nvim_create_user_command('Newbuff', 'silent! | :vsplit | enew', {})
vim.api.nvim_create_user_command('Black', 'silent! | :!black --line-length 120 %', {})
vim.api.nvim_create_user_command('Isort', 'silent! | :!isort %', {})
-- vim.api.nvim_create_user_command('Flake', 'silent! | :!flake8 %', {})
