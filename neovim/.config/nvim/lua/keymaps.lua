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
vim.api.nvim_set_keymap("n", "<Leader>x", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- picker (snacks.picker)
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.lsp_definitions() end, { desc = "LSP definitions" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.lsp_references() end, { desc = "LSP references" })
vim.keymap.set("n", "<leader>ft", function() Snacks.picker.treesitter() end, { desc = "Treesitter symbols" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.git_status() end, { desc = "Git status" })
vim.keymap.set("n", "<leader>fz", function() Snacks.picker.zoxide() end, { desc = "Zoxide" })

-- navbuddy
local navbuddy = require("nvim-navbuddy")
vim.keymap.set("n", "<leader>bc", navbuddy.open, { desc = "Open Navbuddy" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<cmd>stopinsert<CR>", { desc = "Exit terminal mode" })

--Snacks
vim.keymap.set({ "n", "v" }, "<leader>ol", function()
  Snacks.gitbrowse({ what = "file" })
end, { desc = "Open line in repo" })

vim.keymap.set("n", "<leader>lg", function()
  return Snacks.lazygit()
end, { desc = "LazyGit" })
vim.keymap.set("n", "<leader>zh", function()
  Snacks.terminal(nil, { win = { position = "bottom" } })
end, { desc = "Toggle terminal (horizontal)" })
vim.keymap.set("n", "<leader>zv", function()
  Snacks.terminal(nil, { win = { position = "right" } })
end, { desc = "Toggle terminal (vertical)" })
