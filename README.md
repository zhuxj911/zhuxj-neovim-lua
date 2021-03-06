# zhuxj-neovim-lua

neovim 6.0+ lua configuration

我的 neovim 6.0+ lua 配置，基于 NvChad 架构:

https://github.com/NvChad/

可以自定义git源。

由于 Wall 的关系，将git的地址进行了修改：

nvim/lua/packer.lua 中修改：
注释了原来的地址，新加入了git地址

  if fn.empty(fn.glob(install_path)) > 0 then
      print "Cloning packer .."

      fn.system { "git", "clone", "--depth", "1", 
	  -- "https://github.com/wbthomason/packer.nvim", 
	  "https://mirror.ghproxy.com/https://github.com/wbthomason/packer.nvim",
	  install_path }

      print "Packer cloned successfully!"

      -- install plugins + compile their configs
      vim.cmd "packadd packer.nvim"
      require "plugins"
      vim.cmd "PackerSync"
   end

下面中的 git 部分为新加入的

M.options = {
   auto_clean = true,
   compile_on_sync = true,
   git = { clone_timeout = 6000 },
   display = {
      working_sym = " ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
   },
   git = {
      -- 2022.5.29 15:18 由zhuxj添加，用于git定义
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
      clone_timeout = 6000, -- seconds
   },
}



nvim/lua/plugins/configs中的treesitter.lua中加入了git地址：

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://mirror.ghproxy.com/https://github.com/")
end


加入了custom文件夹，在 init.lua文件中加入了：

-- 在文件保存时自动删除行末的空白符， 非常棒的功能
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]


其他的一切基本没修过。 All is ok！
