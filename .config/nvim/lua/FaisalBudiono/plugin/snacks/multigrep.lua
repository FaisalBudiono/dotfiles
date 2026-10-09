local M = {}

--- @param extra_args ?string[]
M.rg_picker = function(extra_args)
    Snacks.picker.pick({
        source = "rg_multigrep",
        title = "Multi Grep",
        live = true, -- re-run finder on every keystroke
        supports_live = true,
        show_empty = true,
        format = "file", -- renders file:line + highlights
        preview = "file", -- previews file at the match position

        finder = function(opts, ctx)
            local pattern = ctx.filter.search
            if pattern == "" then
                return function() end -- nothing to show yet
            end

            local cmd = {
                "rg",
                "--vimgrep",
                "--no-heading",
                "--smart-case",
                "--max-columns=300",
                "--max-columns-preview",
                "-g",
                "!.git",
            }
            vim.list_extend(cmd, extra_args or {})

            local pieces = vim.split(pattern, "  ")

            if pieces[2] then
                vim.list_extend(cmd, { "-g", pieces[2] })
            end

            vim.list_extend(cmd, { "--", pieces[1] })

            local res = vim.system(cmd, { text = true }):wait()
            --- @type snacks.picker.finder.Item[]
            local items = {}

            for line in vim.gsplit(res.stdout, "\n", { trimempty = true }) do
                local file, lnum, col, text = line:match("^(.-):(%d+):(%d+):(.*)$")
                if file then
                    items[#items + 1] = {
                        text = file .. " " .. text,
                        file = file,
                        pos = { tonumber(lnum), tonumber(col) - 1 },
                        comment = text,
                    }
                end
            end

            return items
        end,
    })
end

return M
