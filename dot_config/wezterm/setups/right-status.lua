local w = require("wezterm")
local M = {}

M.separator_char = "| "

M.colors = {
  date_fg = "#c0caf5",
  date_bg = "#1a1b26",
  battery_fg = "#c0caf5",
  battery_bg = "#1a1b26",
  separator_fg = "#c0caf5",
  separator_bg = "#1a1b26",
  padding_bg = "#1a1b26",
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

M.set_date = function()
  local date = w.strftime(" %a %H:%M")
  M.push(date, "", M.colors.date_fg, M.colors.date_bg, true)
end

M.set_zina = function()
  M.push("󰠧", "[ZINA]", M.colors.battery_fg, M.colors.battery_bg, false)
end

M.setup = function()
  w.on("update-right-status", function(window, _)
    M.cells = {}
    -- M.set_date()
    M.set_zina()
    window:set_right_status(w.format(M.cells))
  end)
end

return M
