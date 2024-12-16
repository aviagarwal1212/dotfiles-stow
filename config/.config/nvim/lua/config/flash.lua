return {
  { "<cr>", mode = { "n", "x", "o" }, function() require("flash").jump() end },
  { ";",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
  { "r",    mode = "o",               function() require("flash").remote() end },
}
