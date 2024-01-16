local M = {}
local wezterm = require("wezterm")

-- workspace switcher

local function workspace(config)
  local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
  workspace_switcher.set_workspace_formatter(function(label)
    return wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = "#7AA2F7" } },
      { Text = "󱂬: " .. label },
    })
  end)
  workspace_switcher.apply_to_config(config)
end

local function zen_mode()
  -- nvim ZEN_MODE
end

function M.setup(config)
  workspace(config)
  zen_mode()
end

return M
