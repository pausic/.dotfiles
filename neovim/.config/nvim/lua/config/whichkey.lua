return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      spec = {
        { "<leader>f", group = "Find (picker)" },
        { "<leader>T", group = "Trouble" },
        { "<leader>r", group = "Refactor / Replace" },
        { "<leader>d", group = "Diff / Diagnostics" },
        { "<leader>W", group = "LSP Workspace" },
        { "<leader>z", group = "Terminal" },
        { "<leader>l", group = "Git / Lint" },
        { "<leader>o", group = "Open" },
        { "<leader>n", group = "Notifications" },
        { "<leader>b", group = "Navbuddy" },
        { "<leader>N", group = "Neotest" },
      },
    })
  end,
}
