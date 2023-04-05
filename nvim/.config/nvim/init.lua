-- the core plugins
local g_configs = require("core")
-- set color theme here
g_configs.colorscheme = "onedark"
-- whether to see navigator bar in the top
g_configs.navigator_on = false
-- set the logo. see ./lua/ui/style/header.lua
g_configs.dashboard_logo = "Astronaut"

-- setup all plugin
require("plugins-setup")
