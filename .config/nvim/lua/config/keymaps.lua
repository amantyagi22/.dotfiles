-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Competitive Programming Run
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  vim.cmd("!g++ -std=gnu++17 -O2 % -o %< && ./%< < input.txt")
end, { desc = "Compile & Run C++ (Codeforces)" })

-- tmux-sessionizer
-- Inside tmux: open the picker in a new window. Outside tmux: run it directly
-- (the script handles new-session/attach itself).
vim.keymap.set("n", "<C-f>", function()
  if vim.env.TMUX then
    vim.cmd("silent !tmux neww tmux-sessionizer")
  else
    vim.cmd("silent !tmux-sessionizer")
  end
end, { desc = "Sessionizer: pick project" })
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>",
  { desc = "Sessionizer: dev server" })
vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>",
  { desc = "Sessionizer: mongosh" })
vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>",
  { desc = "Sessionizer: test watcher" })
vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>",
  { desc = "Sessionizer: lazygit" })
