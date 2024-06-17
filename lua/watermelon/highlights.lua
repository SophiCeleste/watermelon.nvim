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
    Normal              = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg1 },
    Terminal            = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg0 },
    EndOfBuffer         = { fg = cfg.ending_tildes and c.none or c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    FoldColumn          = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg1 },
    Folded              = { fg = c.fg0, bg = cfg.transparent and c.none or c.bg2 },
    SignColumn          = { fg = c.white, bg = c.bg0 },
    ToolbarLine         = { fg = c.fg0 },
    Cursor              = { fmt = "reverse" },
    vCursor             = { fmt = "reverse" },
    iCursor             = { fmt = "reverse" },
    lCursor             = { fmt = "reverse" },
    CursorIM            = { fmt = "reverse" },
    CursorColumn        = { bg = c.bg0 },
    CursorLine          = { bg = c.bg0 },
    ColorColumn         = { bg = c.bg0 },
    CursorLineNr        = { fg = c.white },
    LineNr              = { fg = c.white },
    LineNrAbove         = { fg = c.fg2 },
    LineNrBelow         = { fg = c.fg2 },
    Conceal             = { fg = c.fg2, bg = c.bg1 },
    Added               = { fg = c.limegreen },
    Removed             = { fg = c.red },
    Changed             = { fg = c.blue },
    DiffAdd             = { fg = c.limegreen, bg = c.bg0 },
    DiffChange          = { fg = c.blue, bg = c.bg0 },
    DiffDelete          = { fg = c.red, bg = c.bg0 },
    DiffText            = { fg = c.lightblue, bg= c.bg0 },
    DiffAdded           = { fg = c.limegreen },
    DiffChanged         = { fg = c.blue },
    DiffRemoved         = { fg = c.red },
    DiffDeleted         = { fg = c.red },
    DiffFile            = { fg = c.lightblue },
    DiffIndexLine       = { fg = c.fg1 },
    Directory           = { fg = c.white },
    ErrorMsg            = { fg = c.err, fmt = "bold" },
    WarningMsg          = { fg = c.wrn, fmt = "bold" },
    MoreMsg             = { fg = c.msg, fmt = "bold" },
    CurSearch           = { fg = c.bg0, bg = c.green },
    IncSearch           = { fg = c.bg0, bg = c.green },
    Search              = { fg = c.bg0, bg = c.green },
    Substitute          = { fg = c.bg0, bg = c.green },
    MatchParen          = { fg = c.green, bg = c.bg0 },
    NonText             = { fg = c.fg2 },
    Whitespace          = { fg = c.fg2 },
    SpecialKey          = { fg = c.fg2 },
    Pmenu               = { fg = c.white, bg = c.bg2 },
    PmenuSbar           = { fg = c.none, bg = c.bg1 },
    PmenuSel            = { fg = c.bg0, bg = c.green },
    WildMenu            = { fg = c.bg0, bg = c.msg },
    PmenuThumb          = { fg = c.none, bg = c.fg0 },
    Question            = { fg = c.wrn },
    SpellBad            = { fg = c.none, fmt = "undercurl", sp = c.err },
    SpellCap            = { fg = c.none, fmt = "undercurl", sp = c.msg },
    SpellLocal          = { fg = c.none, fmt = "undercurl", sp = c.msg },
    SpellRare           = { fg = c.none, fmt = "undercurl", sp = c.wrn },
    StatusLine          = { fg = c.black, bg = c.darkgreen },
    StatusLineTerm      = { fg = c.black, bg = c.darkgreen },
    StatusLineNC        = { fg = c.fg1, bg = c.bg0 },
    StatusLineTermNC    = { fg = c.fg1, bg = c.bg0 },
    TabLine             = { fg = c.fg2, bg = c.bg0 },
    TabLineFill         = { fg = c.fg1, bg = c.bg1 },
    TabLineSel          = { fg = c.fg0, bg = c.bg2 },
    WinSeparator        = { fg = c.darkgreen, bg = c.bg0 },
    Visual              = { fg = c.black, bg = c.green },
    VisualNOS           = { fg = c.black, bg = c.darkgreen, fmt = "underline" },
    QuickFixLine        = { fg = c.blue, fmt = "underline" },
    Debug               = { fg = c.yellow },
    debugPC             = { fg = c.bg0, bg = c.green },
    debugBreakpoint     = { fg = c.bg0, bg = c.red },
    ToolbarButton       = { fg = c.bg0, bg = c.bg_blue },
    FloatBorder         = { fg = c.darkgreen, bg = c.bg0 },
    NormalFloat         = { fg = c.white, bg = c.bg2 },
}

hl.syntax = {
    Annotation          = { fg = c.yellow },
    Attritbute          = { fg = c.darkgreen },
    Boolean             = { fg = c.lightblue, fmt = cfg.code_style.bool }, --add code style bool
    Bracket             = { fg = c.limegreen },
    Character           = { fg = c.pink },
    Comment             = { fg = c.fg2, fmt = cfg.code_style.comments },
    Conditional         = { fg = c.red },
    Constant            = { fg = c.lightblue },
    Define              = { fg = c.yellow, fmt = cfg.code_style.preproc },
    Delimiter           = { fg = c.fg0 },
    Error               = { fg = c.err, fmt = cfg.code_style.error },
    Exception           = { fg = c.darkpink },
    Field               = { fg = c.yellow },
    Float               = { fg = c.blue },
    Function            = { fg = c.darkgreen, fmt = 'bold' },
    Identifier          = { fg = c.lightblue, fmt = cfg.code_style.variables },
    Include             = { fg = c.yellow, fmt = cfg.code_style.preproc },
    Keyword             = { fg = c.red, fmt = cfg.code_style.keywords },
    Label               = { fg = c.red, fmt = cfg.code_style.preproc },
    Macro               = { fg = c.red, fmt = cfg.code_style.preproc },
    Method              = { fg = c.darkgreen, fmt = cfg.code_style.methods },
    Module              = { fg = c.yellow },
    Namespace           = { fg = c.yellow },
    Number              = { fg = c.blue },
    Operator            = { fg = c.white },
    Parameter           = { fg = c.green },
    PreCondit           = { fg = c.yellow, fmt = cfg.code_style.preproc },
    PreProc             = { fg = c.yellow, fmt = cfg.code_style.preproc },
    Property            = { fg = c.white },
    Regex               = { fg = c.limegreen },
    Repeat              = { fg = c.red },
    Special             = { fg = c.lightblue },
    SpecialChar         = { fg = c.lightblue },
    SpecialComment      = { fg = c.fg1, fmt = cfg.code_style.comments },
    Statement           = { fg = c.red, fmt = cfg.code_style.keywords },
    StorageClass        = { fg = c.red, fmt = cfg.code_style.keywords },
    String              = { fg = c.pink, fmt = cfg.code_style.strings },
    Structure           = { fg = c.lightblue },
    Tag                 = { fg = c.lightblue },
    Title               = { fg = c.darkgreen, fmt = cfg.code_style.title },
    Todo                = { fg = c.blue, fmt = cfg.code_style.comments },
    Type                = { fg = c.darkpink },
    Typedef             = { fg = c.darkpink },
    Variable            = { fg = c.white }
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- nvim-treesitter@0.9.2 and after
        ["@annotation"]                 = hl.syntax.Annotation,
        ["@attribute"]                  = hl.syntax.Attritbute,
        ["@attribute.typescript"]       = hl.syntax.Attritbute,
        ["@boolean"]                    = hl.syntax.Boolean,
        ["@character"]                  = hl.syntax.Character,
        ["@comment"]                    = hl.syntax.Comment,
        ["@comment.todo"]               = hl.syntax.Todo,
        ["@comment.todo.unchecked"]     = { fg = c.blue, fmt = cfg.code_style.comments },
        ["@comment.todo.checked"]       = { fg = c.limegreen, fmt = cfg.code_style.comments },
        ["@constant"]                   = hl.syntax.Constant,
        ["@constant.builtin"]           = hl.syntax.Constant,
        ["@constant.macro"]             = hl.syntax.Constant,
        ["@constructor"]                = { fg = c.limegreen, fmt = "bold" },
        ["@diff.add"]                   = hl.common.DiffAdded,
        ["@diff.delete"]                = hl.common.DiffDeleted,
        ["@diff.plus"]                  = hl.common.DiffAdded,
        ["@diff.minus"]                 = hl.common.DiffDeleted,
        ["@diff.delta"]                 = hl.common.DiffChanged,
        ["@error"]                      = hl.syntax.Error,
        ["@function"]                   = hl.syntax.Function,
        ["@function.builtin"]           = hl.syntax.Function,
        ["@function.macro"]             = hl.syntax.Function,
        ["@function.method"]            = hl.syntax.Method,
        ["@keyword"]                    = hl.syntax.Keyword,
        ["@keyword.conditional"]        = hl.syntax.Conditional,
        ["@keyword.directive"]          = hl.syntax.Keyword,
        ["@keyword.exception"]          = hl.syntax.Exception,
        ["@keyword.function"]           = { fg = c.darkgreen, fmt = cfg.code_style.functions },
        ["@keyword.import"]             = hl.syntax.Include,
        ["@keyword.operator"]           = hl.syntax.Operator,
        ["@keyword.repeat"]             = hl.syntax.Repeat,
        ["@label"]                      = hl.syntax.Label,
        ["@markup.emphasis"]            = { fg = c.white, fmt = 'italic' },
        ["@markup.environment"]         = hl.common.Normal,
        ["@markup.environment.name"]    = hl.common.Normal,
        ["@markup.heading"]             = hl.syntax.Title,
        ["@markup.link"]                = { fg = c.darkpink },
        ["@markup.link.url"]            = { fg = c.lightblue, fmt = 'underline' },
        ["@markup.list"]                = { fg = c.red },
        ["@markup.math"]                = { fg = c.blue },
        ["@markup.raw"]                 = { fg = c.darkpink },
        ["@markup.strike"]              = { fg = c.fg0, fmt = 'strikethrough' },
        ["@markup.strong"]              = { fg = c.fg0, fmt = 'bold' },
        ["@markup.underline"]           = { fg = c.fg0, fmt = 'underline' },
        ["@module"]                     = hl.syntax.Module,
        ["@none"]                       = hl.common.Normal,
        ["@number"]                     = hl.syntax.Number,
        ["@number.float"]               = hl.syntax.Number,
        ["@operator"]                   = hl.syntax.Operator,
        ["@parameter.reference"]        = hl.syntax.Parameter,
        ["@property"]                   = hl.syntax.Property,
        ["@punctuation.delimiter"]      = hl.syntax.Delimiter,
        ["@punctuation.bracket"]        = hl.syntax.Bracket,
        ["@string"]                     = hl.syntax.String,
        ["@string.regexp"]              = hl.syntax.Regex,
        ["@string.escape"]              = { fg = c.darkpink, fmt = cfg.code_style.strings },
        ["@string.special.symbol"]      = hl.syntax.Special,
        ["@tag"]                        = hl.syntax.Tag,
        ["@tag.attribute"]              = hl.syntax.Attritbute,
        ["@tag.delimiter"]              = hl.syntax.Delimiter,
        ["@text"]                       = hl.common.Normal,
        ["@note"]                       = hl.syntax.SpecialComment,
        ["@warning"]                    = hl.common.WarningMsg,
        ["@danger"]                     = hl.common.ErrorMsg,
        ["@type"]                       = hl.syntax.Type,
        ["@type.builtin"]               = hl.syntax.Type,
        ["@variable"]                   = hl.syntax.Variable,
        ["@variable.builtin"]           = hl.syntax.Variable,
        ["@variable.member"]            = hl.syntax.Variable,
        ["@variable.parameter"]         = hl.syntax.Parameter,
        ["@markup.heading.1.markdown"]          = hl.syntax.Title,
        ["@markup.heading.2.markdown"]          = hl.syntax.Title,
        ["@markup.heading.3.markdown"]          = hl.syntax.Title,
        ["@markup.heading.4.markdown"]          = hl.syntax.Title,
        ["@markup.heading.5.markdown"]          = hl.syntax.Title,
        ["@markup.heading.6.markdown"]          = hl.syntax.Title,
        ["@markup.heading.1.marker.markdown"]   = hl.syntax.Title,
        ["@markup.heading.2.marker.markdown"]   = hl.syntax.Title,
        ["@markup.heading.3.marker.markdown"]   = hl.syntax.Title,
        ["@markup.heading.4.marker.markdown"]   = hl.syntax.Title,
        ["@markup.heading.5.marker.markdown"]   = hl.syntax.Title,
        ["@markup.heading.6.marker.markdown"]   = hl.syntax.Title,

        -- Old configuration for nvim-treesiter@0.9.1 and below
        ["@conditional"]            = hl.syntax.Conditional,
        ["@exception"]              = hl.syntax.Exception,
        ["@field"]                  = hl.syntax.Field,
        ["@float"]                  = hl.syntax.Float,
        ["@include"]                = hl.syntax.Include,
        ["@method"]                 = hl.syntax.Method,
        ["@namespace"]              = hl.syntax.Namespace,
        ["@parameter"]              = hl.syntax.Parameter,
        ["@preproc"]                = hl.syntax.PreProc,
        ["@punctuation.special"]    = hl.syntax.Special,
        ["@repeat"]                 = hl.syntax.Repeat,
        ["@string.regex"]           = hl.syntax.Regex,
        ["@text.strong"]            = { fg = c.fg0, fmt = 'bold' },
        ["@text.emphasis"]          = { fg = c.fg0, fmt = 'italic' },
        ["@text.underline"]         = { fg = c.fg0, fmt = 'underline' },
        ["@text.strike"]            = { fg = c.fg0, fmt = 'strikethrough' },
        ["@text.title"]             = hl.syntax.Title,
        ["@text.literal"]           = hl.syntax.Regex,
        ["@text.uri"]               = { fg = c.darkpink },
        ["@text.todo"]              = hl.syntax.Todo,
        ["@text.todo.unchecked"]    = { fg = c.blue, fmt = cfg.code_style.comments },
        ["@text.todo.checked"]      = { fg = c.blue, fmt = cfg.code_style.comments },
        ["@text.math"]              = hl.syntax.Number,
        ["@text.reference"]         = hl.syntax.Parameter, -- Add reference to syntax list
        ["@text.environment"]       = hl.common.Normal,
        ["@text.environment.name"]  = hl.common.Normal,
        ["@text.diff.add"]          = hl.common.DiffAdd,
        ["@text.diff.delete"]       = hl.common.DiffDelete,
    }
    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.comment"]                       = hl.syntax.Comment,
            ["@lsp.type.enum"]                          = hl.syntax.Type,
            ["@lsp.type.enumMember"]                    = hl.syntax.Constant,
            ["@lsp.type.interface"]                     = hl.syntax.Type,
            ["@lsp.type.typeParameter"]                 = hl.syntax.Parameter,
            ["@lsp.type.keyword"]                       = hl.syntax.Keyword,
            ["@lsp.type.namespace"]                     = hl.syntax.Namespace,
            ["@lsp.type.parameter"]                     = hl.syntax.Parameter,
            ["@lsp.type.property"]                      = hl.syntax.Property,
            ["@lsp.type.variable"]                      = hl.syntax.Variable,
            ["@lsp.type.macro"]                         = hl.syntax.Function,
            ["@lsp.type.method"]                        = hl.syntax.Method,
            ["@lsp.type.number"]                        = hl.syntax.Number,
            ["@lsp.type.generic"]                       = hl.common.Normal,
            ["@lsp.type.builtinType"]                   = hl.syntax.Type,
            ["@lsp.typemod.method.defaultLibrary"]      = hl.syntax.Function,
            ["@lsp.typemod.function.defaultLibrary"]    = hl.syntax.Function,
            ["@lsp.typemod.operator.injected"]          = hl.syntax.Operator,
            ["@lsp.typemod.string.injected"]            = hl.syntax.String,
            ["@lsp.typemod.variable.defaultLibrary"]    = hl.syntax.Variable,
            ["@lsp.typemod.variable.injected"]          = hl.syntax.Variable,
            ["@lsp.typemod.variable.static"]            = hl.syntax.Constant,
        }
    end
else
    hl.treesitter = {
        TSAnnotation            = hl.syntax.Annotation,
        TSAttribute             = hl.syntax.Attritbute,
        TSBoolean               = hl.syntax.Boolean,
        TSCharacter             = hl.syntax.Character,
        TSComment               = hl.syntax.Comment,
        TSConditional           = hl.syntax.Conditional,
        TSConstant              = hl.syntax.Constant,
        TSConstBuiltin          = hl.syntax.Constant,
        TSConstMacro            = hl.syntax.Constant,
        TSConstructor           = hl.syntax.Function,
        TSError                 = hl.syntax.Error,
        TSException             = hl.syntax.Exception,
        TSField                 = hl.syntax.Field,
        TSFloat                 = hl.syntax.Number,
        TSFunction              = hl.syntax.Function,
        TSFuncBuiltin           = hl.syntax.Function,
        TSFuncMacro             = hl.syntax.Function,
        TSInclude               = hl.syntax.Include,
        TSKeyword               = hl.syntax.Keyword,
        TSKeywordFunction       = { fg = c.darkgreen, fmt = cfg.code_style.functions },
        TSKeywordOperator       = hl.syntax.Operator,
        TSLabel                 = hl.syntax.Label,
        TSMethod                = hl.syntax.Method,
        TSNamespace             = hl.syntax.Include,
        TSNone                  = hl.common.Normal,
        TSNumber                = hl.syntax.Number,
        TSOperator              = hl.syntax.Operator,
        TSParameter             = hl.syntax.Parameter,
        TSParameterReference    = hl.syntax.Parameter,
        TSProperty              = hl.syntax.Property,
        TSPunctDelimiter        = hl.syntax.Delimiter,
        TSPunctBracket          = hl.syntax.Bracket,
        TSPunctSpecial          = hl.syntax.Special,
        TSRepeat                = hl.syntax.Repeat,
        TSString                = hl.syntax.String,
        TSStringRegex           = hl.syntax.Regex,
        TSStringEscape          = { fg = c.darkpink, fmt = cfg.code_style.strings },
        TSSymbol                = hl.syntax.Special,
        TSTag                   = hl.syntax.Tag,
        TSTagDelimiter          = hl.syntax.Delimiter,
        TSText                  = hl.common.Normal,
        TSStrong                = { fg = c.fg0, fmt = 'bold' },
        TSEmphasis              = { fg = c.fg0, fmt = 'bold' },
        TSUnderline             = { fg = c.fg0, fmt = 'bold' },
        TSStrike                = { fg = c.fg0, fmt = 'bold' },
        TSTitle                 = hl.syntax.Title,
        TSLiteral               = hl.syntax.Regex,
        TSURI                   = { fg = c.lightblue, fmt = 'underline' },
        TSMath                  = hl.syntax.Number,
        TSTextReference         = hl.syntax.Parameter,
        TSEnvironment           = hl.common.Normal,
        TSEnvironmentName       = hl.common.Normal,
        TSNote                  = hl.syntax.SpecialComment,
        TSWarning               = hl.common.WarningMsg,
        TSDanger                = hl.common.ErrorMsg,
        TSType                  = hl.syntax.Type,
        TSTypeBuiltin           = hl.syntax.Typedef,
        TSVariable              = hl.syntax.Variable,
        TSVariableBuiltin       = { fg = c.red, fmt = cfg.code_style.variables },
    }
end

----------------------------------------------------------------
--- PLUGIN SPECIFIC HIGHLIGHTS 
----------------------------------------------------------------

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

hl.plugins.cmp = {
    -- CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    -- CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    -- CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.whichkey = {
    -- WhichKey = colors.Red,
    -- WhichKeyDesc = colors.Blue,
    -- WhichKeyGroup = colors.Orange,
    -- WhichKeySeparator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd        = hl.common.Added,
    GitGutterChange     = hl.common.Changed,
    GitGutterDelete     = hl.common.Removed,
}

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

----------------------------------------------------------------
--- LANGUAGE SPECIFIC HIGHLIGHTS 
----------------------------------------------------------------

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
    -- cppTSOperator = colors.Purple
}

hl.langs.javascript = {
    ["@keyword.coroutine"]              = { fg = c.limegreen },
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
