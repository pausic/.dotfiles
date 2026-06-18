return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        { "lewis6991/async.nvim" },
        { "nvim-treesitter/nvim-treesitter", branch = "main" },
    },

    event = "VeryLazy",
    config = function()
        require("refactoring").setup({})

        -- refactoring menu in visual mode (uses vim.ui.select → snacks.input)
        vim.keymap.set("v", "<leader>rr", function()
            require("refactoring").select_refactor()
        end, { noremap = true, desc = "Refactor menu" })
    end,
}
