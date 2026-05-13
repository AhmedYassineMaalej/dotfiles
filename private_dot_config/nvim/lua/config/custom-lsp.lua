vim.lsp.config("Sage", {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 7878),
  filetypes = { "markdown" },
  root_dir = vim.fn.getcwd(),
  settings = {},
})

vim.lsp.enable("Sage")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function()
        local line = vim.fn.line(".")
        local col = vim.fn.col(".")
        client:notify("document/cursorMove", { col = col, line = line }, function() end)
      end,
    })
  end,
})
