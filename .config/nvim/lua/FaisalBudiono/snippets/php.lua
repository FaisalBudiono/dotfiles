local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local util = require("FaisalBudiono.util")

return {
    s(
        "cphp",
        fmt(
            [[
<?php

declare(strict_types=1);

namespace {};

class {}
{{
}}
            ]],
            {
                f(util.relative_path),
                f(util.file_name),
            }
        )
    ),

    s(
        "ctry",
        fmt(
            [[
    try {{
    }}catch(\Throwable $e){{
    }}
            ]],
            {}
        )
    ),

    s(
        "cctry",
        fmt(
            [[
    try {{

        $this->fail('Should throw error');
    }} catch (AssertionFailedError $e) {{
        throw $e;
    }}catch(\Throwable $e){{
    }}
            ]],
            {}
        )
    ),

    s(
        "catry",
        fmt(
            [[
    try {{
        {}
        return true;
    }}catch(ExpectationFailedException $e){{
         dump(
            $e->toString(),
            $e->getComparisonFailure(),
        );
        return false;
    }}catch(\Throwable $e){{
         dump($e);
        return false;
    }}
            ]],
            {i(0)}
        )
    ),

    s(
        "ctestcase",
        fmt(
            [[
/** 
 * @test 
 */
public function {}(): void 
{{
    //
}}
            ]],
            {i(0)}
        )
    ),
}
