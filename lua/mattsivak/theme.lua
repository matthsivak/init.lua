require("nightly").setup({
  transparent = true,
  styles = {
    comments = { italic = true },
    functions = { italic = false },
    variables = { italic = false },
    keywords = { italic = false },
  },
})

function ColorMyNvim(color)
  color = color or "nightly"

  vim.cmd.colorscheme(color)
  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyNvim()
