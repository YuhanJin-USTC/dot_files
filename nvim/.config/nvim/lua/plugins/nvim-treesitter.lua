local parsers = {
  'bash',
  'c',
  'diff',
  'fortran',
  'nu',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'vim',
  'vimdoc',
}

return {
  {
    -- Nvim 0.12 API
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    config = function()
      -- Nushell files
      vim.filetype.add {
        extension = {
          nu = 'nu',
        },
      }

      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath('data') .. '/site',
      }

      require('nvim-treesitter').install(parsers)

      -- Use built-in highlighter
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },

  {
    -- Re-enable after Treesitter is stable
    'nvim-treesitter/nvim-treesitter-context',
    enabled = false,
  },
}
