vim.pack.add({
  "https://github.com/nvim-mini/mini.indentscope",
  {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("4.x"),
  },
  "https://github.com/windwp/nvim-autopairs",
})

local indentscope = require("mini.indentscope")

indentscope.setup({
  symbol = "│",
  options = {
    border = "top", -- allow it to work with python indentation
    try_as_border = true,
  },
})

local autopairs = require("nvim-autopairs")

autopairs.setup()

local surround = require("nvim-surround")
surround.setup()
