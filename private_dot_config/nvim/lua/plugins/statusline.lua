vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
})

local lualine = require("lualine")

lualine.setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "branch", "diff" },
    lualine_z = { "location" },
  },
  extensions = {
    "nvim-tree",
  },
})
