local max_filesize = 50 * 1024 -- 50 KB

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({})

        -- Install parsers (replaces ensure_installed)
        local ensure_installed = {
            "bash",
            "comment",
            "dart",
            "dockerfile",
            "go",
            "gomod",
            "gosum",
            "helm",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "regex",
            "sql",
            "templ",
            "terraform",
            "tsx",
            "typescript",
            "yaml",
        }
        require("nvim-treesitter").install(ensure_installed)

        -- Highlighting with big-file guard
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                if ok and stats and stats.size > max_filesize then
                    return
                end
                pcall(vim.treesitter.start, args.buf)
            end,
        })

        -- Custom parser: gotmpl
        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
                require("nvim-treesitter.parsers").gotmpl = {
                    install_info = {
                        url = "https://github.com/ngalaiko/tree-sitter-go-template",
                    },
                    tier = 2,
                }
            end,
        })
        vim.treesitter.language.register("gotmpl", { "gohtmltmpl", "gotexttmpl", "gotmpl" })
    end,
}
