return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts

    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { enable = true },
      },
    },
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'nu', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },

    config = function(_, opts)
      -- 告诉 Neovim：.nu 结尾的文件，文件类型(filetype) 是 'nu'
      vim.filetype.add {
        extension = {
          nu = 'nu',
        },
      }

      -- 启动 Treesitter
      require('nvim-treesitter.configs').setup(opts)
    end,

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
