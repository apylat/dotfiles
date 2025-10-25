return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      --------------------------------------------------------------------
      -- 🟦 TypeScript / JavaScript
      --------------------------------------------------------------------
      vim.lsp.config.ts_ls = {
        default_config = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          root_dir = vim.fs.root(0, { "tsconfig.json", "package.json", ".git" }),
          capabilities = capabilities,
        },
      }

      --------------------------------------------------------------------
      -- 🟥 Ruby (Solargraph)
      --------------------------------------------------------------------
      vim.lsp.config.solargraph = {
        default_config = {
          cmd = { "solargraph", "stdio" },
          filetypes = { "ruby" },
          root_dir = vim.fs.root(0, { "Gemfile", ".git" }),
          capabilities = capabilities,
        },
      }

      --------------------------------------------------------------------
      -- 🟧 HTML
      --------------------------------------------------------------------
      vim.lsp.config.html = {
        default_config = {
          cmd = { "vscode-html-language-server", "--stdio" },
          filetypes = { "html" },
          root_dir = vim.fs.root(0, { "index.html", ".git" }),
          capabilities = capabilities,
        },
      }

      --------------------------------------------------------------------
      -- 🟩 Lua
      --------------------------------------------------------------------
      vim.lsp.config.lua_ls = {
        default_config = {
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          root_dir = vim.fs.root(0, { ".luarc.json", ".git" }),
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          local configs = {
            typescript = "ts_ls",
            typescriptreact = "ts_ls",
            javascript = "ts_ls",
            javascriptreact = "ts_ls",
            ruby = "solargraph",
            html = "html",
            lua = "lua_ls",
          }
          local server = configs[ft]
          if server and vim.lsp.get_clients({ name = server })[1] == nil then
            vim.lsp.start(vim.lsp.config[server].default_config)
          end
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find References" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
}
