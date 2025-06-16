local opts = require("FaisalBudiono.util").create_opts
local get_on_visual = require("FaisalBudiono.util").get_visual

vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts("Go down half page"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts("Go up half page"))
vim.keymap.set("n", "n", "nzzzv", opts("Next search with zz"))
vim.keymap.set("n", "N", "Nzzzv", opts("Previous search with zz"))

-- Copy to system: Need XClip
-- Open healthcheck for more info (:checkhealth)
vim.keymap.set({ "n", "v" }, "<leader>`", [["_]], opts("Ignore copy"))
vim.keymap.set({ "n", "v" }, "<leader>cy", [["+y]], opts("Prepare copy to clipboard"))
vim.keymap.set("n", "<leader>cp", [["+p]], opts("Paste from clipboard (after)"))
vim.keymap.set("n", "<leader>cP", [["+P]], opts("Paste from clipboard (before)"))
vim.keymap.set({ "v" }, "p", [["_dP]], opts("Paste without overwriting register"))

vim.keymap.set("n", "<leader>nn", function()
    vim.cmd(":tabnew")
end, opts("Create new tab"))
vim.keymap.set("n", "<leader>nl", function()
    vim.cmd(":vnew")
end, opts("Create right window"))
vim.keymap.set("n", "<leader>nj", function()
    vim.cmd(":new")
end, opts("Create bottom window"))

--
-- Windows Size Manipulation
--
vim.keymap.set("n", "<leader>w=", "<c-w>=", opts("Make windows equal"))
vim.keymap.set("n", "<leader>w<s-m>", "100<c-w>+", opts("Maximize window"))
vim.keymap.set("n", "<leader>wm", "100<c-w>-", opts("Minimize window"))

--
-- Visual Mode
--
vim.keymap.set("v", "<", "<gv", opts("Keep visual block after indent left"))
vim.keymap.set("v", ">", ">gv", opts("Keep visual block after indent right"))

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move up and auto indent"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move down and auto indent"))

-- Search Highlighter
vim.keymap.set("n", "<leader>hl", ":noh<CR>", opts("no highlight"))
vim.keymap.set("v", "<leader>hl", 'y/<Bslash>v<c-r>"<CR>Nzz', opts("highlight selected word"))

-- Quickfix
vim.keymap.set("n", "<leader>qo", ":copen<CR>", opts("Open quickfix list"))
vim.keymap.set("n", "<leader>qq", ":cclose<CR>", opts("Quite quickfix list"))
vim.keymap.set("n", "]q", ":cnext<CR>", opts("Next quickfix"))
vim.keymap.set("n", "[q", ":cprev<CR>", opts("Prev quickfix"))

-- Replace / to \
vim.keymap.set("v", "<leader>pn", function()
    vim.cmd("s/\\//\\\\/g")
    vim.cmd("noh")
end, opts("Replace slash to backslash"))

-- Buffer
vim.keymap.set("n", "<leader>bQ", ":bufdo bd<CR>", opts("Close all buffers"))
vim.keymap.set("n", "<leader>bq", ":bd<CR>", opts("Close buffer"))
vim.keymap.set("n", "]b", ":bnext<CR>", opts("Next buffer"))
vim.keymap.set("n", "[b", ":bprev<CR>", opts("Prev buffer"))

-- UI
vim.keymap.set("n", "<M-z>", ":set wrap!<CR>", opts("Toggle linewrap"))
vim.keymap.set(
    "n",
    "<leader><M-c>",
    ":set fo-=o<CR>",
    opts("Overwrite o new line auto comment when cursor on comment section")
)

-- Sort
vim.keymap.set({ "v" }, "<leader>cs", ":! sort -fb<CR>", opts("Sort visual block"))
