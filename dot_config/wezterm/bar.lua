local module = {
  dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
  indicator = {
    leader = {
      enabled = true,
      off = " ",
      on = " ",
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
      },
    },
  },
  tabs = {
    numerals = "roman",       -- or "roman"
    pane_count = "subscript", -- or "subscript", false
    brackets = {
      active = { ":", "" },
      inactive = { "", ":" },
    },
  },
}


return module
