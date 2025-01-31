return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Setup nvim-cmp
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- LSP keymaps
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- Go to definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- Hover information
        vim.keymap.set('n', 'gH', vim.lsp.buf.hover, opts)
        
        -- Additional useful keymaps (optional)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- Add to your keymaps
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      end

      -- Setup language servers
      -- You'll need to install these language servers separately using Mason or your package manager
      local lspconfig = require('lspconfig')
      
      -- Example server setups (uncomment and modify as needed):
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })
      
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- List the language servers you want to auto-install
          -- "lua_ls",
          "pyright",
          -- "tsserver",
        },
        automatic_installation = true,
      })
    end,
  },
}
