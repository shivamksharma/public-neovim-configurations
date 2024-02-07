return {
  "akinsho/bufferline.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "tabs",
        separator_style = "default",
        style_preset = bufferline.style_preset.no_italic,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    })
  end,
}
