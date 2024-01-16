local w = require("wezterm")
local M = {}
M.separator_char = " "

M.colors = {
  date_fg = "#c0caf5",
  date_bg = "#1a1b26",
  battery_fg = "#c0caf5",
  battery_bg = "#1a1b26",
  separator_fg = "#c0caf5",
  separator_bg = "#1a1b26",
  padding_bg = "#1a1b26",
}
function os.capture(cmd, raw)
  local handle = assert(io.popen(cmd, "r"))
  local output = assert(handle:read("*a"))

  handle:close()

  if raw then
    return output
  end

  output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")

  return output
end

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

M.calculate_padding = function(window)
  local n = 0
  for _, tab in pairs(window:mux_window():tabs()) do
    n=n+1
  end
  return n
end
M.set_hostname = function()
  M.push(w.hostname(), " ", M.colors.date_fg, M.colors.date_bg, true)
end

M.setup = function()
  w.on("update-status", function(window, _)
    M.cells = {}
    M.push(window:active_workspace():gsub("^.*/", ""), "  ", M.colors.battery_fg, M.colors.battery_bg, false)
    -- M.push(string.rep(" ", final_padding+(-5+2*n-1)), "", "", M.colors.padding_bg, false)
    -- -4 -2 0 2 4
    -- M.push("|"..tab_len.."|", "", "", M.colors.padding_bg, false)
    window:set_left_status(w.format(M.cells))
  end)
end

return M
