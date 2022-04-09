-- lsp saga ui
require'lspsaga'.init_lsp_saga()

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Runs when buffer attaches to language server
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
  buf_set_keymap('n', '<space>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  buf_set_keymap('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  buf_set_keymap('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- experimental
  buf_set_keymap('n', '<c-u>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {})
  buf_set_keymap('n', '<c-d>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {})
  buf_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  buf_set_keymap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

require'lspconfig'.gopls.setup {on_attach = on_attach, capabilities = capabilities}

-- typescript organize imports
local function organize_imports()
  local params = {command = "_typescript.organizeImports", arguments = {vim.api.nvim_buf_get_name(0)}, title = ""}
  vim.lsp.buf.execute_command(params)
end

require'lspconfig'.tsserver.setup {
  on_attach = function(client, bufnr)
    -- prefer prettier rather than tsserver for formatting
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)
  end,
  commands = {OrganizeImports = {organize_imports, description = "Organize Imports"}},
  capabilities = capabilities
}
require'lspconfig'.dockerls.setup {on_attach = on_attach, capabilities = capabilities}

require'lspconfig'.yamlls.setup {
  on_attach = on_attach,
  settings = {yaml = {schemas = {kubernetes = 'k8s/*'}, format = {enable = false}}},
  capabilities = capabilities
}

require'lspconfig'.jsonls.setup {on_attach = on_attach, capabilities = capabilities}

require'lspconfig'.eslint.setup {on_attach = on_attach}

-- python
require'lspconfig'.pyright.setup {on_attach = on_attach, capabilities = capabilities}

-- ruby
require'lspconfig'.solargraph.setup {on_attach = on_attach, capabilities = capabilities}

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/usr/bin/omnisharp"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
require'lspconfig'.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
  ...
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {enable = false}
    }
  }
}

require'lspconfig'.cssls.setup {on_attach = on_attach, capabilities = capabilities}
