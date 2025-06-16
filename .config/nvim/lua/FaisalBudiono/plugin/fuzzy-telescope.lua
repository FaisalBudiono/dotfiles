return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    event = { "LspAttach" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    keys = {
        {
            "<C-p>",
            ":lua require('telescope.builtin').git_files()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope fuzzy finder for git files",
        },
        {
            "<leader>pt",
            function()
                require("telescope.builtin").grep_string({
                    search = "@todo",
                    additional_args = {
                        "-u",
                        "--hidden",
                    },
                })
            end,
            mode = { "n" },
            noremap = true,
            silent = true,
            desc = "Open telescope TODO list",
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").live_grep({
                    additional_args = {
                        "-u",
                        "--hidden",
                    },
                })
            end,
            mode = { "n" },
            noremap = true,
            silent = true,
            desc = "Open telescope Live Grep",
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({
                    search = require("FaisalBudiono.util").get_visual()[1],
                    additional_args = {
                        "-u",
                        "--hidden",
                    },
                })
            end,
            mode = { "v" },
            noremap = true,
            silent = true,
            desc = "Open telescope grep string from visual mode",
        },
        {
            "<leader>pS",
            function()
                require("FaisalBudiono.plugin.telescope.multigrep").live_multigreps()
            end,
            noremap = true,
            silent = true,
            desc = "open telescope custom multigrep with glob",
        },
        {
            "<leader>pf",
            ":lua require('telescope.builtin').find_files({hidden=true,no_ignore=true})<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope fuzzy finder for all file",
        },
        {
            "<leader>pb",
            ":lua require('telescope.builtin').buffers()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope fuzzy finder for buffers",
        },
        {
            "<leader>pO",
            function()
                require("telescope.builtin").lsp_document_symbols({
                    symbols = { "method" },
                })
            end,
            noremap = true,
            silent = true,
            desc = "Open telescope symbol method only",
        },
        {
            "<leader>po",
            ":lua require('telescope.builtin').lsp_document_symbols()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope symbol",
        },
        {
            "<leader><Bslash>",
            ":lua require('telescope.builtin').keymaps()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope listing all keymap",
        },
        {
            "<leader>ghb",
            ":lua require('telescope.builtin').git_bcommits()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope git file change",
        },
        {
            "<leader>ghh",
            ":lua require('telescope.builtin').git_commits()<cr>",
            noremap = true,
            silent = true,
            desc = "Open telescope git history",
        },
    },
    config = function()
        local tele = require("telescope")

        tele.setup({
            defaults = {
                layout_strategy = "vertical",
                file_ignore_patterns = {
                    ".git/.*",
                    ".next/.*",
                    ".yarn/.*",
                    "vendor/.*",
                    "node_modules/.*",
                    "tmp/.*",
                },
                mappings = {
                    i = {
                        ["<C-o>"] = "complete_tag", -- add filtering in telescope symbol
                        ["<A-Q>"] = "send_to_qflist", -- Send all telescope to qf
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case",
                    },
                },
            },
            pickers = {
                lsp_document_symbols = { symbol_width = 80 },
            },
        })

        tele.load_extension("fzf")
    end,
}
