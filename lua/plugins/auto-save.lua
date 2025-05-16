return {
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      condition = function(buf)
        local filetype = vim.fn.getbufvar(buf, "&filetype")

        -- don't auto-save for:
        local list = { "octo" }
        if vim.list_containts(list, filetype) then
          return false
        end
        return true
      end,
    },
  },
}
