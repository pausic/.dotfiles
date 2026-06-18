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
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", bufopts, { desc = "Go to declaration" }))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", bufopts, { desc = "Go to definition" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", bufopts, { desc = "Hover info" }))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", bufopts, { desc = "Go to implementation" }))
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", bufopts, { desc = "Add workspace folder" }))
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", bufopts, { desc = "Remove workspace folder" }))
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", bufopts, { desc = "List workspace folders" }))
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", bufopts, { desc = "Type definition" }))
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("force", bufopts, { desc = "Rename symbol" }))
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", bufopts, { desc = "Code action" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", bufopts, { desc = "Find references" }))
    vim.keymap.set("n", "<space>y", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", bufopts, { desc = "Format file" }))
  end,
})

-- Add lsp-file-operations capabilities to all servers
local lsp_caps = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("lsp-file-operations").default_capabilities()
)

-- Configure each language
vim.lsp.config("pylsp", { capabilities = lsp_caps })
vim.lsp.config("lua_ls", { capabilities = lsp_caps })
vim.lsp.config("gopls", {
  capabilities = lsp_caps,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
vim.lsp.config("ts_ls", {
  capabilities = lsp_caps,
  settings = {
    typescript = {
      tsserver = {
        noWarnOnMultipleProjects = true,
      },
    },
  },
})
vim.lsp.config("clangd", { capabilities = lsp_caps })

vim.lsp.enable({ "pylsp", "lua_ls", "gopls", "ts_ls", "clangd" })
