vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
  clangd = {},
  pyright = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        },
        check = {
          command = "clippy",
        },
      },
    },
  },
  tinymist = {},
  phpactor = {},
  html = {
    filetypes = { "html", "php" },
  },
  emmet_ls = {},
  cssls = {},
  ts_ls = {},
}

local mason = require("mason")
mason.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink-cmp").get_lsp_capabilities(capabilities) --- @diagnostic disable-line: redefined-local
for server, config in pairs(servers) do
  config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

vim.lsp.inline_completion.enable()

-- Make hover windows bordered
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end)
