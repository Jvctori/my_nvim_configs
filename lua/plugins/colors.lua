return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    config = function()
      vim.opt.background = "dark" -- pode mudar para "light" se quiser
      vim.cmd.colorscheme "oxocarbon"

      -- Fundo transparente (opcional)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
}
