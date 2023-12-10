--[[
   ██████╗ ██╗   ██╗██╗
  ██╔════╝ ██║   ██║██║
  ██║  ███╗██║   ██║██║
  ██║   ██║██║   ██║██║
  ╚██████╔╝╚██████╔╝██║
   ╚═════╝  ╚═════╝ ╚═╝
--]]
local M = {}

M.command_palette_bg_color = "#1A1B26"
M.command_palette_fg_color = "#c0caf5"

local wezterm = require('wezterm')
local gpus = wezterm.gui.enumerate_gpus()

-- M.webgpu_preferred_adapter = gpus[1]
-- M.front_end = 'WebGpu'
-- M.enable_wayland = true
M.enable_wayland = false
M.front_end = 'WebGpu'

M.window_padding = {
  left = 7,
  right = 7,
  top = 7,
  bottom = 0,
}

M.color_scheme = "Tokyo Night"
M.colors = {
  tab_bar = {
    background = "#1A1B26",
    new_tab = {
      bg_color = "#1A1B26",
      fg_color = "#1A1B26",
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
