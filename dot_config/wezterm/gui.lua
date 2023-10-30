--[[
 ██████╗ ██╗   ██╗██╗
██╔════╝ ██║   ██║██║
██║  ███╗██║   ██║██║
██║   ██║██║   ██║██║
╚██████╔╝╚██████╔╝██║
 ╚═════╝  ╚═════╝ ╚═╝
--]]
local w = require('wezterm')
local module = {}

module.command_palette_bg_color = "#181825"
module.command_palette_fg_color = "#cdd6f4"

module.window_padding = {
  left = 7,
  right = 7,
  top = 7,
  bottom = 0,
}

module.color_scheme = "Catppuccin Mocha"
module.tab_bar_at_bottom = true
module.use_fancy_tab_bar = false

module.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

module.show_tab_index_in_tab_bar = true
module.status_update_interval = 1000


w.on("update-status", function(window, pane)
  local stat = window:active_workspace()
  local stat_color = "#f38ba8"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#b4befe"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#cba6f7"
  end

  -- Current working directory
  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
  local cwd = pane:get_current_working_dir().file_path
  cwd = cwd and basename(cwd) or ""
  -- Current command
  local cmd = pane:get_foreground_process_name()
  cmd = cmd and basename(cmd) or ""

  -- Time
  local time = w.strftime("%H:%M:%S")

  -- Left status (left of the tab line)
  window:set_left_status(w.format({
    { Background = { Color = "#6e738d" } },
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = w.nerdfonts.oct_table .. "  " .. stat },
    { Text = " " },
  }))

  -- Right status
  window:set_right_status(w.format({
    -- Wezterm has a built-in nerd fonts
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    { Text = w.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = w.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = w.nerdfonts.md_clock .. "  " .. time },
    { Text = "  " },
  }))
end);

return module
