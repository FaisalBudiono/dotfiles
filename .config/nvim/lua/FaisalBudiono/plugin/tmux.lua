return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
    },
    keys = {
        {
            "<c-h>",
            ":TmuxNavigateLeft<cr>",
            noremap = true,
            silent = true,
            desc = "TMUX left",
        },
        {
            "<c-j>",
            ":TmuxNavigateDown<cr>",
            noremap = true,
            silent = true,
            desc = "TMUX down",
        },
        {
            "<c-k>",
            ":TmuxNavigateUp<cr>",
            noremap = true,
            silent = true,
            desc = "TMUX up",
        },
        {
            "<c-l>",
            ":TmuxNavigateRight<cr>",
            noremap = true,
            silent = true,
            desc = "TMUX right",
        },
    },
}
