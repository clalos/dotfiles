return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle float<CR>', {})
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_hidden = false,
          hide_gitignore = false,
          hide_dotfiles = false,
          always_show = {
            ".gitignored",
          },
        }
      },
    })
  end
}
