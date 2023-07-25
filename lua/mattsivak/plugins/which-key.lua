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
  T = {
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
  },
  f = {
    name = "File",
    w = { "<cmd>w<cr>", "Write file" },
    u = { "<cmd>UndotreeToggle<cr>", "Undotree Toggle" },
    c = { "<cmd>CloakToggle<cr>", "Cloak Toggle" },
    r = { "<cmd>qa<cr>", "Find Recent" }
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
    t = { "<cmd>TroubleToggle<cr>", "Trouble list" }
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
    ["1"] = { "<cmd>ToggleTerm 1<cr>", "Terminal" },
    ["2"] = { "<cmd>ToggleTerm 2<cr>", "Terminal" },
    ["3"] = { "<cmd>ToggleTerm 3<cr>", "Terminal" },
    ["4"] = { "<cmd>ToggleTerm 4<cr>", "Terminal" },
  },
  b = {
    name = "Barbar",
    s = { "<Cmd>BufferOrderByDirectory<CR>", "Sort" }

  }
}, { prefix = "<leader>" })

wk.register({
  [","] = { "<cmd>Telescope find_files<cr>", "Find Files" },
  ["."] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  ["-"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
  ["h"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
}, {
  prefix = ","
})

wk.register({
  ["-"] = { "<cmd>Neotree<cr>", "Neo Tree" },
  [","] = { "<cmd>NeoTreeFloatToggle<cr>", "Neo Tree Float" },
}, {
  prefix = "-",
})

wk.register({
  ["."] = { ui.toggle_quick_menu, "Harpoon List" },
  ["ů"] = { mark.add_file, "Add File" },
  [","] = { ui.nav_prev, "Previous" },
  ["-"] = { ui.nav_next, "Next" }
}, {
  prefix = ".",
})

vim.api.nvim_set_keymap('n', '))', '<cmd>split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'úú', '<cmd>vsplit<CR>', { noremap = true })
