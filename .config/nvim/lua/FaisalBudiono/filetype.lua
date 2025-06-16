local M = {}
local filetypes = {
    ["yaml.docker-compose"] = "yaml.docker-compose",
    ["eraser-diagram"] = "eraser-diagram",
}

M.filetypes = filetypes

vim.filetype.add({
    pattern = {
        ["docker%-compose[%w_.-]*%.yml"] = filetypes["yaml.docker-compose"],
        ["[%w_.-]*.eraser"] = filetypes["eraser-diagram"],
    },
})

return M
