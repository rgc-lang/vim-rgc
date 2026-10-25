-- Example: configure Neovim's built-in LSP client for RGC.
-- Requires Neovim >= 0.11 (or use the equivalent vim.lsp.start setup on older versions).
--
-- Add this to your Neovim config:

vim.filetype.add({ extension = { rg = "rgc" } })

vim.lsp.config.rgc = {
  cmd = { "rgc", "lsp", "--stdio" },
  filetypes = { "rgc" },
  root_markers = { "rack.toml", ".git" },
  settings = {},
}

vim.lsp.enable("rgc")

-- Keymaps (optional):
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rgc",
--   callback = function()
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
--     vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true })
--   end,
-- })