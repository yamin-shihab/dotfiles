-- Autocompletion using LSP and snippets
vim.g.coq_settings = {
    display = {
        ghost_text = { context = { "  ", "  " } },
        icons = { mode = "none" },
        preview = { border = "single" },
        pum = { ellipsis = "...", source_context = { "<", ">" } },
    },
}
vim.cmd("COQnow -s")
