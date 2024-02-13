local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.pyright.setup {
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportAssignmentType = "none",
        },
      },
    },
  },
}

lspconfig.ruff_lsp.setup {}

local null_ls = require "null-ls"
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  sources = {
    diagnostics.mypy.with { extra_args = { "--ignore-missing-imports" } },
  },
}
