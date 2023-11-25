--[[
  ███████╗ ██████╗ ███╗   ██╗████████╗███████╗
  ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝
  █████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗
  ██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║
  ██║     ╚██████╔╝██║ ╚████║   ██║   ███████║
  ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝
--]]
local w = require('wezterm')
local M = {}
M.font = w.font_with_fallback({
  "Hack",
  { family = "Symbols Nerd Font Mono", scale = 0.75 }
})
M.use_cap_height_to_scale_fallback_fonts = true
M.font_size = 12.0

return M
