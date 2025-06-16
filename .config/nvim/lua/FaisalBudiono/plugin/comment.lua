return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        local comment = require("Comment")

        comment.setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        local ft = require("Comment.ft")
        local filetypes = require("FaisalBudiono.filetype").filetypes

        ft({ filetypes["eraser-diagram"] }, "//%s")
    end,
}
