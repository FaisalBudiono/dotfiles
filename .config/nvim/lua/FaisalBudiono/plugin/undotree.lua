return {
    "jiaoshijie/undotree",
    opts = {
        -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
        {
            "<leader>ut",
            function()
                require("undotree").toggle()
            end,
            noremap = true,
            silent = true,
            desc = "Open undotree",
        },
    },
}
