-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- whaler
map("n", "<leader>fw", function()
  local telescope = require("telescope")
  telescope.load_extension("whaler")
  local w = telescope.extensions.whaler.whaler
  w({
    directories = {
      "~/src",
      "~/dev",
    },
    oneoff_directories = { "~/.config/nvim", "~/.config/hypr" },
  })
end)

-- kiwi markdown wiki
map("n", "<leader>pi", ':lua require("kiwi").open_wiki_index()<CR>', { desc = "Open wiki index" })
map("n", "<leader>pp", ':lua require("kiwi").open_wiki_index("personal")<CR>', { desc = "Open personal wiki" })
map("n", "<leader>pw", ':lua require("kiwi").open_wiki_index("work")<CR>', { desc = "Open personal wiki" })
map("n", "T", ":lua require('kiwi').todo.toggle()<cr>", { desc = "Toggle markdown task" })
