vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})

local nvim_tree = require("nvim-tree")

nvim_tree.setup({
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "✖",
        },
      },
    },
  },
  view = {
    adaptive_size = true,
  },
})
