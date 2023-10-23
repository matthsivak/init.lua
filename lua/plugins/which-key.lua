local wk = require("which-key")

wk.setup {
}

wk.register({
  ["/"] = { "<Plug>NERDCommenterToggle", "Toggle Comment" },
  ["<leader>"] = { "<cmd>source $MYVIMRC<cr>", "Reload config" },

  u = { "<cmd>UndotreeToggle<CR>", "Undotree" },
  T = {
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    F = {
      function()
        local input_string = vim.fn.input("Search For > ")
        if (input_string == '') then
          return
        end
        require("telescope.builtin").grep_string({
          search = input_string,
        })
      end, "Find in all files"
    }
  },
  l = {
    name = "LSP",
    f = { function() vim.lsp.buf.formatting() { async = true } end, "Format File" },
    d = { function() vim.lsp.buf.definition() end, "Go to definition" },
    k = { function() vim.lsp.buf.hover() end, "Hover action" },
    s = { function() vim.lsp.buf.workspace_symbol() end, "Workspace symbol" },
    F = { function() vim.diagnostic.open_float() end, "Open float" },
    c = { function() vim.lsp.buf.code_action() end, "Code action" },
    R = { function() vim.lsp.buf.references() end, "References" },
    r = { function() vim.lsp.buf.rename() end, "Rename" },
    S = { function() vim.lsp.buf.signature_help() end, "Signature help" },
    t = { "<cmd>TroubleToggle<cr>", "Trouble List" },
    D = { "<cmd>Neotree source=document_symbols position=current<cr>", "Document Symbols" },
    m = {
      [","] = { "<cmd>LspStart<cr>", "Lsp Start" },
      ["."] = { "<cmd>LspStop<cr>", "Lsp Stop" },
    }
  },
}, { prefix = "<leader>" })



wk.register({
  [","] = { "<cmd>Neotree reveal toggle source=last position=current<cr>", "Last Neotree" },
  ["-"] = { "<cmd>Neotree source=buffers position=current<cr>", "Buffers" },
  ["."] = { "<cmd>Neotree source=files position=current<cr>", "Files" },
}, {
  prefix = ",",
})

vim.api.nvim_set_keymap('n', '))', '<cmd>split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'úú', '<cmd>vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', { noremap = true })
