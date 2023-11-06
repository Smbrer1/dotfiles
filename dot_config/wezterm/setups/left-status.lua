local w = require("wezterm")
local M = {}
M.separator_char = " "

M.colors = {
  date_fg = "#cdd6f4",
  date_bg = "#1e1e2e",
  battery_fg = "#cdd6f4",
  battery_bg = "#1e1e2e",
  separator_fg = "#cdd6f4",
  separator_bg = "#1e1e2e",
}

M.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

---@param text string
---@param icon string
---@param fg string
---@param bg string
---@param separate boolean
M.push = function(text, icon, fg, bg, separate)
  table.insert(M.cells, { Foreground = { Color = fg } })
  table.insert(M.cells, { Background = { Color = bg } })
  table.insert(M.cells, { Attribute = { Intensity = "Bold" } })
  table.insert(M.cells, { Text = icon .. " " .. text .. " " })

  if separate then
    table.insert(M.cells, { Foreground = { Color = M.colors.separator_fg } })
    table.insert(M.cells, { Background = { Color = M.colors.separator_bg } })
    table.insert(M.cells, { Text = M.separator_char })
  end

  table.insert(M.cells, "ResetAttributes")
end

M.set_hostname = function()
  M.push(w.hostname(), " ", M.colors.date_fg, M.colors.date_bg, true)
end

M.setup = function()
  w.on("update-status", function(window, _)
    M.cells = {}
    M.set_hostname()
    window:set_left_status(w.format(M.cells))
  end)
end

return M
