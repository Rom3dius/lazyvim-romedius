return {
  {
    "Rom3dius/mirrormark",
    enabled = false,
    config = function()
      require("mirrormark").setup({
        folders = {
          "~/zettelkasten",
        },
        rclone_remote = "box-romedius",
        remote_root = "NvimNotes",
      })
    end,
  },
}
