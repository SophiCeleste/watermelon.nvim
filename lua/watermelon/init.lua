local I = {}

I.styles_list = { 'dark', 'light' }

---Change watermelon option (vim.g.watermelon_config.option)
---It can't be changed directly by modifying thit field due to a Neovim lua bug with global variables (watermelon_config is a global variable)
---@param opt string: option name
---@param value any: new value
function I.set_options(opt, value)
    local cfg = vim.g.watermelon_config
    cfg[opt] = value
    vim.g.watermelon_config = cfg
end

---Apply the color scheme (same as ':colorscheme watermelon')
function I.colorscheme()
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
    vim.o.termguicolors = true
    vim.g.colors_name = 'watermelon'
    --if vim.o.background == 'light' then
    --    I.set_options('style', 'light')
    --elseif vim.g.watermelon_config.style == then
    --    I.set_options('style', 'light')
    --end
    require('watermelon.highlights').setup()
    require('watermelon.terminal').setup()
end

---Toggle between styles
function I.toggle()
    local index = vim.g.watermelon_config.toggle_style_index + 1
    if index > #vim.g.watermelon_config.toggle_style_list then index = 1 end
    I.set_options('style', vim.g.watermelon_config.toggle_style_index[index])
    I.set_options('toggle_style_index', index)
    if vim.g.watermelon_config.style == 'light' then
        vim.o.background = 'light'
    else
        vim.o.background = 'dark'
    end
    vim.api.nvim_command('colorscheme watermelon')
end

local default_config = {
    -- Main options --
    style = 'dark',                 -- TODO: add more styles
    toggle_style_key = nil,
    toggle_style_list = I.styles_list,
    transparent = true,             -- set to false to turn off the transparent background
    term_colors = true,             -- enable the terminal colors
    ending_tildes = false,          -- show / hide the end-of-buffer tildes
    cmp_itemkind_reverse = false,   -- reverse the item kind highlights in the cmp menu

    -- Changing Formats --
    code_style = {
          bool = 'bold',
          comments = 'italic',
          constants = 'bold',
          error = 'bold',
          functions = 'bold',
          keywords = 'none',
          preproc = 'bold',
          strings = 'none',
          title = 'bold',
          variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false,        -- center bar transparency
    },

    -- Custom highlights --
    colors = {},                    -- override default colors
    highlights = {},                -- override highlight groups

    -- Plugins related --
    diagnostics = {
        darker = true,              -- darker colors for diagnostics
        undercurl = true,           -- use undercurl for diagnostics
        background = true,          -- use background color for virtual text
    },
}

---Setup watermelon.nvim options, without applying colorscheme
---@param opts table: a table containing options
function I.setup(opts)
    -- if it's the first time setup() is called
    if not vim.g.watermelon_config or not vim.g.watermelon_config.loaded then
        vim.g.watermelon_config = vim.tbl_deep_extend('keep', vim.g.watermelon_config or {}, default_config)
        I.set_options('loaded', true)
        I.set_options('toggle_style_index', 0)
    end
    if opts then
        vim.g.watermelon_config = vim.tbl_deep_extend('force', vim.g.watermelon_config, opts)
        -- this table can't be extended, it has to be replaced
        if opts.toggle_style_list then
            I.set_options('toggle_style_list', opts.toggle_style_list)
        end
    end
    if vim.g.watermelon_config.toggle_style_key then
        vim.api.nvim_set_keymap('n', vim.g.watermelon_config.toggle_style_key, '<cmd>lua require("watermelon").toggle()<cr>', { noremap = true, silent = true })
    end
end

function I.load()
    vim.api.nvim_command('colorscheme watermelon')
end

return I
