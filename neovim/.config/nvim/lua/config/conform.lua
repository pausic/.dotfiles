return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>pf",
      function()
        require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format file or range (in visual mode)",
    },
  },
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
        kotlin = { "ktlint" },
        markdown = { "prettierd" },
        html = { "prettierd" },
        bash = { "beautysh" },
        proto = { "buf" },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
        css = { "prettierd" },
        dart = { "dart_format" },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 3000,
      },
    })
  end,
}
