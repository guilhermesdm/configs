local keymap = vim.keymap.set
local silent = { silent = true }

-- Dont yank when using p
keymap("v", "p", '"_dP', { remap = false })

-- File actions
keymap("n", "<leader>w", vim.cmd.w, { desc = "Save" })
keymap("n", "<leader>q", vim.cmd.exit, { desc = "Exit" })

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua Snacks.bufdelete()<CR>", silent)

-- LSP
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)

-- GIT
keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Gitsigns | Blame Line" }, silent)
keymap("n", "<leader>gc", "<cmd>Neogit<CR>", { desc = "Opens Neogit" }, silent)
