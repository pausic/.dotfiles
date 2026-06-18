return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.formatters.jq = {
      append_args = { "--indent", "2" },
    }

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "jq" },
        graphql = { "prettierd" },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        markdown = { "prettierd" },
        html = { "prettierd" },
        bash = { "beautysh" },
        proto = { "buf" },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
        css = { "prettierd" },
        dart = { "prettierd" },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>pf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
