local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col > 0 and not vim.api.nvim_get_current_line():sub(col, col):match '%s'
end

return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Previous completion; signature help opens automatically
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-y>'] = {
          function(cmp)
            if cmp.get_selected_item() then
              return cmp.accept()
            end
          end,
          'fallback',
        },
        ['<Tab>'] = {
          function(cmp)
            local snippets = require 'luasnip'
            if snippets.expand_or_jumpable() then
              snippets.expand_or_jump()
              return true
            elseif has_words_before() then
              cmp.show()
              return true
            end
          end,
          'fallback',
        },
        ['<S-Tab>'] = {
          function()
            local snippets = require 'luasnip'
            if snippets.jumpable(-1) then
              snippets.jump(-1)
              return true
            end
          end,
          'fallback',
        },
        ['<C-n>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next { auto_insert = true }
            end
            cmp.show()
            return true
          end,
        },
        ['<C-p>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev { auto_insert = true }
            end
            cmp.show()
            return true
          end,
        },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-h>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-l>'] = { 'scroll_documentation_down', 'fallback' },

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { preselect = false, auto_insert = false } },
        ghost_text = { enabled = true },
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 }, { 'source_name' } },
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          buffer = {
            opts = { get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end },
          },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
