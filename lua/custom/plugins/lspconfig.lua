local M = {}

M.setup_lsp = function(attach, capabilities)
    local lsp_installer = require "nvim-lsp-installer"

    -- (好像就是没用，验证了一下) 此处的安装显得没有必要，可以通过 LspInstall 命令进行安装， 2022.4.19 9:40 zhuxj
    -- 安装列表
    -- { key: 服务器名， value: 配置文件 }
    -- key 必须为下列网址列出的 server name
    -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
    local servers = {
      sumneko_lua, -- lua
	  vimls,       -- vim
      remark_ls,   -- markdown
    }

    -- 自动安装 Language Servers
    for name, _ in pairs(servers) do
      local server_is_found, server = lsp_installer.get_server(name)
      if server_is_found then
        if not server:is_installed() then
          print("Installing " .. name)
          server:install()
          print("Install " .. name .. "completed!")
        end
      end
    end
--]]

    lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟" ,
            server_pending = "",
            server_uninstalled = "✗",
         },
		 keymaps = {
			-- Keymap to expand a server in the UI
			toggle_server_expand = "<CR>",
			-- Keymap to install a server
			install_server = "i",
			-- Keymap to reinstall/update a server
			update_server = "u",
			-- Keymap to update all installed servers
			update_all_servers = "U",
			-- Keymap to uninstall a server
			uninstall_server = "X",
		},
      },
	}


    lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
	