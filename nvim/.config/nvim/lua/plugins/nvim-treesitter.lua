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

if vim.env.NVIM_MANAGED_GENERATION then
  vim.list_extend(parsers, { 'cpp', 'git_config', 'git_rebase', 'gitignore', 'make', 'matlab', 'powershell', 'ssh_config', 'latex' })
end

return {
  {
    -- Treesitter main API
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',

    opts = { parsers = parsers },
    config = function(_, opts)
      -- Nushell files
      vim.filetype.add {
        extension = {
          nu = 'nu',
        },
      }

      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath('data') .. '/site',
      }

      if not vim.env.NVIM_MANAGED_GENERATION then
        require('nvim-treesitter').install(opts.parsers)
      end

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
