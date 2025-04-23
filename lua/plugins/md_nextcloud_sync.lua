return {
  {
    "Rom3dius/md_nextcloud_sync",
    config = function()
      require("md_nextcloud_sync").setup({
        folders = { "~/zettelkasten" },
        nextcloud_user = "",
        nextcloud_pass = "",
        nextcloud_url = "",
      })
    end,
  },
}
