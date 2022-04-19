-- 指定python的执行路径， neovim 7.0 以上版本只支持python3.4+
if vim.fn.has("windows") == 1 then
    vim.g.python3_host_prog = "C:/MyApp/Python310/python.exe" --windows
else  -- mac and linux
    vim.g.python3_host_prog = "/usr/local/bin/python3" --macos
end
-- vim.g.loaded_python3_provider = 0  -- disable Python3 support

-- 在文件保存时自动删除行末的空白符， 非常棒的功能
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- MAPPINGS
local map = require("core.utils").map

-- map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<C-q>", ":q<CR>")

-- 文件树
map('n', '<A-t>', ':NvimTreeToggle<CR>')

-- 历史修改记录
map('n', '<A-u>', ':UndotreeToggle<CR>')

-- 格式化
map('n', '<leader>fm', ':Autoformat<CR>')

-- Y复制到系统剪切板
map('v', 'Y', [["+y]])

-- 开启/关闭函数列表
map('n', '<A-f>', ':Vista<CR>')

-- 快速分屏
map('n', 'sl', ':set splitright<CR>:vsplit<CR>')
map('n', 'sh', ':set nosplitright<CR>:vsplit<CR>')
map('n', 'sj', ':set splitright<CR>:split<CR>')
map('n', 'sk', ':set nosplitright<CR>:split<CR>')

-- Copy to system clippboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')

-- Paste from system clippboard
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

-- visual模式下缩进代码
map("v", "<", "<gv")
map("v", ">", ">gv")
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")

-- 创建表格
map('n', '<leader>tm', ':TableModeToggle<CR>')

-- markdown预览
map('n', '<A-r>', ':MarkdownPreviewToggle<CR>')

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
