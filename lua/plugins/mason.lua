return {
  -- manager for LSP/installers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- integrates mason with lspconfig
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" } },

  -- nvim LSP config
  { "neovim/nvim-lspconfig" },

  -- null-ls: executáveis de formatação/diagnóstico que não são LSP
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "mason.nvim" },
  },

  -- (opcional) utilidades para Go (auto setup + comandos úteis)
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("go").setup()
    end,
  },
}

