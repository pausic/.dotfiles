return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>dd", "<cmd>DiffviewOpen origin/master<cr>", desc = "Diff against master" },
  },
}
