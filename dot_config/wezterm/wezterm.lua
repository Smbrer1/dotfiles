--[[
  ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
  ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
  ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
  ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
  ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
   ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
--]]

local merge = require("utils.utils").merge
local mappings = require("mappings")
local mtt = require("domains.mtt")
local fonts = require("fonts")
local gui = require("gui")
local shell = require("shell")
local colors = require("colors")
-- local background = require('background')

local config = merge(mappings, mtt, fonts, gui, shell, colors)

require("setups.right-status").setup()
require("setups.left-status").setup()
require("setups.notify").setup()
require("tabs").setup(config)
-- require("setups.tab-title").setup()
local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.apply_to_config(config)
workspace_switcher.set_workspace_formatter(function(label)
  return wezterm.format({
    { Attribute = { Intensity = "Bold" } },
    { Foreground = { Color = "#7AA2F7" } },
    { Text = "󱂬: " .. label },
  })
end)

return config
