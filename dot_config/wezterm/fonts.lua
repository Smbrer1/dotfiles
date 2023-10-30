--[[
███████╗ ██████╗ ███╗   ██╗████████╗███████╗
██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝
█████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗
██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║
██║     ╚██████╔╝██║ ╚████║   ██║   ███████║
╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝
--]]
local w = require('wezterm')
local module = {}
module.font = w.font_with_fallback({
  "Hack",
  { family = "Symbols Nerd Font Mono", scale = 0.75 }
})
module.use_cap_height_to_scale_fallback_fonts = true
module.font_size = 16.0

return module
