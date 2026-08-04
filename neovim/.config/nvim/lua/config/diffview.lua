return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "Diff uncommitted changes" },
  },
  opts = {
    enhanced_diff_hl = true,
  },
}
