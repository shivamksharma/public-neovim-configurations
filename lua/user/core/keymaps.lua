local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

-- Leader Key
vim.g.mapleader = " "

-- Save with SUDO permission in command mode
vim.cmd("cmap w!! w !sudo tee > /dev/null %")

-- Allow files to saved as root when start without SUDO
keymap.set("c", "w!!", "w !sudo tee > /dev/null %")

-- Deactivate Arrow Keys in <NORMAL MODE>
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")

-- Copy from Clipboard
vim.api.nvim_set_keymap("v", "<C-c>", ":w !xclip -i -selection clipboard<CR>", { noremap = true })

-- preserve buffer as you paste (do with <leader>p instead of only p when pasting)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without losing buffer" })

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disabled Auto-Commenting New Lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=cro",
})

-- Fast saving with <leader>s
keymap.set("n", "<leader>s", ":w<CR>", {})
-- keymap.set('i', '<leader>s', '<ESC>:w<CR><Insert>')

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- Open file under cursor in new tab
keymap.set("n", "gf", "<cmd>tabnew <cfile><CR>", { desc = "Open file under cursor in new tab" })

-- Open file under cursor in new vertically window
-- keymap.set("n", "gF", "<cmd>vs <cfile><CR>", { desc = "Open file under cursor in new vertically window" })
keymap.set("n", "<C-W><C-S-F>", "<C-W>vgF", { desc = "Open file under cursor in new vertically window" })

-- Create and Open file under cursor if not exist
keymap.set("n", "gf", "<cmd>tabnew <cfile><CR>", { desc = "Create file under cursor if not exist" })

-- Open url under cursor in default browser
-- keymap.set("n", "gx", "<cmd>!xdg-open <cfile><CR>", { desc = "Open url under cursor in browser" })

-- Disable inline error messages
-- vim.diagnostic.config({
--   virtual_text = false,
--   underline = false,
--   signs = true,
-- })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- tab management
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tm", "<cmd>tabmove %<CR>", { desc = "Move current buffer to new tab" }) -- move current buffer
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs, keep current" }) -- close the current tab

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Window navigation
keymap.set("n", "<Leader>h", "<C-w>h", { desc = "Move left" })
keymap.set("n", "<Leader>k", "<C-w>k", { desc = "Move up" })
keymap.set("n", "<Leader>j", "<C-w>j", { desc = "Move down" })
keymap.set("n", "<Leader>l", "<C-w>l", { desc = "Move right" })

-- Resize window
keymap.set("n", "<Leader><Left>", "<C-w><", { desc = "Decrease width" })
keymap.set("n", "<Leader><Right>", "<C-w>>", { desc = "Increase width" })
keymap.set("n", "<Leader><Up>", "<C-w>+", { desc = "Increase height" })
keymap.set("n", "<Leader><Down>", "<C-w>-", { desc = "Decrease height" })

-- Copy from Clipboard
vim.api.nvim_set_keymap("v", "<C-C>", ":w !xclip -i -sel c<CR><CR>", { noremap = true })

-- Sublime Text Feature (CTRL+SHIFT+ARROW KEYS) to drag the line of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Filetype Detections
vim.cmd([[
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.mdx set filetype=markdown
  au BufNewFile,BufRead *.bash set filetype=bash
  au BufNewFile,BufRead *.tsx setf typescriptreact
  au BufNewFile,BufRead *.ts setf typescript
  au BufNewFile,BufRead .*aliases* set ft=sh
  au BufNewFile,BufRead requirements*.txt set ft=python
]])
