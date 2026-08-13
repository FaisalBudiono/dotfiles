return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        local comment = require("Comment")

        comment.setup({
            pre_hook = function(ctx)
                -- If Treesitter/Comment.nvim fails to find a comment string for this filetype,
                -- fallback safely to '#' for line comments and leave block comments alone.
                local ok, _ = pcall(require, "Comment.utils")
                if ok then
                    -- Check if the current filetype lacks a valid internal config
                    if vim.bo.filetype == "env" then
                        return "#%s"
                    end

                    local filetypes = require("FaisalBudiono.filetype").filetypes
                    if vim.bo.filetype == filetypes["eraser-diagram"] then
                        return "//%s"
                    end
                end

                local ts_context_cb =
                    require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

                return ts_context_cb(ctx)
            end,
        })
    end,
}
