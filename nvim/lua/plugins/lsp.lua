return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {
          mason = false,
          enabled = false,
        },
        ruff = {
          mason = false,
          enabled = false,
        },
      },
    },
  },
}
