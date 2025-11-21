return {
  "terrortylor/nvim-comment",
  config = function()
    require('nvim_comment').setup({
      line_mapping = "C",       -- Shift+C no modo normal/visual
      operator_mapping = "C",   -- também funciona como operador
      comment_empty = false,
    })
  end
}

