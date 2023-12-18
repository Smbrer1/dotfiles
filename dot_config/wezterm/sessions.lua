local wezterm = require("wezterm")
local act = wezterm.action

---@alias action_callback any

---@type string
local zoxide_path = "zoxide"

---@return { id: string, label: string }[]
local function get_zoxide_workspaces()
  local _, stdout, _ = wezterm.run_child_process({ zoxide_path, "query", "-l" })

  local workspace_table = {}
  for _, workspace in ipairs(wezterm.mux.get_workspace_names()) do
    table.insert(workspace_table, {
      id = workspace,
      label = workspace_formatter(workspace),
    })
  end
  for _, path in ipairs(wezterm.split_by_newlines(stdout)) do
    local updated_path = string.gsub(path, wezterm.home_dir, "~")
    table.insert(workspace_table, {
      id = path,
      label = updated_path,
    })
  end
  return workspace_table
end

---@param path string
local function set_zoxide_path(path)
  zoxide_path = path
end

---@param formatter fun(label: string): string
local function set_workspace_formatter(formatter)
  workspace_formatter = formatter
end

local function fzf_workspace()
  return wezterm.action_callback(function(window, pane)
    print("hello")
    wezterm.action.SpawnCommandInNewTab({
      args = { "top" },
    })

    print("hello2")
  end)
  -- code
end

return {
  set_zoxide_path = set_zoxide_path,
  set_workspace_formatter = set_workspace_formatter,
  switch_workspace = fzf_workspace,
}
