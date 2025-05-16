return {
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("auto-save").setup({
        condition = function(buf)
          local ft = vim.bo[buf].filetype
          return ft ~= "octo"
        end,
      })
    end,
  },
}
