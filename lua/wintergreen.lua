-- Wintergreen colorscheme for Neovim
-- A dark, cool-toned theme inspired by winter frost and evergreen forests

local M = {}

M.colors = {
  -- Backgrounds
  base = "#1a2332",
  mantle = "#151d28",
  crust = "#0f1419",
  surface0 = "#243342",
  surface1 = "#2d3f52",
  surface2 = "#364b62",

  -- Foregrounds
  text = "#c8d5e3",
  subtext1 = "#a8b8c7",
  subtext0 = "#95a7b8",

  -- Overlays
  overlay0 = "#495f75",
  overlay1 = "#5a6f85",
  overlay2 = "#6b8095",

  -- Accents
  teal = "#73c5b8",
  mint = "#81d4be",
  frost = "#99e0d9",
  pine = "#5f9985",
  evergreen = "#4a8570",

  -- Cool tones
  sky = "#7dcfe6",
  sapphire = "#6db8d6",
  blue = "#7da6d6",
  lavender = "#a5b8e6",

  -- Warm accents
  green = "#8fc5a1",
  yellow = "#e6d89c",
  peach = "#e6b89c",
  rose = "#d4c4bd",

  -- Pastels
  mauve = "#b5a5d6",
  pink = "#d4a5c9",
  red = "#d88a8a",
  maroon = "#d89999",

  -- UI
  selection = "#2d3f52",
  search = "#364b62",
  line_highlight = "#1f2a38",
  none = "NONE",
}

function M.setup()
  local c = M.colors

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "wintergreen"

  local highlights = {
    -- Editor
    Normal = { fg = c.text, bg = c.base },
    NormalFloat = { fg = c.text, bg = c.surface0 },
    FloatBorder = { fg = c.overlay0, bg = c.surface0 },
    Cursor = { fg = c.base, bg = c.text },
    CursorLine = { bg = c.line_highlight },
    CursorLineNr = { fg = c.teal, bold = true },
    LineNr = { fg = c.overlay0 },
    SignColumn = { bg = c.base },
    ColorColumn = { bg = c.surface0 },
    Conceal = { fg = c.overlay1 },
    SpecialKey = { fg = c.overlay0 },
    NonText = { fg = c.overlay0 },
    MatchParen = { fg = c.frost, bold = true, underline = true },
    Whitespace = { fg = c.surface2 },
    VertSplit = { fg = c.overlay0 },
    WinSeparator = { fg = c.overlay0 },
    Folded = { fg = c.subtext0, bg = c.surface0 },
    FoldColumn = { fg = c.overlay0 },

    -- Popup menu
    Pmenu = { fg = c.text, bg = c.surface0 },
    PmenuSel = { fg = c.base, bg = c.teal },
    PmenuSbar = { bg = c.surface1 },
    PmenuThumb = { bg = c.overlay0 },

    -- Search
    Search = { fg = c.base, bg = c.yellow },
    IncSearch = { fg = c.base, bg = c.peach },
    CurSearch = { fg = c.base, bg = c.frost },
    Visual = { bg = c.selection },
    VisualNOS = { bg = c.selection },

    -- Statusline
    StatusLine = { fg = c.text, bg = c.surface0 },
    StatusLineNC = { fg = c.subtext0, bg = c.mantle },
    WinBar = { fg = c.text, bg = c.base },
    WinBarNC = { fg = c.subtext0, bg = c.base },

    -- Tabline
    TabLine = { fg = c.subtext0, bg = c.mantle },
    TabLineFill = { bg = c.mantle },
    TabLineSel = { fg = c.text, bg = c.surface0 },

    -- Messages
    ErrorMsg = { fg = c.red },
    WarningMsg = { fg = c.yellow },
    ModeMsg = { fg = c.text, bold = true },
    MoreMsg = { fg = c.teal },
    Question = { fg = c.teal },

    -- Spelling
    SpellBad = { undercurl = true, sp = c.red },
    SpellCap = { undercurl = true, sp = c.yellow },
    SpellLocal = { undercurl = true, sp = c.blue },
    SpellRare = { undercurl = true, sp = c.mauve },

    -- Diff
    DiffAdd = { bg = "#1f3329" },
    DiffChange = { bg = "#1f2d3d" },
    DiffDelete = { bg = "#3d1f1f" },
    DiffText = { bg = "#2d4a5c" },

    -- Syntax
    Comment = { fg = c.overlay2, italic = true },
    Constant = { fg = c.peach },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.peach },
    Boolean = { fg = c.peach },
    Float = { fg = c.peach },

    Identifier = { fg = c.text },
    Function = { fg = c.blue },

    Statement = { fg = c.pink },
    Conditional = { fg = c.pink },
    Repeat = { fg = c.pink },
    Label = { fg = c.pink },
    Operator = { fg = c.lavender },
    Keyword = { fg = c.pink },
    Exception = { fg = c.pink },

    PreProc = { fg = c.mauve },
    Include = { fg = c.pink },
    Define = { fg = c.mauve },
    Macro = { fg = c.mauve },
    PreCondit = { fg = c.mauve },

    Type = { fg = c.yellow },
    StorageClass = { fg = c.yellow },
    Structure = { fg = c.yellow },
    Typedef = { fg = c.yellow },

    Special = { fg = c.teal },
    SpecialChar = { fg = c.teal },
    Tag = { fg = c.pink },
    Delimiter = { fg = c.text },
    SpecialComment = { fg = c.overlay2 },
    Debug = { fg = c.red },

    Underlined = { underline = true },
    Ignore = { fg = c.overlay0 },
    Error = { fg = c.red },
    Todo = { fg = c.base, bg = c.yellow, bold = true },

    -- Treesitter
    ["@variable"] = { fg = c.text },
    ["@variable.builtin"] = { fg = c.rose },
    ["@variable.parameter"] = { fg = c.rose },
    ["@variable.member"] = { fg = c.teal },

    ["@constant"] = { fg = c.peach },
    ["@constant.builtin"] = { fg = c.peach },
    ["@constant.macro"] = { fg = c.mauve },

    ["@module"] = { fg = c.mauve },
    ["@label"] = { fg = c.sapphire },

    ["@string"] = { fg = c.green },
    ["@string.escape"] = { fg = c.teal },
    ["@string.special"] = { fg = c.teal },

    ["@character"] = { fg = c.green },
    ["@number"] = { fg = c.peach },
    ["@boolean"] = { fg = c.peach },
    ["@float"] = { fg = c.peach },

    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.blue },
    ["@function.call"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.mauve },
    ["@function.method"] = { fg = c.teal },
    ["@function.method.call"] = { fg = c.teal },

    ["@constructor"] = { fg = c.sapphire },

    ["@keyword"] = { fg = c.pink },
    ["@keyword.function"] = { fg = c.pink },
    ["@keyword.operator"] = { fg = c.lavender },
    ["@keyword.return"] = { fg = c.pink },
    ["@keyword.conditional"] = { fg = c.pink },
    ["@keyword.repeat"] = { fg = c.pink },
    ["@keyword.import"] = { fg = c.pink },

    ["@operator"] = { fg = c.lavender },

    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.yellow },
    ["@type.definition"] = { fg = c.yellow },

    ["@attribute"] = { fg = c.teal },
    ["@property"] = { fg = c.teal },

    ["@punctuation.bracket"] = { fg = c.subtext1 },
    ["@punctuation.delimiter"] = { fg = c.subtext1 },
    ["@punctuation.special"] = { fg = c.teal },

    ["@comment"] = { fg = c.overlay2, italic = true },
    ["@comment.todo"] = { fg = c.base, bg = c.yellow },
    ["@comment.note"] = { fg = c.base, bg = c.sky },
    ["@comment.warning"] = { fg = c.base, bg = c.yellow },
    ["@comment.error"] = { fg = c.base, bg = c.red },

    ["@tag"] = { fg = c.pink },
    ["@tag.attribute"] = { fg = c.teal },
    ["@tag.delimiter"] = { fg = c.subtext1 },

    ["@markup.heading"] = { fg = c.blue, bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = c.teal },
    ["@markup.link.url"] = { fg = c.teal, underline = true },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.list"] = { fg = c.teal },

    -- LSP
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.sky },
    DiagnosticHint = { fg = c.lavender },

    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.sky },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.lavender },

    DiagnosticVirtualTextError = { fg = c.red, bg = "#2d1f1f" },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bg = "#2d2a1f" },
    DiagnosticVirtualTextInfo = { fg = c.sky, bg = "#1f2a2d" },
    DiagnosticVirtualTextHint = { fg = c.lavender, bg = "#1f1f2d" },

    LspReferenceText = { bg = c.surface1 },
    LspReferenceRead = { bg = c.surface1 },
    LspReferenceWrite = { bg = c.surface1 },

    LspSignatureActiveParameter = { fg = c.teal, bold = true },
    LspCodeLens = { fg = c.overlay1 },
    LspInlayHint = { fg = c.overlay1, bg = c.surface0, italic = true },

    -- Git signs
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.yellow },
    GitSignsDelete = { fg = c.red },

    -- Telescope
    TelescopeBorder = { fg = c.overlay0, bg = c.base },
    TelescopeNormal = { fg = c.text, bg = c.base },
    TelescopeSelection = { fg = c.text, bg = c.surface1 },
    TelescopeSelectionCaret = { fg = c.teal },
    TelescopeMatching = { fg = c.teal, bold = true },
    TelescopePromptPrefix = { fg = c.teal },

    -- Indent blankline
    IblIndent = { fg = c.surface1 },
    IblScope = { fg = c.overlay0 },

    -- Lazy
    LazyButton = { fg = c.text, bg = c.surface0 },
    LazyButtonActive = { fg = c.base, bg = c.teal },
    LazyH1 = { fg = c.base, bg = c.teal, bold = true },

    -- Mason
    MasonHeader = { fg = c.base, bg = c.teal, bold = true },
    MasonHighlight = { fg = c.teal },
    MasonHighlightBlock = { fg = c.base, bg = c.teal },

    -- Notify
    NotifyERRORBorder = { fg = c.red },
    NotifyWARNBorder = { fg = c.yellow },
    NotifyINFOBorder = { fg = c.sky },
    NotifyDEBUGBorder = { fg = c.overlay1 },
    NotifyTRACEBorder = { fg = c.mauve },
    NotifyERRORIcon = { fg = c.red },
    NotifyWARNIcon = { fg = c.yellow },
    NotifyINFOIcon = { fg = c.sky },
    NotifyDEBUGIcon = { fg = c.overlay1 },
    NotifyTRACEIcon = { fg = c.mauve },
    NotifyERRORTitle = { fg = c.red },
    NotifyWARNTitle = { fg = c.yellow },
    NotifyINFOTitle = { fg = c.sky },
    NotifyDEBUGTitle = { fg = c.overlay1 },
    NotifyTRACETitle = { fg = c.mauve },

    -- Noice
    NoiceCmdlinePopupBorder = { fg = c.overlay0 },
    NoiceCmdlineIcon = { fg = c.teal },

    -- Which-key
    WhichKey = { fg = c.teal },
    WhichKeyGroup = { fg = c.blue },
    WhichKeySeparator = { fg = c.overlay0 },
    WhichKeyDesc = { fg = c.text },
    WhichKeyValue = { fg = c.subtext0 },

    -- Dashboard/Alpha
    DashboardHeader = { fg = c.teal },
    DashboardFooter = { fg = c.overlay2, italic = true },
    DashboardCenter = { fg = c.text },
    DashboardShortCut = { fg = c.pink },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
