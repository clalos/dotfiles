return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<C-i>",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      -- Go
      go = { "goimports" },
      -- Bash
      sh = { "shfmt" },
      -- Css
      css = { "prettierd" },
      -- Elixir
      elixir = { "mix format" },
      -- HTML
      html = { "prettierd" },
      -- Markdown
      markdown = { "markdownlint" },
      -- Rust
      rust = { "rustfmt" },
      -- SQL
      sql = { "sqlfluff" },
      -- YAML
      yaml = { "prettierd" },
      -- Zig
      zig = { "zig fmt" },
      -- JSON
      json = { "prettierd" },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
