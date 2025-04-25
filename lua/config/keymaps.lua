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
    oneoff_directories = { "~/.config/nvim", "~/.config/hypr", "~/zettelkasten" },
    auto_file_explorer = false,
  })
end, { desc = "Search for a project" })

-- utility keymaps
map("n", "<leader>bc", ":let @+ = expand('%:p')<>", { desc = "Copy current buffers full path " })

-- telekasten markdown wiki
map("n", "<leader>z", "<cmd>Telekasten panel<CR>")
map("n", "<leader>zv", "<cmd>Telekasten switch_vault<CR>")
map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
map("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
map("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
map("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
map("n", "<leader>zn", "<cmd>Telekasten new_templated_note<CR>")
map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
map("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
map("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
map("n", "<leader>zl", "<cmd>Telekasten insert_link<CR>")
