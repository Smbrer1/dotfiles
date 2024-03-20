local M = {
  'cbochs/portal.nvim',
  -- Optional dependencies
  dependencies = {
    'cbochs/grapple.nvim',
  },
  keys = {
    { '<leader>pgn', '<cmd>Portal grapple forward<cr>', desc = 'Portal Grapple forward' },
    { '<leader>pgp', '<cmd>Portal grapple backward<cr>', desc = 'Portal Grapple backward' },
    { '<leader>pcn', '<cmd>Portal changelist forward<cr>', desc = 'Portal changelist forward' },
    { '<leader>pcn', '<cmd>Portal changelist forward<cr>', desc = 'Portal changelist forward' },
    { '<leader>pjp', '<cmd>Portal jumplist backward<cr>', desc = 'Portal jumplist backward' },
    { '<leader>pjp', '<cmd>Portal jumplist backward<cr>', desc = 'Portal jumplist backward' },
  },
}
return M
