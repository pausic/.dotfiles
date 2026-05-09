return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        { "lewis6991/async.nvim" },
        { "nvim-treesitter/nvim-treesitter", branch = "main" },
    },

    event = "VeryLazy",
    config = function()
        require("refactoring").setup({})

        -- remap to open the Telescope refactoring menu in visual mode
        vim.api.nvim_set_keymap(
            "v",
            "<leader>rr",
            "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
            { noremap = true }
        )
    end,
}
