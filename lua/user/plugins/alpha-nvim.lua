return {
  "goolord/alpha-nvim",
  enabled = true,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█",
      "░█░█░█▀▀░█░█░▀▄▀░░█░░█░█",
      "░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀",
    }

    -- Set Menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("fs", "󰈭  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("L", "󰒲  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("fo", "󰈚  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("wr", "󰁯  Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
