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
    -- Treesitter main API
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
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
          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          local ok, query = pcall(vim.treesitter.query.get, lang, 'highlights')
          if ok and query and pcall(vim.treesitter.start, args.buf, lang) then
            return
          end

          -- Fall back to Vim syntax
          vim.treesitter.stop(args.buf)
          vim.bo[args.buf].syntax = args.match
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
