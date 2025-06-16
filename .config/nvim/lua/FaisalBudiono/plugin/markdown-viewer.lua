return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
        {
            "<leader>mp",
            ':MarkdownPreview<CR>',
            noremap = true,
            silent = true,
            desc = "Run markdown preview",
        },
    },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
