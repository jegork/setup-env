local utils = require "core.utils"

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      utils.load_mappings("lspconfig", { buffer = bufnr })

      if client.server_capabilities.signatureHelpProvider then
        require("nvchad.signature").setup(client)
      end

      if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,

    capabilities = vim.lsp.protocol.make_client_capabilities()
  }
}

