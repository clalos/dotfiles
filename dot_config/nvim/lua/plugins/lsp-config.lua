return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lsp_zero = require('lsp-zero')

      require('mason-lspconfig').setup({
        ensure_installed = {
          "bashls", "cssls", "dockerls", "docker_compose_language_service",
          "elixirls", "gopls", "graphql", "html", "biome", "lua_ls",
          "marksman", "intelephense", "pyright", "rust_analyzer",
          "sqlls", "taplo", "lemminx", "yamlls"
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
        }),
      })
    end
  },
  {
    'L3MON4D3/LuaSnip'
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr }

        vim.keymap.set({ 'n', 'x' }, '<C-i>', function()
          vim.lsp.buf.format({ async = false, timeout_ms = 500 })
        end, opts)
      end)
    end
  },
}
