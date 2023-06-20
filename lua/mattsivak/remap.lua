vim.g.mapleader = " "

local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.setup {
}

wk.register({
  w = { "<cmd>HopWord<cr>", "Hop Word" },
  [","] = { "<Cmd>BufferPrevious<CR>", "Buffer Previous" },
  ["."] = { "<Cmd>BufferNext<CR>", "Buffer Next" },
  ["/"] = { "<Plug>NERDCommenterToggle", "Toggle Comment" },
  ["<leader>"] = { "<cmd>source $MYVIMRC<cr>", "Reload config" },

  h = {
    name = "Harpoon",
    a = { mark.add_file, "Add File" },
    t = { ui.toggle_quick_menu, "Toggle Quick Menu" }
  },

  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    e = { "<cmd>NeoTreeFloatToggle<cr>", "Neo Tree" },
    w = { "<cmd>w<cr>", "Write file" },
    u = { "<cmd>UndotreeToggle<cr>", "Undotree Toggle" },
    c = { "<cmd>CloakToggle<cr>", "Cloak Toggle" },
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
  },
  p = {
    name = "Plugins",
    s = { "<cmd>so<cr><cmd>PackerSync<cr>", "so and PackerSync" },
    m = { "<cmd>Mason<cr>", "Mason" },
    t = { "<cmd>TransparentToggle<cr>", "Transparent" },
  },
  t = {
    name = "Term",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
  },
  b = {
    name = "Barbar",
    s = { "<Cmd>BufferOrderByDirectory<CR>", "Sort" }

  }
}, { prefix = "<leader>" })

vim.api.nvim_set_keymap('n', '..', '<cmd>NeoTreeFloatToggle<cr>', { silent = true })
vim.api.nvim_set_keymap('n', ',,', '<cmd>Telescope find_files<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '--', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true })
