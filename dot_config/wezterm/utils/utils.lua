--[[
██╗   ██╗████████╗██╗██╗     ███████╗
██║   ██║╚══██╔══╝██║██║     ██╔════╝
██║   ██║   ██║   ██║██║     ███████╗
██║   ██║   ██║   ██║██║     ╚════██║
╚██████╔╝   ██║   ██║███████╗███████║
 ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝
--]]
local M = {}

function M.merge(...)
  local result = {}

  for _, t in ipairs { ... } do
    for k, v in pairs(t) do
      result[k] = v
    end

    local mt = getmetatable(t)

    if mt then
      setmetatable(result, mt)
    end
  end

  return result
end

function M.is_nvim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

return M
