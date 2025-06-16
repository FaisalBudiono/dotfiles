return {
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "markdown",
        "rescript",
        "sass",
        "scss",
        "svelte",
        "templ",
        "typescript",
        "typescriptreact",
    },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                    { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
            },
        },
    },
}
