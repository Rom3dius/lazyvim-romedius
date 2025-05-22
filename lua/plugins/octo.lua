return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = false,
      default_merge_method = "rebase",
      picker = "telescope",
    },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "List Issues (Octo)" },
      { "<leader>gI", "<cmd>Octo issue search involves:@me<CR>", desc = "List my Issues (Octo)" },
      { "<leader>gp", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
      { "<leader>gP", "<cmd>Octo pr search involves:@me<CR>", desc = "Search my PRs (Octo)" },
      { "<leader>gr", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
      { "<leader>gnp", "<cmd>Octo pr create<CR>", desc = "Create PR (Octo)" },
      { "<leader>gni", "<cmd>Octo issue create<CR>", desc = "Create Issue (Octo)" },
      {
        "<leader>gu",
        function()
          local buftype = vim.api.nvim_buf_get_name(0)
          if buftype:match("octo://.*/issue/") then
            vim.cmd("Octo issue reload")
          elseif buftype:match("octo://.*/pull/") then
            vim.cmd("Octo pr reload")
          else
            vim.notify("Not an Octo issue or PR buffer", vim.log.levels.WARN)
          end
        end,
        desc = "Reload Issue/PR (Octo)",
        ft = "octo",
      },
      {
        "<leader>gbo",
        function()
          local buftype = vim.api.nvim_buf_get_name(0)
          if buftype:match("octo://.*/issue/") then
            vim.cmd("Octo issue browser")
          elseif buftype:match("octo://.*/pull/") then
            vim.cmd("Octo pr browser")
          else
            vim.notify("Not an Octo issue or PR buffer", vim.log.levels.WARN)
          end
        end,
        desc = "Open Issue/PR in browser (Octo)",
        ft = "octo",
      },
      {
        "<leader>gbc",
        function()
          local buftype = vim.api.nvim_buf_get_name(0)
          if buftype:match("octo://.*/issue/") then
            vim.cmd("Octo issue url")
          elseif buftype:match("octo://.*/pull/") then
            vim.cmd("Octo issue url")
          else
            vim.notify("Not an Octo issue or PR buffer", vim.log.levels.WARN)
          end
        end,
        desc = "Copy Issue/PR URL (Octo)",
        ft = "octo",
      },

      { "<localleader>a", "", desc = "+assignee (Octo)", ft = "octo" },
      { "<localleader>c", "", desc = "+comment/code (Octo)", ft = "octo" },
      { "<localleader>l", "", desc = "+label (Octo)", ft = "octo" },
      { "<localleader>i", "", desc = "+issue (Octo)", ft = "octo" },
      { "<localleader>r", "", desc = "+react (Octo)", ft = "octo" },
      { "<localleader>p", "", desc = "+pr (Octo)", ft = "octo" },
      { "<localleader>pr", "", desc = "+rebase (Octo)", ft = "octo" },
      { "<localleader>ps", "", desc = "+squash (Octo)", ft = "octo" },
      { "<localleader>v", "", desc = "+review (Octo)", ft = "octo" },
      { "<localleader>g", "", desc = "+goto_issue (Octo)", ft = "octo" },
      { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
      { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    },
  },
}
