return {
  {
    "joshzcold/python.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "neovim/nvim-lspconfig",
      "L3MON4D3/LuaSnip",
      "nvim-neotest/neotest",
      "nvim-neotest/neotest-python",
    },
    config = function()
      -- Nova forma de configurar LSP (Neovim 0.11+)
      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      }

      vim.lsp.enable("pyright")

      -- Configura DAP para Python
      local dap_python = require("dap-python")
      dap_python.setup("python")
    end,
  },
}

