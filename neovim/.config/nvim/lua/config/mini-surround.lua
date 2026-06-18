return {
  "echasnovski/mini.surround",
  version = false,
  event = "VeryLazy",
  config = function()
    -- vim `s` eat keystroke before `sa`/`sd`/`sr` reach mini.surround. no more. (`s` is just `cl`)
    vim.keymap.set({ "n", "x" }, "s", "<Nop>")

    require("mini.surround").setup({
      search_method = "cover",
      n_lines = 10000,
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",

        suffix_last = "l",
        suffix_next = "n",
      },
    })
  end,
}
