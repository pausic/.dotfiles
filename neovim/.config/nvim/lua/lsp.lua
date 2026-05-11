require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = {
    "pylsp",
    "lua_ls",
    "rust_analyzer",
    "bashls",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "kotlin_language_server",
    "terraformls",
    "ts_ls",
    "gopls",
    "clangd",
  },
})

-- Customized on_attach function
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>d", vim.diagnostic.setloclist, opts)

vim.fn.sign_define("DiagnosticSignError", { text = "󰅚", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "󰀪", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "󰋽", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      local icons = { " ", " ", " ", " " }
      return icons[diagnostic.severity]
    end,
  },
  signs = false,
  virtual_lines = false,
  underline = true,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local navbuddy = require("nvim-navbuddy")
    local navic = require("nvim-navic")
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("force", bufopts, { desc = "Rename symbol" }))
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>y", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)
  end,
})

-- Configure each language
vim.lsp.config("pylsp", {})
vim.lsp.config("lua_ls", {})
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      tsserver = {
        noWarnOnMultipleProjects = true,
      },
    },
  },
})
vim.lsp.config("clangd", {})

vim.lsp.enable({ "pylsp", "lua_ls", "gopls", "ts_ls", "clangd" })
