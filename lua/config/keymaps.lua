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
      "~/work",
      "~/dev",
    },
    oneoff_directories = { "~/.config/nvim", "~/.config/hypr", "~/zettelkasten" },
    auto_file_explorer = false,
  })
end, { desc = "Search for a project" })

-- todo in notes
vim.keymap.set("n", "<leader>zt", function()
  require("telescope.builtin").grep_string({
    search = "TODO:",
    cwd = "~/zettelkasten",
    prompt_title = "TODOs in Notes",
  })
end, { desc = "Search TODOs in Notes" })

-- telekasten markdown wiki
map("n", "<leader>z", "<cmd>Telekasten panel<CR>", { desc = "Telekasten Panel" })
map("n", "<leader>zv", "<cmd>Telekasten switch_vault<CR>", { desc = "Switch Vault" })
map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "Find Notes" })
map("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { desc = "Search Notes" })
map("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { desc = "Today’s Note" })
map("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", { desc = "Follow Link" })
map("n", "<leader>zn", "<cmd>Telekasten new_templated_note<CR>", { desc = "New Templated Note" })
map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Calendar" })
map("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { desc = "Backlinks" })
map("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", { desc = "Insert Image Link" })
map("n", "<leader>zl", "<cmd>Telekasten insert_link<CR>", { desc = "Insert Link" })
map("i", "[[", "<cmd>Telekasten insert_link<CR>", { desc = "Insert Link" })

-- fold and unfold
map("n", "<leader>uo", "zo", { desc = "Open fold under cursor" })
map("n", "<leader>uc", "zc", { desc = "Close fold under cursor" })
