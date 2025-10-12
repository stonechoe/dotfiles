local helper = require "helper.lsp"

local servers = {
  html = {},
  cssls = {},
  eslint = {},
  lua_ls = {},
  solidity = {},
  dockerls = {},
  gopls = {},
  intelephense = {},
  ansiblels = {},
  dartls = {},
  pylsp = {},
  pbls = {},
  metals = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  ts_ls = {
    settings = {
      typescript = {
        preferences = {
          importModuleSpecifier = "project-relative",
        },
      },
    },
  },
}

local function default_on_attach(client, bufnr)
  helper.on_attach(client.id, bufnr)
end

local function should_disable(server_opts)
  if server_opts == false then
    return true
  end

  if type(server_opts) == "table" and server_opts.enabled == false then
    return true
  end

  return false
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    servers = servers,
    setup = {},
  },
  config = function(_, opts)
    local on_attach = opts.on_attach or default_on_attach
    local base_capabilities = opts.capabilities or helper.capabilities

    local function setup(server, server_opts)
      if should_disable(server_opts) then
        return
      end

      local defaults = {
        on_attach = on_attach,
      }

      if base_capabilities then
        defaults.capabilities = vim.deepcopy(base_capabilities)
      end

      local merged_opts = vim.tbl_deep_extend("force", defaults, type(server_opts) == "table" and server_opts or {})

      if merged_opts.enabled ~= nil then
        merged_opts.enabled = nil
      end

      if opts.setup and opts.setup[server] then
        if opts.setup[server](server, merged_opts) then
          return
        end
      elseif opts.setup and opts.setup["*"] then
        if opts.setup["*"](server, merged_opts) then
          return
        end
      end

      vim.lsp.config(server, merged_opts)
      vim.lsp.enable(server)
    end

    for server, server_opts in pairs(opts.servers or {}) do
      setup(server, server_opts)
    end
  end,
}
