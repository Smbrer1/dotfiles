-- Pull in the wezterm API
local w = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if w.config_builder then
  config = w.config_builder()
end

config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#cdd6f4"
config.font = w.font_with_fallback({
  "Hack",
  { family = "Symbols Nerd Font Mono", scale = 0.75 }
})
config.use_cap_height_to_scale_fallback_fonts = true
config.font_size = 16.0

config.window_padding = {
  left = 7,
  right = 7,
  top = 7,
  bottom = 0,
}

config.color_scheme = "Catppuccin Mocha"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false



-- p10k like status bar
w.on("update-right-status", function(window, _)
  local date = w.strftime '%H:%M:%S %d-%m-%Y';
  local hostname = " " .. w.hostname() .. " ";

  window:set_right_status(
    w.format({
      { Foreground = { Color = "#b4befe" } },
      { Background = { Color = "#11111b" } },
      { Text = "" },
      { Foreground = { Color = "#11111b" } },
      { Background = { Color = "#b4befe" } },
      { Text = date },
      { Foreground = { Color = "#1e1e2e" } },
      { Background = { Color = "#b4befe" } },
      { Text = "" },
      { Foreground = { Color = "#cdd6f4" } },
      { Background = { Color = "#1e1e2e" } },
      { Text = hostname },
    })
  );
end);

config.keys = require("mappings")
config.ssh_domains = require("domains.mtt")

-- Navigate through tabs with 1-9 keybinds
for i = 1, 9 do
  -- ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = w.action.ActivateTab(i - 1),
  })
end

return config
-- vim: ts=2 sts=2 sw=2 et
