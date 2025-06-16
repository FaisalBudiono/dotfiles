return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        {
            "<leader>ee",
            ":NvimTreeFindFileToggle<CR>",
            noremap = true,
            silent = true,
        },
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        local function on_attach(bufnr)
            local api = require("nvim-tree.api")
            local keymap = vim.keymap -- for conciseness

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            keymap.set("n", "l", api.node.open.edit, opts("Open"))
        end

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 50,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            on_attach = on_attach,
            filters = {
                git_ignored = false,
                dotfiles = false,
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        local opts = require("FaisalBudiono.util").create_opts

        keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", opts("Collapse file explorer"))
        keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", opts("Refresh file explorer"))
    end,
}
