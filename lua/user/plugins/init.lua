local plugins = {
  "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "inkarkat/vim-ReplaceWithRegister",
}

local additionalPlugins = {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },

  {
    "folke/lsp-colors.nvim",
    enabled = true,
    opts = {
      setup = function()
        require("lsp-colors").setup({ -- Add this line for lsp-colors
          Error = "#F44747",
          Warning = "#FF8800",
          Hint = "#4FC1FF",
          Information = "#FFCC66",
        })
      end,
    },
  },
}

local allPlugins = {}
for _, plugin in ipairs(plugins) do
  table.insert(allPlugins, plugin)
end
for _, plugin in ipairs(additionalPlugins) do
  table.insert(allPlugins, plugin)
end

return allPlugins
