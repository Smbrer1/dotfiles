--[[
   ██████╗ ██╗   ██╗██╗
  ██╔════╝ ██║   ██║██║
  ██║  ███╗██║   ██║██║
  ██║   ██║██║   ██║██║
  ╚██████╔╝╚██████╔╝██║
   ╚═════╝  ╚═════╝ ╚═╝
--]]
local M = {}

M.command_palette_bg_color = "#181825"
M.command_palette_fg_color = "#cdd6f4"
M.enable_wayland = true
M.front_end = 'OpenGL'

M.window_padding = {
  left = 7,
  right = 7,
  top = 7,
  bottom = 0,
}

M.color_scheme = "Catppuccin Mocha"
M.tab_bar_at_bottom = true
M.use_fancy_tab_bar = false
M.colors = {
  tab_bar = {
    background = "#1e1e2e",
    new_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#1e1e2e",
    }

  },
}

M.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.7,
}

M.show_tab_index_in_tab_bar = true
M.status_update_interval = 1000

return M
