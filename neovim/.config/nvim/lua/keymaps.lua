-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
--vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Window navigate left" })
--vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Window navigate down" })
--vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Window navigate up" })
--vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Window navigate right" })
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize window up" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize window down" })
vim.keymap.set(
  "n",
  "<C-Left>",
  ":vertical resize -2<CR>",
  { noremap = true, silent = true, desc = "Resize window left" }
)
vim.keymap.set(
  "n",
  "<C-Right>",
  ":vertical resize +2<CR>",
  { noremap = true, silent = true, desc = "Resize window right" }
)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
vim.keymap.set("n", "<leader>t", "<Cmd>:Neotree toggle<CR>", { desc = "[T]oggle Neotree" })

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left & reselect" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right & reselect" })

-- Basic
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Write buffer" })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit nvim" })
vim.keymap.set("n", "<leader>v", function()
  vim.cmd("vsplit")
end, { desc = "Vertical split with same buffer" })
vim.keymap.set("n", "<leader>h", function()
  vim.cmd("split")
end, { desc = "Horizontal split with same buffer" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true, desc = "Delete without yank" })
vim.keymap.set({ "n", "v" }, "<Del>", '"_x', { noremap = true, silent = true, desc = "Delete without yank" })

-- buffers
vim.api.nvim_set_keymap("n", "<C-p>", ":bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.api.nvim_set_keymap("n", "<C-n>", ":bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.api.nvim_set_keymap("n", "<Leader>c", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope definitions" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope references" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope treesitter" })
vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Telescope git_status" })
vim.keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list, { desc = "Telescope zoxide" })

-- navbuddy
local navbuddy = require("nvim-navbuddy")
vim.keymap.set("n", "<leader>bc", navbuddy.open, { desc = "Open Navbuddy" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<cmd>stopinsert<CR>", { desc = "Exit terminal mode" })

--Snacks
vim.keymap.set("n", "<leader>lg", function()
  return Snacks.lazygit()
end, { desc = "LazyGit" })
vim.keymap.set("n", "<leader>zh", function()
  Snacks.terminal(nil, { win = { position = "bottom" } })
end, { desc = "Toggle terminal (horizontal)" })
vim.keymap.set("n", "<leader>zv", function()
  Snacks.terminal(nil, { win = { position = "right" } })
end, { desc = "Toggle terminal (vertical)" })
