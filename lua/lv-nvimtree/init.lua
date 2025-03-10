local M = {}

<<<<<<< HEAD
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath ]] -- vim.g.nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
-- vim.g.nvim_tree_disable_netrw = 0 -- moved to lv-globals
-- vim.g.nvim_tree_hijack_netrw = 0 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_close = O.auto_close_tree -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = 'startify' --empty by default, don't auto open tree on specific filetypes.
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      -- ["<CR>"] = ":YourVimFunction()<cr>",
      -- ["u"] = ":lua require'some_module'.some_function()<cr>",
=======
M.config = function()
    local g = vim.g
>>>>>>> upstream/master

    vim.o.termguicolors = true

    g.nvim_tree_side = "left"
    g.nvim_tree_width = 30
    g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
    g.nvim_tree_auto_open = 1
    g.nvim_tree_auto_close = 0
    g.nvim_tree_quit_on_open = 0
    g.nvim_tree_follow = 1
    g.nvim_tree_indent_markers = 1
    g.nvim_tree_hide_dotfiles = 1
    g.nvim_tree_git_hl = 1
    g.nvim_tree_root_folder_modifier = ":t"
    g.nvim_tree_tab_open = 0
    g.nvim_tree_allow_resize = 1
    g.nvim_tree_lsp_diagnostics = 1
    g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}

    g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1
    }

    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌"
        },
        folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = ""
        }
    }

    local tree_cb = require"nvim-tree.config".nvim_tree_callback

    g.nvim_tree_bindings = {
        ["u"] = ":lua require'some_module'.some_function()<cr>",
        ["<CR>"] = tree_cb("edit"),
        ["l"] = tree_cb("edit"),
        ["o"] = tree_cb("edit"),
        ["h"] = tree_cb("close_node"),
        ["<2-LeftMouse>"] = tree_cb("edit"),
        ["<2-RightMouse>"] = tree_cb("cd"),
        ["<C-]>"] = tree_cb("cd"),
        ["<C-v>"] = tree_cb("vsplit"),
        ["v"] = tree_cb("vsplit"),
        ["<C-x>"] = tree_cb("split"),
        ["<C-t>"] = tree_cb("tabnew"),
        ["<"] = tree_cb("prev_sibling"),
        [">"] = tree_cb("next_sibling"),
        ["<BS>"] = tree_cb("close_node"),
        ["<S-CR>"] = tree_cb("close_node"),
        ["<Tab>"] = tree_cb("preview"),
        ["I"] = tree_cb("toggle_ignored"),
        ["H"] = tree_cb("toggle_dotfiles"),
        ["R"] = tree_cb("refresh"),
        ["a"] = tree_cb("create"),
        ["d"] = tree_cb("remove"),
        ["r"] = tree_cb("rename"),
        ["<C-r>"] = tree_cb("full_rename"),
        ["x"] = tree_cb("cut"),
        ["c"] = tree_cb("copy"),
        ["p"] = tree_cb("paste"),
        ["y"] = tree_cb("copy_name"),
        ["Y"] = tree_cb("copy_path"),
        ["gy"] = tree_cb("copy_absolute_path"),
        ["[c"] = tree_cb("prev_git_item"),
        ["]c"] = tree_cb("next_git_item"),
        ["-"] = tree_cb("dir_up"),
        ["q"] = tree_cb("close")
    }
end

local view = require 'nvim-tree.view'

M.toggle_tree = function()
    if view.win_open() then
        require'nvim-tree'.close()
        require'bufferline.state'.set_offset(0)
    else
        require'bufferline.state'.set_offset(31, 'File Explorer')
        require'nvim-tree'.find_file(true)
    end

end

return M
