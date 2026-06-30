local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.symbol_search = function(opts)
    opts = opts or {}

    vim.lsp.buf.document_symbol({
        on_list = function(lopts)
            local kindMap = {}

            for _, value in ipairs(lopts.items) do
                local kind = value.kind
                kindMap[string.lower(kind)] = true
            end

            local kinds = {}
            for kind, _ in pairs(kindMap) do
                table.insert(kinds, { kind })
            end

            pickers
                .new(opts, {
                    prompt_title = "colors",
                    finder = finders.new_table({
                        results = kinds,
                        entry_maker = function(entry)
                            return {
                                value = entry,
                                display = entry[1],
                                ordinal = entry[1],
                            }
                        end,
                    }),
                    sorter = conf.generic_sorter(opts),
                    attach_mappings = function(prompt_bufnr, map)
                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                            local selection = action_state.get_selected_entry()

                            local selected = selection.value[1]

                            require("telescope.builtin").lsp_document_symbols({
                                symbols = { selected },
                            })
                        end)
                        return true
                    end,
                })
                :find()
        end,
    })
end

M.setup = function() end

return M
