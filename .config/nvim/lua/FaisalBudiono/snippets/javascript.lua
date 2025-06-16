local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local util = require("FaisalBudiono.util")

return {
    s(
        "cbug",
        fmt(
            [[
console.debug('kambing', {})
            ]],
            {
                i(0),
            }
        )
    ),
}
