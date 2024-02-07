return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn", color = "green" },
        change = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
          color = "blue",
        },
        delete = {
          hl = "GitSignsDelete",
          text = "-",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
          color = "red",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = "-",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
          color = "red",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
          color = "blue",
        },
        untracked = {
          hl = "GitSignsAdd",
          text = "┆",
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
          color = "green",
        },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
    keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
    keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
    keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
    keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
    keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage buffer" })
    keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
    keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
    keymap.set("n", "<leader>hb", "<cmd>lua require('gitsigns').bl", { desc = "Blame" })
    keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
    keymap.set("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })
  end,
}
