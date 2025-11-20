-- Caminho para lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.clipboard = "unnamedplus"
-- Mostrar número absoluto na linha atual e relativo nas outras
vim.opt.number = true
vim.opt.relativenumber = true
-- Define um comando :Pmfm que insere o template
vim.api.nvim_create_user_command('Pmfm', function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
        "package main",
        "",
        "func main() {",
        "\t",
        "}"
    })
    vim.api.nvim_win_set_cursor(0, {4, 1})
end, {})
-- Mover linha para cima/baixo no modo normal
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })

-- Desindentar linha no modo normal
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })

-- Indentar seleção no modo visual
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- Desindentar seleção no modo visual
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
-- Default global (opcional)
vim.opt.expandtab = false   -- Go usa tabs reais
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Indentação específica para Go
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.expandtab = false   -- Tab reais, não espaços
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
-- Mover linha ou bloco selecionado no modo visual
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Carrega plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "folke/tokyonight.nvim" } },
  checker = { enabled = true },
})


