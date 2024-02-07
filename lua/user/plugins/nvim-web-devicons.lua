return {
  "nvim-tree/nvim-web-devicons", -- Plugin name
  enabled = true,
  config = function() -- Configuration function for the plugin
    require("nvim-web-devicons").setup({
      color = true,
      default = true, -- Enable the default icons for unknown filetypes
      color_icons = true,
      override = {
        bash = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Bash",
        },
      },
      override_by_filename = {
        [".bash_aliases"] = {
          icon = "",
          color = "#428850",
          name = "BashAliases",
        },
        [".bashrc"] = {
          icon = "",
          color = "#428850",
          name = "Bashrc",
        },
        ["gitignore"] = {
          icon = "",
          color = "#428850",
          name = "Gitignore",
        },
      },
      override_by_name = {
        ["README.md"] = {
          icon = "",
          color = "#428850",
          name = "Readme",
        },
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log",
        },
      },
    })
  end,
}
