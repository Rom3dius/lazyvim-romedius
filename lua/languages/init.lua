local M = {}

---@private
local function scan_languages()
  local result = {}
  local dir = vim.fn.stdpath("config") .. "/lua/languages"
  local handle = vim.loop.fs_scandir(dir)
  if not handle then return result end

  while true do
    local name, ftype = vim.loop.fs_scandir_next(handle)
    if not name then break end
    if ftype == "file"
      and name:sub(-4) == ".lua"
      and name ~= "types.lua"
      and name ~= "init.lua"
    then
      local mod = require("languages." .. name:sub(1, -5))
      if mod.enabled ~= false then
        table.insert(result, mod)
      end
    end
  end

  return result
end

--- Aggregate all modules into the shape LazyVim needs
function M.load()
  local langs       = scan_languages()
  local lsp_servers = {}
  local mason_lsp   = {}
  local mason_tools = {}
  local fmt_by_ft   = {}
  local fmt_config  = {}

  for _, lang in ipairs(langs) do
    if lang.lsp then
      for srv, cfg in pairs(lang.lsp) do
        lsp_servers[srv] = vim.tbl_deep_extend("force", lsp_servers[srv] or {}, cfg)
      end
    end

    if lang.mason_lsp then
      vim.list_extend(mason_lsp, lang.mason_lsp)
    end

    if lang.mason_tools then
      vim.list_extend(mason_tools, lang.mason_tools)
    end

    if lang.formatters_by_ft then
      for ft, names in pairs(lang.formatters_by_ft) do
        fmt_by_ft[ft] = fmt_by_ft[ft] or {}
        vim.list_extend(fmt_by_ft[ft], names)
      end
    end

    if lang.formatters_config then
      for name, cfg in pairs(lang.formatters_config) do
        fmt_config[name] = vim.tbl_deep_extend("force", fmt_config[name] or {}, cfg)
      end
    end
  end

  return {
    lsp_servers      = lsp_servers,
    mason_lsp        = vim.tbl_deep_extend("force", {}, vim.fn.uniq(mason_lsp)),
    mason_tools      = vim.tbl_deep_extend("force", {}, vim.fn.uniq(mason_tools)),
    formatters_by_ft = fmt_by_ft,
    formatters_config = fmt_config,
  }
end

return M

