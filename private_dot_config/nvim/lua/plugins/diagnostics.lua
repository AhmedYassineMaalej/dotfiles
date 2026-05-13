vim.pack.add({
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

local inline_diagnostics = require("tiny-inline-diagnostic")

inline_diagnostics.setup({
  transparent_bg = true,
  options = {
    multilines = {
      enabled = true,
    },
  },
})
