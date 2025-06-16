return {
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "VeryLazy",
        main = "ibl",
        opts = {},
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        lazy = true,
        event = "VeryLazy",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            theme = "catppuccin-mocha",
        },
    },
}
