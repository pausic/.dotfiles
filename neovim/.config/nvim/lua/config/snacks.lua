return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        -- pick = "telescope.nvim", -- migrated to snacks.picker
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = function()
              Snacks.picker.files()
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function()
              Snacks.picker.recent()
            end,
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = function()
              Snacks.picker.grep()
            end,
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function()
              Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        },
        header = require("dashboard-header"),
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { icon = "", desc = "File tree", padding = 1, key = "t", action = ":Neotree toggle" },
        {
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        { section = "startup" },
      },
    },
    gitbrowse = {
      url_patterns = {
        [".*"] = {
          branch = "/tree/{branch}",
          file = "/blob/{branch}/{file}#L{line_start}-L{line_end}",
          permalink = "/blob/{commit}/{file}#L{line_start}-L{line_end}",
          commit = "/commit/{commit}",
        },
      },
    },
    indent = {
      animate = {
        duration = 2, -- ms per step
        easing = "linear",
        fps = 160, -- frames per second. Global setting for all animations
      },
    },
    input = { enabled = false },
    lazygit = { configure = true },
    terminal = {
      win = {
        wo = { winbar = "" },
      },
      auto_insert = false,
    },
    picker = {
      prompt = "",
      enabled = true,
      reverse = true,
      layout = {
        layout = {
          box = "horizontal",
          backdrop = false,
          width = 0.8,
          height = 0.9,
          {
            box = "vertical",
            {
              win = "list",
              title = " Results ",
              title_pos = "center",
              border = "rounded",
              wo = { winhighlight = "FloatBorder:NormalFloat" },
            },
            {
              win = "input",
              height = 1,
              title_pos = "center",
              border = "rounded",
              wo = { winhighlight = "FloatBorder:NormalFloat" },
            },
          },
          {
            win = "preview",
            title = "{preview:Preview}",
            width = 0.45,
            border = "rounded",
            title_pos = "center",
            wo = { winhighlight = "FloatBorder:NormalFloat" },
          },
        },
      },
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = { ".git/", "yarn.lock", "pnpm-lock.yaml", ".yarn/", "node_modules/", "dist/", "coverage/", ".jj/" },
        },
        grep = {
          hidden = true,
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      animate = {
        duration = { step = 5, total = 250 },
        easing = "linear",
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 5, total = 50 },
        easing = "linear",
      },
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
