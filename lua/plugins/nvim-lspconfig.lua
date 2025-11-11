return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
      update_in_insert = false, -- clear diagnostic in Insert mode
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
    servers = {
      ["*"] = {
        keys = {}, -- global lsp keymaps
      },
      ruby_lsp = {
        mason = false, -- don't want this server to be installed by mason - manual instead
        init_options = {
          formatter = "standardrb",
          linters = { "standardrb" },
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
      emmet_ls = {
        filetypes = {
          "astro",
          "html",
          "typescriptreact",
          "javascriptreact",
          "eruby",
          "css",
          "scss",
          "sass",
          "less",
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = false,
            },
          },
        },
      },
      ts_ls = {
        root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json"),
        single_file_support = false,
      },
    },
  },
}
