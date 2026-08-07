return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        keys = {
            {
                "<leader>sp",
                function()
                    Snacks.picker()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker",
            },
            {
                "<C-p>",
                function()
                    Snacks.picker.git_files()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker fuzzy finder for git files",
            },
            {
                "<leader>pf",
                function()
                    Snacks.picker.files()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker fuzzy finder for all file",
            },
            {
                "<leader>pb",
                function()
                    Snacks.picker.buffers()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker fuzzy finder for buffers",
            },
            {
                "<leader><Bslash>",
                function()
                    Snacks.picker.keymaps()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker listing all keymap",
            },
            {
                "<leader>ghb",
                function()
                    Snacks.picker.git_log_file()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker git file change",
            },
            {
                "<leader>ghh",
                function()
                    Snacks.picker.git_log()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker git log",
            },
            {
                "<leader>ghl",
                function()
                    Snacks.picker.git_log_line()
                end,
                noremap = true,
                silent = true,
                desc = "Open snack picker git log by line",
            },
        },
        ---@type snacks.Config
        opts = {
            picker = {},
            image = {
                -- your image configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
    },
}
