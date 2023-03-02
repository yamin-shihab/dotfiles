-- Autocompletion using LSP and snippets
vim.g.coq_settings = {
    auto_start = "shut-up",
    display = {
        ghost_text = { context = { "  ", "  " } },
        icons = { mode = "none" },
        preview = { border = "single" },
        pum = { ellipsis = "...", source_context = { "<", ">" } },
    },
}
