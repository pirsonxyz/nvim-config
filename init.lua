-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:crashdummyy/mason-registry",
  },
})
local lspconfig = require("lspconfig")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
    -- Add more keybindings as needed
  end,
})
-- that's crazy
vim.g.lazyvim_check_order = false
vim.keymap.set("n", "<leader>te", ":tabnew | term<CR>")
vim.opt.clipboard = "unnamed,unnamedplus"
