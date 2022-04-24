require("custom.autochad_cmds")

-- MAPPINGS
local map = require("core.utils").map

-- map("n", "<leader>cc", ":Telescope <CR>")
-- map("n", "<C-q>", ":q<CR>")  --好像本人习惯于:q的退出模式，不习惯这样的按键

-- 文件树
map('n', '<A-t>', ':NvimTreeToggle<CR>')

-- 历史修改记录
map('n', '<A-u>', ':UndotreeToggle<CR>')

-- 格式化 这个快捷键好像不怎么起作用，还不如直接输入命令
-- map('n', '<leader>fm', ':Autoformat<CR>')

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
-- 在可视模式下，大写 Y 复制到系统剪切板
map('v', 'Y', [["+y]])

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
-- map('n', '<A-r>', ':MarkdownPreviewToggle<CR>')

