return {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 6,
            },
        })
    end,
    keys = {
        {
            "<leader>a",
            ":lua require('harpoon.mark').add_file()<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon add file",
        },
        {
            "<c-e>",
            ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon toggle quick menu",
        },
        {
            "<A-1>",
            ":lua require('harpoon.ui').nav_file(1)<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon goto file 1",
        },
        {
            "<A-2>",
            ":lua require('harpoon.ui').nav_file(2)<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon goto file 2",
        },
        {
            "<A-3>",
            ":lua require('harpoon.ui').nav_file(3)<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon goto file 3",
        },
        {
            "<A-4>",
            ":lua require('harpoon.ui').nav_file(4)<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon goto file 4",
        },
        {
            "<A-n>",
            ":lua require('harpoon.ui').nav_next()<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon next pin",
        },
        {
            "<A-p>",
            ":lua require('harpoon.ui').nav_prev()<cr>",
            noremap = true,
            silent = true,
            desc = "Harpoon previous pin",
        },
    },
}
