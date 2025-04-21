---@class Language
---@field enabled        boolean?             — disable a language entirely
---@field lsp            table<string, table>?— entries for nvim‑lspconfig.servers
---@field formatters_by_ft table<string, string[]>? — map filetype → list of conform formatters
---@field formatters_config table<string, table>?   — per‑formatter options for conform
---@field mason_lsp      string[]?             — mason‑lspconfig packages to ensure_installed
---@field mason_tools    string[]?             — external CLIs (prettier, stylua, etc.) for mason‑tool‑installer

