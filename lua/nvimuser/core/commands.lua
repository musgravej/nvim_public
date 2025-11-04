# insert commands here
--  Set formatter command options through cli parameters
-- vim.api.nvim_create_user_command('Black', 'silent! | :!black --line-length 120 %', {})
-- vim.api.nvim_create_user_command('Isort', 'silent! | :!isort --profile black -e %', {})
--
-- Set formattter commands from pyproject.toml
vim.api.nvim_create_user_command('Black', 'silent! | :!black %', {})
vim.api.nvim_create_user_command('Isort', 'silent! | :!isort %', {})
--
vim.api.nvim_create_user_command('Newbuff', 'silent! | :vsplit | enew', {})
vim.api.nvim_create_user_command('Spelloff', 'setlocal nospell', {})
vim.api.nvim_create_user_command('Spellon', 'setlocal spell spelllang=en_us', {})
-- vim.api.nvim_create_user_command('Flake', 'silent! | :!flake8 %', {})
