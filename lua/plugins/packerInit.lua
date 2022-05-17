vim.cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")

if not present then
   local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

   print "Cloning packer.."
   -- remove the dir before cloning
   vim.fn.delete(packer_path, "rf")
   vim.fn.system {
      "git",
      "clone",
      -- "https://github.com/wbthomason/packer.nvim",
      "https://gitcode.net/mirrors/wbthomason/packer.nvim",
      "--depth",
      "20",
      packer_path,
   }

   vim.cmd "packadd packer.nvim"
   present, packer = pcall(require, "packer")

   if present then
      print "Packer cloned successfully."
   else
      error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
   end
end

local options = {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "double" }
      end,
   },
   git = {
      -- 2022.5.17 16:03 由zhuxj添加，用于git定义
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
      clone_timeout = 6000, -- seconds
   },
   auto_clean = true,
   compile_on_sync = true,
   snapshot = nil,
}

options = nvchad.load_override(options, "wbthomason/packer.nvim")

packer.init(options)

return packer
