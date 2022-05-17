-- example file i.e lua/custom/init.lua
-- load your globals, autocmds here or anything .__.

-- 在文件保存时自动删除行末的空白符， 非常棒的功能
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]



