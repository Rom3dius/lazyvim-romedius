return {
  {
    "Rom3dius/mirrormark",
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
