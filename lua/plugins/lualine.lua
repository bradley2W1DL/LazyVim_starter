return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Add searchcount to the statusline (right-hand side)
    table.insert(opts.sections.lualine_x, 1, {
      "searchcount",
      maxcount = 999,
      timeout = 500,
    })
  end,
}
