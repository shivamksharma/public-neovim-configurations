return {
  "folke/trouble.nvim", -- Plugin name
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    position = "bottom", -- Position of the list: bottom, top, left, right
    icons = true, -- Use devicons for filenames
    mode = "document_diagnostics", -- Set default mode: "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- Icon used for open folds
    fold_closed = "", -- Icon used for closed folds
    group = true, -- Group results by file
    padding = true, -- Add an extra new line on top of the list
    action_keys = { -- Key mappings for actions in the trouble list
      close = "q", -- Close the list
      cancel = { "ć", "Ć" }, -- Cancel the preview and get back to your last window / buffer / cursor
      refresh = "r", -- Manually refresh
      jump = { "<cr>", "<tab>" }, -- Jump to the diagnostic or open / close folds
      toggle_mode = "m", -- Toggle between "workspace" and "document" diagnostics mode
      toggle_preview = "P", -- Toggle auto_preview
      hover = "H", -- Open a small popup with the full multiline message
      preview = "p", -- Preview the diagnostic location
      close_folds = { "zM", "zm" }, -- Close all folds
      open_folds = { "zR", "zr" }, -- Open all folds
      toggle_fold = { "zA", "za" }, -- Toggle fold of current file
      previous = "l", -- Preview item
      next = "k", -- Next item
    },
    indent_lines = true, -- Add an indent guide below the fold icons
    auto_open = false, -- Automatically open the list when you have diagnostics
    auto_close = false, -- Automatically close the list when you have no diagnostics
    auto_preview = true, -- Automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- Automatically fold a file trouble list at creation
    signs = { -- Icons / text used for diagnostics
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠",
    },
    use_diagnostic_signs = true, -- Enabling this will use the signs defined in your LSP client
    keys = { -- Key mappings for trouble.nvim
      ["<leader>T"] = "<cmd>TroubleToggle document_diagnostics<cr>",
      ["<leader>xX"] = "<cmd>TroubleToggle workspace_diagnostics<cr>",
      ["<leader>xL"] = "<cmd>TroubleToggle loclist<cr>",
      ["<leader>xq"] = "<cmd>TroubleToggle quickfix<cr>",
      ["[q"] = function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      ["]q"] = function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
    },
  },
}
