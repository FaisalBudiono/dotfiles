local config_fts = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    svelte = { "eslint_d" },
    css = { "eslint_d" },
    html = { "eslint_d" },
    graphql = { "eslint_d" },
    lua = { "selene" },
    php = { "php" },
}

local fts = {}
for ft in pairs(config_fts) do
    table.insert(fts, ft)
end

return {
    "mfussenegger/nvim-lint",
    ft = fts,
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        local opts = require("FaisalBudiono.util").create_opts
        local lint = require("lint")

        lint.linters_by_ft = config_fts

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
        end, opts("Trigger linting for current file"))
    end,
}
