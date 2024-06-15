local c = require('watermelon.colors')
local cfg = vim.g.watermelon_config
local util = require('watermelon.util')

local H = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format('highlight %s guifg=%s guibg=%s guisp=%s gui=%s', group_name,
            group_settings.fg or 'none',
            group_settings.bg or 'none',
            group_settings.sp or 'none',
            group_settings.fmt or 'none'))
    end
end

hl.common = {
    Normal = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg1 },
    Terminal = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg0 },
    EndOfBuffer = { fg = cfg.ending_tildes and c.none or c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    FoldColumn = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg1 },
    Folded = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg2 },
    SignColumn = { fg = c.white, bg = c.bg0 },
    ToolbarLine = { fg = c.fg0 },
    Cursor = { fmt = "reverse" },
    vCursor = { fmt = "reverse" },
    iCursor = { fmt = "reverse" },
    lCursor = { fmt = "reverse" },
    CursorIM = { fmt = "reverse" },
    CursorColumn = { bg = c.bg0 },
    CursorLine = { bg = c.bg0 },
    ColorColumn = { bg = c.bg0 },
    CursorLineNr = { fg = c.white },
    LineNr = { fg = c.white },
    LineNrAbove = { fg = c.fg2 },
    LineNrBelow = { fg = c.fg2 },
    Conceal = { fg = c.fg2, bg = c.bg1 },
    Added = c.limegreen,
    Removed = c.red,
    Changed = c.blue,
    DiffAdd = { fg = c.limegreen, bg = c.bg0 },
    DiffChange = { fg = c.blue, bg = c.bg0 },
    DiffDelete = { fg = c.red, bg = c.bg0 },
    DiffText = { fg = c.lightblue, bg= c.bg0 },
    DiffAdded = c.limegreen,
    DiffChanged = c.blue,
    DiffRemoved = c.red,
    DiffDeleted = c.red,
    DiffFile = c.lightblue,
    DiffIndexLine = c.fg1,
    Directory = { fg = c.white },
    ErrorMsg = { fg = c.err, fmt = "bold" },
    WarningMsg = { fg = c.wrn, fmt = "bold" },
    MoreMsg = { fg = c.msg, fmt = "bold" },
    CurSearch = { fg = c.bg0, bg = c.green },
    IncSearch = { fg = c.bg0, bg = c.green },
    Search = { fg = c.bg0, bg = c.green },
    Substitute = { fg = c.bg0, bg = c.green },
    MatchParen = { fg = c.green, bg = c.bg0 },
    NonText = { fg = c.fg2 },
    Whitespace = { fg = c.fg2 },
    SpecialKey = { fg = c.fg2 },
    Pmenu = { fg = c.white, bg = c.bg2 },
    PmenuSbar = { fg = c.none, bg = c.bg1 },
    PmenuSel = { fg = c.bg0, bg = c.green },
    WildMenu = { fg = c.bg0, bg = c.msg },
    PmenuThumb = { fg = c.none, bg = c.fg0 },
    Question = { fg = c.wrn },
    SpellBad = { fg = c.none, fmt = "undercurl", sp = c.err },
    SpellCap = { fg = c.none, fmt = "undercurl", sp = c.msg },
    SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.msg },
    SpellRare = { fg = c.none, fmt = "undercurl", sp = c.wrn },
    StatusLine = { fg = c.black, bg = c.darkgreen },
    StatusLineTerm = { fg = c.black, bg = c.darkgreen },
    StatusLineNC = { fg = c.fg1, bg = c.bg0 },
    StatusLineTermNC = { fg = c.fg1, bg = c.bg0 },
    TabLine = { fg = c.fg2, bg = c.bg0 },
    TabLineFill = { fg = c.fg1, bg = c.bg1 },
    TabLineSel =  { fg = c.fg0, bg = c.bg2 },
    WinSeparator = { fg = c.darkgreen, bg = c.bg0 },
    Visual = { fg = c.black, bg = c.green },
    VisualNOS = { fg = c.black, bg = c.darkgreen, fmt = "underline" },
    QuickFixLine = { fg = c.blue, fmt = "underline" },
    Debug = { fg = c.yellow },
    debugPC = { fg = c.bg0, bg = c.green },
    debugBreakpoint = { fg = c.bg0, bg = c.red },
    ToolbarButton = { fg = c.bg0, bg = c.bg_blue },
    FloatBorder = { fg = c.darkgreen, bg = c.bg0 },
    NormalFloat = { fg = c.white, bg = c.bg2 },
}

hl.syntax = {
    Annotation = c.yellow,
    Boolean = { fg = c.lightblue, fmt = cfg.code_style.bool },
    Character = c.pink,
    Comment = { fg = c.fg2, fmt = cfg.code_style.comments },
    Conditional = { fg = c.red, fmt = cfg.code_style.keywords },
    Constant = c.lightblue,
    Define = { fg = c.red, fmt = cfg.code_style.preproc },
    Delimiter = c.white,
    Error = { fg = c.err, fmt = cfg.code_style.error },
    Exception = c.red,
    Float = c.blue,
    Function = { fg = c.darkgreen, fmt = cfg.code_style.functions },
    Identifier = { fg = c.white, fmt = cfg.code_style.variables },
    Include = { fg = c.red, fmt = cfg.code_style.preproc },
    Keyword = { fg = c.red, fmt = cfg.code_style.keywords },
    Label = { fg = c.red, fmt = cfg.code_style.preproc },
    Macro = { fg = c.red, fmt = cfg.code_style.preproc },
    Number = c.blue,
    Operator = c.white,
    PreCondit = { fg = c.red, fmt = cfg.code_style.preproc },
    PreProc = { fg = c.red, fmt = cfg.code_style.preproc },
    Repeat = { fg = c.red, fmt = cfg.code_style.keywords },
    Special = c.white,
    SpecialChar = c.white,
    SpecialComment = { fg = c.fg2, fmt = cfg.code_style.comments },
    Statement = c.red,
    StorageClass = c.limegreen,
    String = { fg = c.pink, fmt = cfg.code_style.strings },
    Structure = c.limegreen,
    Tag = c.white,
    Title = { fg = c.darkgreen, fmt = cfg.code_style.title },
    Todo = { fg = c.msg, fmt = cfg.code_style.comments },
    Type = c.limegreen,
    Typedef = c.limegreen
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- nvim-treesitter@0.9.2 and after
        ["@annotation"] = c.fg1,
        ["@attribute"] = c.darkgreen,
        ["@attribute.typescript"] = c.darkgreen,
        ["@boolean"] = c.lightblue,
        ["@character"] = c.limegreen,
        ["@comment"] = {fg = c.fg2, fmt = cfg.code_style.comments},
        ["@comment.todo"] = {fg = c.msg, fmt = cfg.code_style.comments},
        ["@comment.todo.unchecked"] = {fg = c.msg, fmt = cfg.code_style.comments},
        ["@comment.todo.checked"] = {fg = c.green, fmt = cfg.code_style.comments},
        ["@constant"] = {fg = c.lightblue, fmt = cfg.code_style.constants},
        ["@constant.builtin"] = {fg = c.lightblue, fmt = cfg.code_style.constants},
        ["@constant.macro"] = {fg = c.lightblue, fmt = cfg.code_style.constants},
        ["@constructor"] = {fg = c.yellow, fmt = "bold"},
        ["@diff.add"] = hl.common.DiffAdded,
        ["@diff.delete"] = hl.common.DiffDeleted,
        ["@diff.plus"] = hl.common.DiffAdded,
        ["@diff.minus"] = hl.common.DiffDeleted,
        ["@diff.delta"] = hl.common.DiffChanged,
        ["@error"] = hl.syntax.Error,
        ["@function"] = {fg = c.darkgreen, fmt = cfg.code_style.functions},
        ["@function.builtin"] = {fg = c.darkgreen, fmt = cfg.code_style.functions},
        ["@function.macro"] = {fg = c.darkgreen, fmt = cfg.code_style.functions},
        ["@function.method"] = {fg = c.darkgreen, fmt = cfg.code_style.methods},
        ["@keyword"] = {fg = c.red, fmt = cfg.code_style.keywords},
        ["@keyword.conditional"] = {fg = c.red, fmt = cfg.code_style.keywords},
        ["@keyword.directive"] = c.red,
        ["@keyword.exception"] = c.red,
        ["@keyword.function"] = {fg = c.red, fmt = cfg.code_style.functions},
        ["@keyword.import"] = c.red,
        ["@keyword.operator"] =  {fg = c.red, fmt = cfg.code_style.keywords},
        ["@keyword.repeat"] = {fg = c.red, fmt = cfg.code_style.keywords},
        ["@label"] = c.red,
        ["@markup.emphasis"] = {fg = c.white, fmt = 'italic'},
        ["@markup.environment"] = c.fg0,
        ["@markup.environment.name"] = c.fg0,
        ["@markup.heading"] = {fg = c.darkgreen, fmt = 'bold'},
        ["@markup.link"] = c.green,
        ["@markup.link.url"] = {fg = c.blue, fmt = 'underline'},
        ["@markup.list"] = c.red,
        ["@markup.math"] = c.lightblue,
        ["@markup.raw"] = c.limegreen,
        ["@markup.strike"] = {fg = c.fg0, fmt = 'strikethrough'},
        ["@markup.strong"] = {fg = c.fg0, fmt = 'bold'},
        ["@markup.underline"] = {fg = c.fg0, fmt = 'underline'},
        ["@module"] = c.yellow,
        ["@none"] = c.fg0.Fg,
        ["@number"] = c.blue,
        ["@number.float"] = c.blue,
        ["@operator"] = c.white,
        ["@parameter.reference"] = c.green,
        ["@property"] = c.white,
        ["@punctuation.delimiter"] = c.white,
        ["@punctuation.bracket"] = c.fg0,
        ["@string"] = {fg = c.green, fmt = cfg.code_style.strings},
        ["@string.regexp"] = {fg = c.lightblue, fmt = cfg.code_style.strings},
        ["@string.escape"] = {fg = c.darkpink, fmt = cfg.code_style.strings},
        ["@string.special.symbol"] = c.blue,
        ["@tag"] = c.red,
        ["@tag.attribute"] = c.darkgreen,
        ["@tag.delimiter"] = c.fg1,
        ["@text"] = c.white,
        ["@note"] = c.fg0,
        ["@warning"] = c.wrn,
        ["@danger"] = c.err,
        ["@type"] = c.red,
        ["@type.builtin"] = c.red,
        ["@variable"] = {fg = c.white, fmt = cfg.code_style.variables},
        ["@variable.builtin"] = {fg = c.red, fmt = cfg.code_style.variables},
        ["@variable.member"] = c.red,
        ["@variable.parameter"] = c.red,
        ["@markup.heading.1.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.2.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.3.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.4.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.5.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.6.markdown"] = {fg = c.darkgreen, fmt = "bold"},
        ["@markup.heading.1.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},
        ["@markup.heading.2.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},
        ["@markup.heading.3.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},
        ["@markup.heading.4.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},
        ["@markup.heading.5.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},
        ["@markup.heading.6.marker.markdown"] = {fg = c.limegreen, fmt = "bold"},

        -- Old configuration for nvim-treesiter@0.9.1 and below
        ["@conditional"] = hl.syntax.Conditional,
        ["@exception"] = hl.syntax.Exception,
        ["@field"] = c.yellow,
        ["@float"] = hl.syntax.Float,
        ["@include"] = hl.syntax.Include,
        -- ["@method"] = hl.treesitter["@function.method"],
        ["@namespace"] = c.limegreen,
        -- ["@parameter"] = hl.treesitter["@variable.parameter"],
        ["@preproc"] = hl.syntax.PreProc,
        -- ["@punctuation.special"] = hl.treesitter["@punctuation.special"] ,
        ["@repeat"] = hl.syntax.Repeat,
        -- ["@string.regex"] = hl.treesitter["@string.regexp"],
        -- ["@text.strong"] = hl.treesitter["@markup.strong"],
        -- ["@text.emphasis"] = hl.treesitter["@markup.emphasis"],
        -- ["@text.underline"] = hl.treesitter["@markup.underline"],
        -- ["@text.strike"] = hl.treesitter["@markup.strike"],
        ["@text.title"] = hl.syntax.Title,
        ["@text.literal"] = c.limegreen,
        -- ["@text.uri"] = hl.treesitter["@markup.link.url"],
        ["@text.todo"] = hl.syntax.Todo,
        -- ["@text.todo.unchecked"] = hl.treesitter["@comment.todo.unchecked"],
        -- ["@text.todo.checked"] = hl.treesitter["@comment.todo.checked"],
        -- ["@text.math"] = hl.treesitter["@markup.math"],
        -- ["@text.reference"] = hl.treesitter["@parameter.reference"],
        -- ["@text.environment"] = hl.treesitter["@markup.environment"],
        -- ["@text.environment.name"] = hl.treesitter["@markup.environment.name"],
        -- ["@text.diff.add"] = hl.treesitter["@diff.add"],
        -- ["@text.diff.delete"] = hl.treesitter["@diff.delete"],
    }
    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            -- ["@lsp.type.comment"] = hl.treesitter[ "@comment"],
            -- ["@lsp.type.enum"] = hl.treesitter["@type"],
            -- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
            -- ["@lsp.type.interface"] = hl.treesitter["@type"],
            -- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
            -- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
            -- ["@lsp.type.namespace"] = hl.treesitter["@module"],
            -- ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
            -- ["@lsp.type.property"] = hl.treesitter["@property"],
            -- ["@lsp.type.variable"] = hl.treesitter["@variable"],
            -- ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
            -- ["@lsp.type.method"] = hl.treesitter["@function.method"],
            -- ["@lsp.type.number"] = hl.treesitter["@number"],
            -- ["@lsp.type.generic"] = hl.treesitter["@text"],
            -- ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
            -- ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
            -- ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
            -- ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
            -- ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
            -- ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
            -- ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
            -- ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
        }
    end
else
    hl.treesitter = {
        TSAnnotation = hl.syntax.Comment,
        -- TSAttribute = hl.treesitter["@tag.attribute"],
        TSBoolean = hl.syntax.Boolean,
        TSCharacter = hl.syntax.Character,
        TSComment = hl.syntax.Comment,
        TSConditional = hl.syntax.Conditional,
        TSConstant = hl.syntax.Constant,
        TSConstBuiltin = hl.syntax.Constant,
        TSConstMacro = hl.syntax.Constant,
        TSConstructor = hl.syntax.Function,
        TSError = hl.syntax.Error,
        TSException = hl.syntax.Exception,
        -- TSField = hl.treesitter["@field"],
        TSFloat = hl.syntax.Number,
        TSFunction = hl.syntax.Function,
        TSFuncBuiltin = hl.syntax.Function,
        TSFuncMacro = hl.syntax.Function,
        TSInclude = hl.syntax.Include,
        TSKeyword = hl.syntax.Keyword,
        -- TSKeywordFunction = hl.treesitter["@keyword.function"],
        -- TSKeywordOperator = hl.treesitter["@keyword.operator"],
        TSLabel = hl.syntax.Label,
        -- TSMethod = hl.treesitter["@function.method"],
        -- TSNamespace = hl.lsp["@lsp.type.namespace"],
        TSNone = c.fg0,
        TSNumber = hl.syntax.Number,
        TSOperator = hl.syntax.Operator,
        -- TSParameter = hl.treesitter["@variable.parameter"],
        -- TSParameterReference = hl.treesitter["@parameter.reference"],
        -- TSProperty = hl.treesitter["@property"],
        -- TSPunctDelimiter = hl.treesitter["@tag.delimiter"],
        -- TSPunctBracket = hl.treesitter["@punctuation.bracket"],
        -- TSPunctSpecial = hl.treesitter["@punctuation.special"],
        TSRepeat = hl.syntax.Repeat,
        TSString = hl.syntax.String,
        -- TSStringRegex = hl.treesitter["@string.regexp"],
        TSStringEscape = {fg = c.darkpink, fmt = cfg.code_style.strings},
        -- TSSymbol = hl.treesitter["@string.special.symbol"],
        TSTag = hl.syntax.Tag,
        -- TSTagDelimiter = hl.treesitter["@tag.delimiter"],
        -- TSText = hl.treesitter["@text"],
        -- TSStrong = hl.treesitter["@markup.strong"],
        -- TSEmphasis = hl.treesitter["@markup.emphasis"],
        -- TSUnderline = hl.treesitter["@markup.underline"],
        -- TSStrike = hl.treesitter["@markup.strike"],
        TSTitle = hl.syntax.Title,
        -- TSLiteral = hl.treesitter["@text.literal"],
        -- TSURI = hl.treesitter["@markup.link.url"],
        -- TSMath = hl.treesitter["@markup.math"],
        -- TSTextReference = hl.treesitter["@text.reference"],
        -- TSEnvironment = hl.treesitter["@markup.environment"],
        -- TSEnvironmentName = hl.treesitter["@markup.environment.name"],
        -- TSNote = hl.treesitter["@note"],
        TSWarning = hl.common.WarningMsg,
        TSDanger = hl.common.ErrorMsg,
        TSType = hl.syntax.Type,
        TSTypeBuiltin = hl.syntax.Typedef,
        TSVariable = hl.treesitter.variable{fg = c.fg, fmt = cfg.code_style.variables},
        TSVariableBuiltin = {fg = c.red, fmt = cfg.code_style.variables},
    }
end

-- local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
-- local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
-- local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
-- local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = c.red,
    LspCxxHlGroupMemberVariable = c.red,
    LspCxxHlGroupNamespace = c.red,
    LspCxxHlSkippedRegion = c.red,
    LspCxxHlSkippedRegionBeginEnd = c.red,

    DiagnosticError = {fg = c.red},
    DiagnosticHint = {fg = c.purple},
    DiagnosticInfo = {fg = c.cyan},
    DiagnosticWarn = {fg = c.yellow},

    -- DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
    --                                fg = diagnostics_error_color },
    -- DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
    --                               fg = diagnostics_warn_color },
    -- DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
    --                               fg = diagnostics_info_color },
    -- DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
    --                               fg = diagnostics_hint_color },

    DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red},
    DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple},
    DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue},
    DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow},

    LspReferenceText = { bg = c.bg2 },
    LspReferenceWrite = { bg = c.bg2 },
    LspReferenceRead = { bg = c.bg2 },

    LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent = { fmt = "bold" },
    BufferCurrentMod = { fg = c.orange, fmt = "bold,italic" },
    BufferCurrentSign = { fg = c.purple },
    BufferInactiveMod = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    BufferVisible = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleMod = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    BufferVisibleIndex = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleSign = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleTarget = { fg = c.light_grey, bg = c.bg0 },
}

hl.plugins.cmp = {
    -- CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    -- CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    -- CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign = hl.plugins.lsp.DiagnosticError,
    CocHintSign = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    -- WhichKey = colors.Red,
    -- WhichKeyDesc = colors.Blue,
    -- WhichKeyGroup = colors.Orange,
    -- WhichKeySeparator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.green},
    GitGutterChange = {fg = c.blue},
    GitGutterDelete = {fg = c.red},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.red, fmt = "bold"},
    HopNextKey1 = {fg = c.cyan, fmt = "bold"},
    HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
    -- HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, fmt = "bold"},
    DiffviewFilePanelCounter = {fg = c.purple, fmt = "bold"},
    -- DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    -- DiffviewFilePanelRootPath = colors.Grey,
    -- DiffviewFilePanelPath = colors.Grey,
    -- DiffviewFilePanelInsertions = colors.Green,
    -- DiffviewFilePanelDeletions = colors.Red,
    -- DiffviewStatusAdded = colors.Green,
    -- DiffviewStatusUntracked = colors.Blue,
    -- DiffviewStatusModified = colors.Blue,
    -- DiffviewStatusRenamed = colors.Blue,
    -- DiffviewStatusCopied = colors.Blue,
    -- DiffviewStatusTypeChange = colors.Blue,
    -- DiffviewStatusUnmerged = colors.Blue,
    -- DiffviewStatusUnknown = colors.Red,
    -- DiffviewStatusDeleted = colors.Red,
    -- DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    -- GitSignsAdd = colors.Green,
    -- GitSignsAddLn = colors.Green,
    -- GitSignsAddNr = colors.Green,
    -- GitSignsChange = colors.Blue,
    -- GitSignsChangeLn = colors.Blue,
    -- GitSignsChangeNr = colors.Blue,
    -- GitSignsDelete = colors.Red,
    -- GitSignsDeleteLn = colors.Red,
    -- GitSignsDeleteNr = colors.Red
}

hl.plugins.neo_tree = {
    NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeWinSeparator = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeRootName = { fg = c.orange, fmt = "bold" },
    -- NeoTreeGitAdded = colors.Green,
    -- NeoTreeGitDeleted = colors.Red,
    -- NeoTreeGitModified = colors.Yellow,
    NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
    NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
    -- NeoTreeIndentMarker = colors.Grey,
    -- NeoTreeSymbolicLinkTarget = colors.Purple,
}

hl.plugins.neotest = {
    NeotestAdapterName = { fg = c.purple, fmt = "bold" },
    -- NeotestDir = colors.Cyan,
    -- NeotestExpandMarker = colors.Grey,
    -- NeotestFailed = colors.Red,
    -- NeotestFile = colors.Cyan,
    NeotestFocused = { fmt = "bold,italic" },
    -- NeotestIndent = colors.Grey,
    NeotestMarked = { fg = c.orange, fmt = "bold" },
    -- NeotestNamespace = colors.Blue,
    -- NeotestPassed = colors.Green,
    -- NeotestRunning = colors.Yellow,
    NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
    -- NeotestSkipped = colors.LightGrey,
    -- NeotestTarget = colors.Purple,
    -- NeotestTest = colors.Fg,
    -- NeotestUnknown = colors.LightGrey,
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
    -- NvimTreeGitDirty = colors.Yellow,
    -- NvimTreeGitNew = colors.Green,
    -- NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
    -- NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.dark_purple },
    -- NvimTreeSymlink = colors.Purple,
    -- NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
    -- TelescopeBorder = colors.Red,
    -- TelescopePromptBorder = colors.Cyan,
    -- TelescopeResultsBorder = colors.Cyan,
    -- TelescopePreviewBorder = colors.Cyan,
    TelescopeMatching = { fg = c.orange, fmt = "bold" },
    -- TelescopePromptPrefix = colors.Green,
    TelescopeSelection =  { bg =c.bg2 },
    -- TelescopeSelectionCaret = colors.Yellow
}

hl.plugins.dashboard = {
    -- DashboardShortCut = colors.Blue,
    -- DashboardHeader = colors.Yellow,
    -- DashboardCenter = colors.Cyan,
    DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
    AerialLine = { fg = c.purple, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
    NavicText = { fg = c.fg },
    NavicSeparator = { fg = c.light_grey },
}

hl.plugins.ts_rainbow = {
    -- rainbowcol1 = colors.LightGrey,
    -- rainbowcol2 = colors.Yellow,
    -- rainbowcol3 = colors.Blue,
    -- rainbowcol4 = colors.Orange,
    -- rainbowcol5 = colors.Purple,
    -- rainbowcol6 = colors.Green,
    -- rainbowcol7 = colors.Red
}

hl.plugins.ts_rainbow2 = {
    -- TSRainbowRed = colors.Red,
    -- TSRainbowYellow = colors.Yellow,
    -- TSRainbowBlue = colors.Blue,
    -- TSRainbowOrange = colors.Orange,
    -- TSRainbowGreen = colors.Green,
    -- TSRainbowViolet = colors.Purple,
    -- TSRainbowCyan = colors.Cyan,
}

hl.plugins.rainbow_delimiters = {
    -- RainbowDelimiterRed = colors.Red,
    -- RainbowDelimiterYellow = colors.Yellow,
    -- RainbowDelimiterBlue = colors.Blue,
    -- RainbowDelimiterOrange = colors.Orange,
    -- RainbowDelimiterGreen = colors.Green,
    -- RainbowDelimiterViolet = colors.Purple,
    -- RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
    -- IndentBlanklineIndent1 = colors.Blue,
    -- IndentBlanklineIndent2 = colors.Green,
    -- IndentBlanklineIndent3 = colors.Cyan,
    -- IndentBlanklineIndent4 = colors.LightGrey,
    -- IndentBlanklineIndent5 = colors.Purple,
    -- IndentBlanklineIndent6 = colors.Red,
    IndentBlanklineChar = { fg = c.bg1, fmt = "nocombine" },
    IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
    IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
    IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

    -- Ibl v3
    IblIndent = { fg = c.bg1, fmt = "nocombine" },
    IblWhitespace = { fg = c.grey, fmt = "nocombine" },
    IblScope = { fg = c.grey, fmt = "nocombine" },
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },

    MiniCursorword = { fmt = "underline" },
    MiniCursorwordCurrent = { fmt = "underline" },

    MiniIndentscopeSymbol = { fg = c.grey },
    MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

    MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

    MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

    MiniStarterCurrent = { fmt = "nocombine" },
    MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
    -- MiniStarterHeader = colors.Yellow,
    MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
    MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    MiniStarterItemBullet = { fg = c.grey },
    MiniStarterItemPrefix = { fg = c.yellow },
    -- MiniStarterSection = colors.LightGrey,
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFilename = { fg = c.grey, bg = c.bg1 },
    MiniStatuslineInactive = { fg = c.grey, bg = c.bg0 },
    MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
    MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
    MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
    MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, fmt = "bold" },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent = { fmt = "bold" },
    MiniTablineFill = { fg = c.grey, bg = c.bg1 },
    MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
    MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },

    MiniTestEmphasis = { fmt = "bold" },
    MiniTestFail = { fg = c.red, fmt = "bold" },
    MiniTestPass = { fg = c.green, fmt = "bold" },

    MiniTrailspace = { bg = c.red },
}

hl.langs.c = {
    -- cInclude = colors.Blue,
    -- cStorageClass = colors.Purple,
    -- cTypedef = colors.Purple,
    -- cDefine = colors.Cyan,
    -- cTSInclude = colors.Blue,
    -- cTSConstant = colors.Cyan,
    -- cTSConstMacro = colors.Purple,
    -- cTSOperator = colors.Purple,
}

hl.langs.cpp = {
    -- cppStatement = { fg = c.purple, fmt = "bold" },
    -- cppTSInclude = colors.Blue,
    -- cppTSConstant = colors.Cyan,
    -- cppTSConstMacro = colors.Purple,
    -- cppTSOperator = colors.Purple,
}

hl.langs.markdown = {
    -- markdownBlockquote = colors.Grey,
    -- markdownBold = {fg = c.none, fmt = "bold"},
    -- markdownBoldDelimiter = colors.Grey,
    -- markdownCode = colors.Green,
    -- markdownCodeBlock = colors.Green,
    -- markdownCodeDelimiter = colors.Yellow,
    -- markdownH1 = {fg = c.red, fmt = "bold"},
    -- markdownH2 = {fg = c.purple, fmt = "bold"},
    -- markdownH3 = {fg = c.orange, fmt = "bold"},
    -- markdownH4 = {fg = c.red, fmt = "bold"},
    -- markdownH5 = {fg = c.purple, fmt = "bold"},
    -- markdownH6 = {fg = c.orange, fmt = "bold"},
    -- markdownHeadingDelimiter = colors.Grey,
    -- markdownHeadingRule = colors.Grey,
    -- markdownId = colors.Yellow,
    -- markdownIdDeclaration = colors.Red,
    -- markdownItalic = {fg = c.none, fmt = "italic"},
    -- markdownItalicDelimiter = {fg = c.grey, fmt = "italic"},
    -- markdownLinkDelimiter = colors.Grey,
    -- markdownLinkText = colors.Red,
    -- markdownLinkTextDelimiter = colors.Grey,
    -- markdownListMarker = colors.Red,
    -- markdownOrderedListMarker = colors.Red,
    -- markdownRule = colors.Purple,
    -- markdownUrl = {fg = c.blue, fmt = "underline"},
    -- markdownUrlDelimiter = colors.Grey,
    -- markdownUrlTitleDelimiter = colors.Green
}

hl.langs.php = {
    -- phpFunctions = {fg = c.fg, fmt = cfg.code_style.functions},
    -- phpMethods = colors.Cyan,
    -- phpStructure = colors.Purple,
    -- phpOperator = colors.Purple,
    -- phpMemberSelector = colors.Fg,
    -- phpVarSelector = {fg = c.orange, fmt = cfg.code_style.variables},
    -- phpIdentifier = {fg = c.orange, fmt = cfg.code_style.variables},
    -- phpBoolean = colors.Cyan,
    -- phpNumber = colors.Orange,
    -- phpHereDoc = colors.Green,
    -- phpNowDoc = colors.Green,
    -- phpSCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    -- phpFCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    -- phpRegion = colors.Blue
}

hl.langs.scala = {
    -- scalaNameDefinition = colors.Fg,
    -- scalaInterpolationBoundary = colors.Purple,
    -- scalaInterpolation = colors.Purple,
    -- scalaTypeOperator = colors.Red,
    -- scalaOperator = colors.Red,
    -- scalaKeywordModifier = {fg = c.red, fmt = cfg.code_style.keywords},
}

hl.langs.tex = {
    -- latexTSInclude = colors.Blue,
    -- latexTSFuncMacro = {fg = c.fg, fmt = cfg.code_style.functions},
    -- latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
    -- latexTSEnvironmentName = colors.Yellow,
    -- texCmdEnv = colors.Cyan,
    -- texEnvArgName = colors.Yellow,
    -- latexTSTitle = colors.Green,
    -- latexTSType = colors.Blue,
    -- latexTSMath   = colors.Orange,
    -- texMathZoneX  = colors.Orange,
    -- texMathZoneXX = colors.Orange,
    -- texMathDelimZone = colors.LightGrey,
    -- texMathDelim = colors.Purple,
    -- texMathOper = colors.Red,
    -- texCmd = colors.Purple,
    -- texCmdPart = colors.Blue,
    -- texCmdPackage = colors.Blue,
    -- texPgfType = colors.Yellow,
}

hl.langs.vim = {
    -- vimOption = colors.Red,
    -- vimSetEqual = colors.Yellow,
    -- vimMap = colors.Purple,
    -- vimMapModKey = colors.Orange,
    -- vimNotation = colors.Red,
    -- vimMapLhs = colors.Fg,
    -- vimMapRhs = colors.Blue,
    -- vimVar = {fg = c.fg, fmt = cfg.code_style.variables},
    -- vimCommentTitle = {fg = c.light_grey, fmt = cfg.code_style.comments},
}

local lsp_kind_icons_color = {
    Default = c.purple,
    Array = c.yellow,
    Boolean = c.orange,
    Class = c.yellow,
    Color = c.green,
    Constant = c.orange,
    Constructor = c.blue,
    Enum = c.purple,
    EnumMember = c.yellow,
    Event = c.yellow,
    Field = c.purple,
    File = c.blue,
    Folder = c.orange,
    Function = c.blue,
    Interface = c.green,
    Key = c.cyan,
    Keyword = c.cyan,
    Method = c.blue,
    Module = c.orange,
    Namespace = c.red,
    Null = c.grey,
    Number = c.orange,
    Object = c.red,
    Operator = c.red,
    Package = c.yellow,
    Property = c.cyan,
    Reference = c.orange,
    Snippet = c.red,
    String = c.green,
    Struct = c.purple,
    Text = c.light_grey,
    TypeParameter = c.red,
    Unit = c.green,
    Value = c.orange,
    Variable = c.purple,
}

function H.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
        hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('watermelon.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "watermelon.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.watermelon_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return H
