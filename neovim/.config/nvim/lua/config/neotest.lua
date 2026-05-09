return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        { "nvim-treesitter/nvim-treesitter", branch = "main" },
        "fredrikaverpil/neotest-golang",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
    },
    event = "VeryLazy",
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-golang")({}),
                -- Inline is broken
                -- require("neotest-jest")({
                --     jestCommand = "npm test --",
                --     cwd = function(path)
                --         return vim.fn.getcwd()
                --     end,
                -- }),
            },
            diagnostic = {
                enabled = true,
                severity = vim.diagnostic.severity.ERROR,
            },
        })

        vim.keymap.set("n", "<leader>et", function() neotest.output_panel.toggle() end, { desc = "Neotest output panel" })

        local test_patterns = {
            "*_test.go",
            -- "*.test.ts",
            -- "*.spec.ts",
            -- "*.test.js",
            -- "*.spec.js",
            -- "*.e2e-spec.ts",
            -- "*.test.tsx",
            -- "*.spec.tsx"
        }

        vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
            pattern = test_patterns,
            callback = function()
                neotest.run.run(vim.fn.expand("%"))
            end,
        })
    end,
}
