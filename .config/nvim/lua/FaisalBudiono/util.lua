local M = {}

M.create_opts = function(desc)
    return {
        desc = desc,
        noremap = true,
        silent = true,
    }
end

M.get_visual = function()
    local s_start = vim.fn.getpos("v")
    local s_end = vim.fn.getpos(".")
    return vim.api.nvim_buf_get_text(0, s_start[2] - 1, s_start[3] - 1, s_end[2] - 1, s_end[3], {})
end

M.file_relative_path = function(withExt)
    if withExt then
        return vim.fn.expand("%:.")
    end

    return vim.fn.expand("%:.:r")
end

M.file_name = function()
    return vim.fn.expand("%:t:r")
end

M.relative_path = function()
    return vim.fn.expand("%:.:h")
end

M.table_expand = function(defaultTable, extendedTable)
    local tab = {}
    for key, value in pairs(defaultTable) do
        tab[key] = value
    end

    for key, value in pairs(extendedTable) do
        tab[key] = value
    end
    return tab
end

return M
