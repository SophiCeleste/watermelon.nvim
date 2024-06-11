local util = {}

util.bg = '#000000'
util.fg = '#ffffff'

local function hexToRgb(hex_str)
    local hex = '[abcdef0-9][abcdef0-9]'
    local pattern = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pattern) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

    local r, g, b = string.match(hex_str, pattern)
    return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg.
function util.blend(fg, bg, alpha)
    bg = hexToRgb(bg)
    fg = hexToRgb(fg)

    local blendChannel = function(i)
        local result = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, result), 255) + 0.5)
    end

    return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, ammount, bg)
    return util.blend(hex, bg or util.bg, math.abs(ammount))
end

function util.lighten(hex, ammount, fg)
    return util.blend(hex, fg or util.fg, math.abs(ammount))
end

return util
