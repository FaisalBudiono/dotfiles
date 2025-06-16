local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
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

    s(
        "custate",
        fmt(
            [[
const [{}, set{}] = useState()
            ]],
            {
                i(1, "stateName"),
                f(function(val)
                    local stateName = val[1][1]

                    return stateName:sub(1, 1):upper() .. stateName:sub(2, -1)
                end, { 1 }),
            }
        )
    ),

    s(
        "ctime",
        fmt(
            [[
console.time('{}')
console.timeEnd('{}')
            ]],
            {
                i(1, "timerName"),
                f(function(val)
                    local timerName = val[1][1]

                    return timerName
                end, { 1 }),
            }
        )
    ),
}
