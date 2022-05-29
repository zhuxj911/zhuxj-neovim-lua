local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://mirror.ghproxy.com/https://github.com/")
end

local options = {
   ensure_installed = {
      "lua",
      "vim",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}

-- check for any override
options = nvchad.load_override(options, "nvim-treesitter/nvim-treesitter")

treesitter.setup(options)
