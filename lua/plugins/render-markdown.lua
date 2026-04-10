-- Some basic styling overrides for the LazyExtra markdown rendering
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      icons = { "󰇊 ", "󰇋 ", "󰇌 ", "󰇍 ", "󰇎 ", "󰇏 " },
      -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      position = "inline",
      left_pad = 1,
      left_margin = 0,
      width = { "block" },
      min_width = 121,
    },
  },
}
