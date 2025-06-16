require("FaisalBudiono.set")
require("FaisalBudiono.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "FaisalBudiono.plugin" },
    { import = "FaisalBudiono.plugin.lsp" },
}, {
    install = {
        colorscheme = { "nightfly" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

require("FaisalBudiono.command")
require("FaisalBudiono.filetype")
