vim.api.nvim_create_autocmd("BufWritePre", { command = "lua vim.lsp.buf.format()" })
