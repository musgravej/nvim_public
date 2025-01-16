-- Helper function to extract the GitHub URL from .git/config
local function get_repo_url()
    -- Read the contents of the .git/config file
    local git_config = io.popen("git config --get remote.origin.url"):read("*a")
    git_config = git_config:gsub("\n", "") -- Remove newline characters

    -- Replace the Git URL with HTTPS (if it's a git@github.com URL)
    git_config = git_config:gsub("git@github.com:", "https://github.com/")
    git_config = git_config:gsub("%.git$", "") -- Remove the .git extension

    return git_config
end

-- Function to open the current line or selected lines in GitHub
function Open_in_github()
    -- Get the repository URL
    local repo_url = get_repo_url()

    if not repo_url or repo_url == "" then
        print("Could not determine repository URL.")
        return
    end

    -- Get the current file path relative to the git root using git ls-files
    local relative_file_path = io.popen("git ls-files --full-name " .. vim.fn.expand("%:p")):read("*a"):gsub("\n", "")

    if relative_file_path == "" then
        print("Could not determine the relative file path.")
        return
    end

    -- Get the current branch
    local branch = io.popen("git rev-parse --abbrev-ref HEAD"):read("*a"):gsub("\n", "")

    -- Determine if we're in visual mode and selecting a range
    local line_start, line_end
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
        -- Get the visual selection's start and end lines
        line_start = vim.fn.line("v")
        line_end = vim.fn.line(".")
        if line_start > line_end then
            -- Swap lines if selected backwards
            line_start, line_end = line_end, line_start
        end
    else
        -- Normal mode, get the current line
        line_start = vim.fn.line(".")
        line_end = line_start
    end

    -- Construct the GitHub URL for the current file and selected lines (if any)
    local github_url
    if line_start == line_end then
        -- Single line
        github_url = string.format("%s/blob/%s/%s#L%d", repo_url, branch, relative_file_path, line_start)
    else
        -- Line range
        github_url = string.format("%s/blob/%s/%s#L%d-L%d", repo_url, branch, relative_file_path, line_start, line_end)
    end

    -- Open the GitHub URL in the default browser
    if vim.fn.has("mac") == 1 then
        vim.fn.jobstart({ "open", github_url }) -- macOS
    elseif vim.fn.has("unix") == 1 then
        vim.fn.jobstart({ "xdg-open", github_url }) -- Linux
    elseif vim.fn.has("win32") == 1 then
        vim.fn.jobstart({ "start", github_url }) -- Windows
    else
        print("Unsupported OS")
    end

    -- Copy the GitHub URL to the clipboard
    vim.fn.setreg("+", github_url) -- Copies the URL to system clipboard
    print("GitHub URL copied to clipboard: " .. github_url)
end

-- Keybinding to open the current line or selected lines in GitHub
vim.api.nvim_set_keymap("n", "<leader>gh", ":lua Open_in_github()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>gh", ":<C-u>lua Open_in_github()<CR>", { noremap = true, silent = true })
