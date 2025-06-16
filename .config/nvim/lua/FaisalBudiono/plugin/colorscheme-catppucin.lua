return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
        "nvim-lualine/lualine.nvim",
    },
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                gitsigns = true,
                harpoon = true,
                barbecue = {
                    dim_dirname = true, -- directory name is dimmed by default
                    bold_basename = true,
                    dim_context = true,
                    alt_background = true,
                },
                neogit = true,
                treesitter = true,
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
