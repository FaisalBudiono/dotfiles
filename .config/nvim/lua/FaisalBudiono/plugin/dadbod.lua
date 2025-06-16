return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql" },
            lazy = true,
        },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    keys = {
        {
            "<leader>dbd",
            function()
                vim.cmd("DBUI")
            end,
            noremap = true,
            silent = true,
            desc = "Open DBUI",
        },
        {
            "<leader>dbf",
            function()
                vim.cmd("DBUIFindBuffer")
            end,
            noremap = true,
            silent = true,
            desc = "Open DBUI Finder",
        },
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
