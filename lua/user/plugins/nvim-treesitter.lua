local setup_treesitter = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({
        -- enable syntax highlighting
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "astro",
          "json",
          "http",
          "sql",
          "javascript",
          "jsdoc",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "luap",
          "vim",
          "vimdoc",
          "dockerfile",
          "gitignore",
          "query",
          "cmake",
          "bash",
          "c",
          "cpp",
          "go",
          "lua",
          "rust",
          "python",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- Setting up nvim-ts-context-commentstring with new setup method
      require("ts_context_commentstring").setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },
}

return setup_treesitter
