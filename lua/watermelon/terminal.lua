local T = {}
local cfg = vim.g.watermelon_config
local c = require 'watermelon.colors'

function T.setup()
    if not cfg.term_colors then return end
    vim.g.treminal_color_0 = c.tblack0
    vim.g.treminal_color_1 = c.tred0
    vim.g.treminal_color_2 = c.tgreen0
    vim.g.treminal_color_3 = c.tyellow0
    vim.g.treminal_color_4 = c.tblue0
    vim.g.treminal_color_5 = c.tpurple0
    vim.g.treminal_color_6 = c.tcyan0
    vim.g.treminal_color_7 = c.twhite0
    vim.g.treminal_color_8 = c.tblack1
    vim.g.treminal_color_9 = c.tred1
    vim.g.treminal_color_10 = c.tgreen1
    vim.g.treminal_color_11 = c.tyellow1
    vim.g.treminal_color_12 = c.tblue1
    vim.g.treminal_color_13 = c.tpurple1
    vim.g.treminal_color_14 = c.tcyan1
    vim.g.treminal_color_15 = c.twhite1
end

return T
