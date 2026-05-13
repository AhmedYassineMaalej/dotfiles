-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Update terminal title to include mode
local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "VISUAL",
  s = "VISUAL",
  S = "VISUAL",
  c = "COMMAND",
  t = "TERMINAL",
  R = "REPLACE",
}

vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter", "WinEnter", "TabEnter" }, {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local title = "nvim"
    local bufname = vim.fn.bufname()
    if bufname ~= "" then
      title = title .. " - " .. bufname
    end
    local mode_string = modes[mode]
    if mode_string ~= nil then
      title = title .. " | " .. mode_string
    end
    vim.opt.titlestring = title
  end,
})

-- Highlight references of the word under cursor
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp-highlights", { clear = true }),
--   callback = function(event)
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--     if
--       client == nil or not client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
--     then
--       return
--     end
--     local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlights", { clear = false })
--     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--       buffer = event.buf,
--       group = highlight_augroup,
--       callback = vim.lsp.buf.document_highlight,
--     })
--
--     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--       buffer = event.buf,
--       group = highlight_augroup,
--       callback = vim.lsp.buf.clear_references,
--     })
--
--     vim.api.nvim_create_autocmd("LspDetach", {
--       group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
--       callback = function(event2)
--         vim.lsp.buf.clear_references()
--         vim.api.nvim_clear_autocmds({ group = "lsp-highlights", buffer = event2.buf })
--       end,
--     })
--   end,
-- })
