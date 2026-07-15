return {
  "nvim-flutter/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = vim.fn.expand("~/fvm/default/bin/flutter"),
    })

    -- flutter-tools' dartls attach (its ftplugin/dart) is a guarded one-shot
    -- that can no-op on a race; re-drive attach() on every dart FileType.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dart",
      callback = function()
        require("flutter-tools.lsp").attach()
      end,
    })
  end,
}
