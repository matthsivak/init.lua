local alpha = require("alpha")
local theme = require("alpha.themes.theta")
local dashboard = require("alpha.themes.dashboard")
local if_nil = vim.F.if_nil



local default_header = {
  type = "text",
  val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 3,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "New file", "<cmd>ene<CR>"),
    button("SPC f f", "Find File"),
    button("SPC f b", "Find Buffer"),
    button("SPC f e", "Neo Tree"),
    button("SPC f u", "Undo Tree"),
    button("SPC f r", "Recent", ":Telescope oldfiles<CR>"),
    button("q", "Quit NVIM", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local fortune = require("alpha.fortune")

local config = {
  layout = {
    { type = "padding", val = 2 },
    default_header,
    {
      type = "text",
      val = fortune(),
      opts = {
        position = "center",
        hl = "Number",
      },
    },
    { type = "padding", val = 2 },
    buttons,
  },
  opts = {
    margin = 5,
  },
}

-- Send config to alpha
alpha.setup(config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
