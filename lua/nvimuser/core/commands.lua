# insert commands here
vim.api.nvim_create_user_command('Black', 'silent! | :!black --line-length 120 %', {})
vim.api.nvim_create_user_command('Isort', 'silent! | :!isort --profile black -e %', {})
vim.api.nvim_create_user_command('Newbuff', 'silent! | :vsplit | enew', {})
vim.api.nvim_create_user_command('Spelloff', 'setlocal nospell', {})
vim.api.nvim_create_user_command('Spellon', 'setlocal spell spelllang=en_us', {})
-- vim.api.nvim_create_user_command('Flake', 'silent! | :!flake8 %', {})
