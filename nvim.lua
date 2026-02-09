-- ----------------------------------------------------------------------------
-- Basic Settings
-- ----------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmatch = true
opt.showcmd = true
opt.scrolloff = 10
opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Tabs/Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

-- Files/Backup @ ~/.local/share/nvim
opt.undofile = true
opt.backup = true
opt.backupdir = vim.fn.stdpath("data") .. "/backup//"
opt.directory = vim.fn.stdpath("data") .. "/swap//"
opt.undodir = vim.fn.stdpath("data") .. "/undo//"

-- Create backup directories if they don't exist
for _, dir in ipairs({ "backup", "swap", "undo" }) do
    local path = vim.fn.stdpath("data") .. "/" .. dir
    if vim.fn.isdirectory(path) == 0 then
        vim.fn.mkdir(path, "p")
    end
end

-- Misc
opt.clipboard = "unnamedplus"
opt.listchars = { trail = "-" }
opt.guifont = "FiraCode Nerd Font:h12"

-- Use ripgrep for grep if available
if vim.fn.executable("rg") == 1 then
    opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

-- ----------------------------------------------------------------------------
-- Bootstrap lazy.nvim (auto-installs itself)
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------
-- Plugins
-- ----------------------------------------------------------------------------
require("lazy").setup({
    -- Color schemes
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup({ variant = "moon" })
            vim.cmd("colorscheme rose-pine-moon")
        end,
    },
    { "folke/tokyonight.nvim", lazy = true },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    { "ellisonleao/gruvbox.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },

    -- Status line (replaces vim-airline)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                tabline = {
                    lualine_a = {
                        {
                            "buffers",
                            show_filename_only = true,
                            show_bufnr = true,
                        },
                    },
                },
            })
        end,
    },

    -- Fuzzy finder (replaces fzf.vim)
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })
            telescope.load_extension("fzf")
        end,
    },

    -- Git signs in gutter (replaces vim-gitgutter)
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    -- Navigation (same as your gitgutter mappings)
                    map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
                    map("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
                    map("n", "<leader>h", gs.preview_hunk, { desc = "Preview hunk" })
                    map("n", "<leader>u", gs.reset_hunk, { desc = "Reset hunk" })
                end,
            })
        end,
    },

    -- Git integration (keeping vim-fugitive - it's still the best)
    { "tpope/vim-fugitive" },

    -- Commenting (replaces vim-commentary)
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Undo tree
    { "mbbill/undotree" },

    -- Marks in sign column
    {
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup()
        end,
    },

    -- Treesitter for better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "python", "typescript", "javascript", "lua",
                "vim", "vimdoc", "json", "yaml", "html",
                "css", "gdscript", "svelte",
            },
        },
    },

    -- Which-key to show keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },

    -- LSP server configs (used by vim.lsp.enable below)
    { "neovim/nvim-lspconfig" },
})

-- ----------------------------------------------------------------------------
-- LSP
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover info" }))
    end,
})

-- Enable servers (uncomment as you install them)
vim.lsp.enable("pyright")
-- vim.lsp.enable("ts_ls")
-- vim.lsp.enable("lua_ls")

-- ----------------------------------------------------------------------------
-- Key Mappings (preserved from your vimrc)
-- ----------------------------------------------------------------------------
local map = vim.keymap.set

-- Clear search highlighting with Ctrl-L
map("n", "<C-L>", ":nohlsearch<CR><C-L>", { silent = true })

-- Buffer navigation
map("n", "<C-Left>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<C-Right>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<Leader><Tab>", "<C-W><C-W>", { desc = "Cycle windows" })
map("n", "<Leader>b", ":b#<CR>", { desc = "Toggle last buffer" })

-- Jump to buffer 1-9
for i = 1, 9 do
    map("n", "<Leader>" .. i, ":b" .. i .. "<CR>", { desc = "Buffer " .. i })
end

-- Window and buffer management
map("n", "<C-d>", ":q<CR>", { desc = "Quit window" })
map("n", "<Leader>t", ":UndotreeToggle<CR>", { desc = "Toggle undo tree" })
map("n", "<Leader>z", ":pclose<CR>", { desc = "Close preview" })
map("n", "<Leader>x", ":bp|bd #<CR>", { desc = "Close buffer" })
map("n", "<Leader><Leader>", ":write<CR>", { desc = "Save file" })

-- Telescope mappings (replacing your fzf mappings)
local builtin = require("telescope.builtin")
map("n", "<Leader>d", function() builtin.find_files({ hidden = true }) end, { desc = "Find files" })
map("n", "<Leader>e", builtin.buffers, { desc = "Find buffers" })
map("n", "<Leader>r", builtin.live_grep, { desc = "Live grep" })
map("n", "<Leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search buffer" })
map("n", "<Leader>g", builtin.git_status, { desc = "Git status" })
map("n", "<Leader>m", builtin.marks, { desc = "Find marks" })

-- Paste without yanking in visual mode
map("x", "p", '"_dP')

-- Search word under cursor and change with dot
map("n", "<leader>c", "*``cgn", { desc = "Change word under cursor" })

-- Hard mode
local modes = { "n", "i", "v" }
for _, mode in ipairs(modes) do
    map(mode, "<Up>", "<Nop>")
    map(mode, "<Down>", "<Nop>")
    map(mode, "<Left>", "<Nop>")
    map(mode, "<Right>", "<Nop>")
end

-- ----------------------------------------------------------------------------
-- FileType-specific Settings
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "html", "json", "svelte" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- ----------------------------------------------------------------------------
-- Quick Tips
-- ----------------------------------------------------------------------------
-- :Lazy              - Open plugin manager UI
-- :Lazy sync         - Update all plugins
-- :Telescope         - See all telescope pickers
-- :checkhealth       - Diagnose issues
-- gc{motion}         - Comment (e.g., gcc for line, gc3j for 3 lines)
