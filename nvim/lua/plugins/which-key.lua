return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    { 'echasnovski/mini.icons',     version = '*' },
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Local Keymaps",
    },
  },
}
