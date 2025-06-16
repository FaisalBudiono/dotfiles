return {
    "folke/trouble.nvim",
    event = { "LspAttach" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>ldd",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            noremap = true,
            silent = true,
            desc = "Show Trouble buffer diagnostic",
        },
        {
            "<leader>ldw",
            "<cmd>Trouble diagnostics toggle<cr>",
            noremap = true,
            silent = true,
            desc = "Show Trouble all diagnostics",
        },
    },
    config = function()
        local trouble = require("trouble")
        local util = require("FaisalBudiono.util")

        trouble.setup()

        vim.keymap.set("n", "[t", function()
            pcall(trouble.prev, { skip_groups = true, jump = true })
        end, util.create_opts("Go to previous diagnostic"))

        vim.keymap.set("n", "]t", function()
            pcall(trouble.next, { skip_groups = true, jump = true })
        end, util.create_opts("Go to next diagnostic"))
    end,
}
