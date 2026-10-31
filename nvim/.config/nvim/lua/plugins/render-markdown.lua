return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = vim.env.NVIM_MANAGED_GENERATION ~= nil,
  ft = { 'markdown' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>tm', '<cmd>RenderMarkdown toggle<CR>', desc = '[T]oggle [M]arkdown' },
  },
  opts = {
    render_modes = { 'n' },
    latex = { enabled = true, converter = { 'latex2text' } },
  },
}
