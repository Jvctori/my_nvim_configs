return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Configura autocomplete capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Nova forma de configurar o LSP no Neovim 0.11+
    vim.lsp.config.pyright = {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
          },
        },
      },
    }

    -- Ativa o LSP Pyright
    vim.lsp.enable("pyright")
    -- LSP Go (gopls)
    vim.lsp.config.gopls = {
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }
    vim.lsp.enable("gopls")
    -- Diagnósticos opcionais
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    })
  end,
}

