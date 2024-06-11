for i in pairs(package.loaded) do
    if i:match(".*watermelon.*") then package.loaded[i] = nil end
end

require('watermelon').setup()
require('watermelon').colorscheme()
