--[[
███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
--]]
local w = require('wezterm')
local act = w.action

local is_nvim = require('utils').is_nvim
local workspace_switcher = require("workspace_switcher.workspace_switcher")
local module = {}

module.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }


local direction_keys = {
  Left = 'h',
  Down = 'j',
  Up = 'k',
  Right = 'l',
  -- reverse lookup
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'CTRL|ALT' or 'CTRL',
    action = w.action_callback(function(win, pane)
      if is_nvim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'CTRL|ALT' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

local function split_screen(direction, key)
  return {
    key = key,
    mods = "ALT",
    action = w.action_callback(function(win, pane)
      if is_nvim(pane) then
        win:perform_action({ SplitPane = { direction = direction, size = { Percent = 20 } } }, pane)
      else
        win:perform_action({ SplitPane = { direction = direction, size = { Percent = 50 } } }, pane)
      end
    end)
  }
end

module.keys = {
  split_screen("Right", "/"),
  split_screen("Down", "'"),
  { key = "z", mods = "ALT",    action = "TogglePaneZoomState" },
  { key = "q", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = false } }) },

  -- TAB Section
  -- Rename TAB
  {
    key = 'R',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = w.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  -- TAB Creation
  { key = 'c', mods = 'LEADER',   action = act.SpawnTab 'CurrentPaneDomain' },
  -- TAB Navigation
  { key = "n", mods = "ALT",      action = act({ ActivateTabRelative = 1 }) },
  { key = "m", mods = "ALT",      action = act({ ActivateTabRelative = -1 }) },
  { key = "t", mods = "ALT|CTRL", action = act.ShowTabNavigator },

  -- Workspaces

  { key = 'w', mods = 'LEADER',   action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES|DOMAINS" } },
  {
    key = "s",
    mods = "LEADER",
    action = workspace_switcher.workspace_switcher(function(label)
      return w.format({
        { Text = "󱂬: " .. label },
      })
    end),
  },



  -- Move Between Panes With Navigator.nvim
  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),
  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),
  { key = 'c', mods = 'CTRL|SHIFT', action = act { CopyTo = 'ClipboardAndPrimarySelection' } },
  { key = 'p', mods = 'CTRL',       action = act.ActivateCommandPalette },
  { key = "m", mods = "LEADER",     action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
}

module.key_tables = {
  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  }
}

-- Navigate through tabs with 1-9 keybinds
for i = 1, 9 do
  -- ALT + number to activate that tab
  table.insert(module.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

return module
