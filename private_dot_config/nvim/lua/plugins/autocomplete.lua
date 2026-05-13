vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1"),
  },
})

require("luasnip").setup()
require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = {
        border = "rounded",
      },
    },
    menu = {
      border = "rounded",
    },
  },
  snippets = { preset = "luasnip" },
  appearance = {
    nerd_font_variant = "normal",
  },
  signature = {
    enabled = true,
    window = { border = "single" },
  },
  sources = {
    default = { "lsp", "snippets", "path" },
    per_filetype = {
      puml = { "buffer" },
    },
  },
})
