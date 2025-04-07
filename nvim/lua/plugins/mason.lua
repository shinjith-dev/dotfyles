return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
          "lua_ls",
          "eslint",
          "tailwindcss",
          "emmet_ls",
          "yamlls",
          "dockerls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers {
        -- Default handler for all LSPs
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end,
      }
    end,
  }
}
