local M = {}

M.bootstrap = function()
   local fn = vim.fn
   local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })

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
end

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

-- merge overrides if there are any
M.options = nvchad.load_override(M.options, "wbthomason/packer.nvim")

M.run = function(plugins)
   local present, packer = pcall(require, "packer")

   if not present then
      return
   end

   -- Override with chadrc values
   plugins = nvchad.remove_default_plugins(plugins)
   plugins = nvchad.merge_plugins(plugins)

   packer.init(M.options)

   packer.startup(function(use)
      for _, v in pairs(plugins) do
         use(v)
      end
   end)
end

return M
