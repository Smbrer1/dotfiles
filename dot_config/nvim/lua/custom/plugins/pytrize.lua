return {
  'AckslD/nvim-pytrize.lua',
  dependencies = { "nvim-lua/plenary.nvim" },
  -- uncomment if you want to lazy load
  cmd = { 'Pytrize', 'PytrizeClear', 'PytrizeJump' },
  -- uncomment if you want to lazy load but not use the commands
  -- module = 'pytrize',
  config = 'require("pytrize").setup()',
}
