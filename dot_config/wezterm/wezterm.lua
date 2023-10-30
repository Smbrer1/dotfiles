--[[
██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
 ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
--]]


local merge = require('utils').merge
local mappings = require("mappings")
local mtt = require('domains.mtt')
local fonts = require('fonts')
local gui = require('gui')
local shell = require('shell')

local config = merge(mappings, mtt, fonts, gui, shell)

return config
