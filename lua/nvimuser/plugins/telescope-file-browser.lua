return {
    "nvim-telescope/telescope-file-browser.nvim",
    enabled = false,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    --[[
    | Key(s)         | Action               | Description                                                        |
    |----------------|----------------------|--------------------------------------------------------------------|
    | <A-c>/c        | create               | Create file/folder at current path (trailing / creates folder)     |
    | <S-CR>         | create_from_prompt   | Create and open file/folder from prompt (trailing / creates folder)|
    | <A-r>/r        | rename               | Rename multi-selected files/folders                                |
    | <A-m>/m        | move                 | Move multi-selected files/folders to current path                  |
    | <A-y>/y        | copy                 | Copy (multi-)selected files/folders to current path                |
    | <A-d>/d        | remove               | Delete (multi-)selected files/folders                              |
    | <C-o>/o        | open                 | Open file/folder with default system application                   |
    | <C-g>/g        | goto_parent_dir      | Go to parent directory                                             |
    | <C-e>/e        | goto_home_dir        | Go to home directory                                               |
    | <C-w>/w        | goto_cwd             | Go to current working directory (cwd)                              |
    | <C-t>/t        | change_cwd           | Change nvim's cwd to selected folder/file(parent)                  |
    | <C-f>/f        | toggle_browser       | Toggle between file and folder browser                             |
    | <C-h>/h        | toggle_hidden        | Toggle hidden files/folders                                        |
    | <C-s>/s        | toggle_all           | Toggle all entries ignoring ./ and ../                             |
    | <Tab>          | see telescope.nvim   | Toggle selection and move to next selection                        |
    | <S-Tab>        | see telescope.nvim   | Toggle selection and move to prev selection                        |
    | <bs>/          | backspace            | With empty prompt: go to parent dir; otherwise acts normally       |
    ]]
    config = function()
        -- open file_browser with the path of the current buffer
        vim.keymap.set("n", "<space>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end
}
