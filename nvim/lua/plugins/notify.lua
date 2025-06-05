return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({})

    -- Make notify the default notification function
    vim.notify = require("notify")
  end,
  event = "VeryLazy", -- or "UIEnter" for earlier loading
}
