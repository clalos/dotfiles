return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      -- Find files
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      -- Grep in all files
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      -- List git files
      vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
      -- List active buffers
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      -- Search symbols in the current buffer
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
      -- Search symbols in the workspace
      vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
        pickers = {
          live_grep = {
            additional_args = function(_)
              return { "--hidden" }
            end
          },
          find_files = {
            hidden = true
          }
        },
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
