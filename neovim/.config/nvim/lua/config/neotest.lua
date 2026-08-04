return {
    "nvim-neotest/neotest",
    -- Disabled // Very troublesome
    enabled = false,
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

        -- Ignore Ginkgo suites: specs are closures, so they collapse into a
        -- single RunSpecs node that boots envtest when run.
        local golang = require("neotest-golang")({})
        local is_test = golang.is_test_file
        golang.is_test_file = function(path)
            if not is_test(path) then return false end
            local ok, lines = pcall(vim.fn.readfile, path, "", 40)
            return not (ok and table.concat(lines):find("onsi/ginkgo", 1, true))
        end

        neotest.setup({
            adapters = {
                golang,
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

        vim.keymap.set("n", "<leader>Nt", function() neotest.output_panel.toggle() end, { desc = "Neotest output panel" })

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
