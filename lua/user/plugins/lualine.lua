return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        ignore_focus = {},
        always_divide_middle = true,
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diff",
            colored = true,
            diff_color = {
              added = { fg = "#98c379" },
              modified = { fg = "#ff9e64" },
              removed = { fg = "#e06c75" },
            },
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_c = {
          "filename",
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "hint", "info" },
            symbols = { error = " ", warn = " ", hint = " ", info = " " },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          -- { "fileformat" },
          {
            function()
              local current_line = vim.fn.line(".")
              local total_lines = vim.fn.line("$")
              return string.format(" %d/%d", current_line, total_lines)
            end,
            color = { fg = "nil", gui = "bold" },
          },
          {
            "filetype",
            icon_only = false,
            separator = "",
            {
              function()
                local msg = "No LSP"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()

                if next(clients) == nil then
                  return msg
                end

                -- Check for utility buffers
                for ft in non_language_ft do
                  if ft:match(buf_ft) then
                    return ""
                  end
                end

                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes

                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    -- return 'LSP:'..client.name  -- Return LSP name
                    return "" -- Only display if no LSP is found
                  end
                end

                return msg
              end,
              color = { fg = "nil", gui = "bold" },
            },
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "quickfix" },
      winbar = {},
      inactive_winbar = {},
    })
  end,
}
