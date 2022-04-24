-- 在文件保存时自动删除行末的空白符， 非常棒的功能
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- 指定python的执行路径， neovim 7.0 以上版本只支持python3.4+
if vim.fn.has("windows") == 1 then
  vim.g.python3_host_prog = "C:/MyApp/Python310/python.exe" --windows
else  -- mac and linux
  vim.g.python3_host_prog = "/usr/local/bin/python3" --macos
end
-- vim.g.loaded_python3_provider = 0  -- disable Python3 support