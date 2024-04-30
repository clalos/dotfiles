return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
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
      },
    })
  end,
}
