-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
M.options = {
  relativenumber = true,

  -- 配置剪切板
  -- clipboard = "unnamedplus",
--[[
vim 通过寄存器 * 或 + 与系统剪贴板相互支持，可过reg命令查看
寄存器的含义如下：
 " 未命名寄存器 上一次复制或删除的文本
 0-9 数字寄存器 文本复制和删除历史
 - 行内删除寄存器 删除少于一行的文本
 a-z, A-Z 命名寄存器 删除少于一行的文本
 % . : 只读寄存器  %当前文件名   . 最近插入的文本 :最近执行的命令行
 # 轮换缓冲区寄存器 交替文件的名字

 如果想将系统剪贴板中的内容粘贴到当前位置，可在命令模式下输入：
 "+p   或 "*p  命令即可
 简单的设置： vim.o.clipboard = "unnamedplus"
 这行命令的意思是将要复制的内容设置到所有的寄存器，包括与系统交互的 + * 寄存器
 如果这样设置，在vim中的任意一个删除 x、d 命令都讲发送到粘贴板，有些不爽啊
 如何在vim中将所要copy的内容发送到系统剪贴板呢？
 命令 "+yy 或 "*yy
 * 系统剪切板  + 系统剪切板(X11) ~ 拖曳的文本
 - 彻底删除的文本
 / 最近搜索模式

 粘贴寄存器
  命令:put 可将寄存器中的内容粘贴到指定的文本行后面
  :5put a     将寄存器a中的内容粘贴到第5行的后面
  :5put! a    粘贴到这一行的前面

  也可以使用p命令，将x寄存器中的文本粘贴到光标之后
  "xp
  P命令，则将x寄存器中的文本粘贴到光标之前
  "xP
  如果直接使用p或P命令，而没有指明寄存器，则将粘贴未命名寄存器中的内容
  ".P  可以粘贴上次插入的文本
  如果要粘贴系统剪切板中的内容，在 Insert mode下可以利用快捷键 Shift + Ins（可以改造为Ctrl + v），
  而在Normal mode下，使用命令 "*p

  在插入模式下，点击Ctrl-r然后输入寄存器的标识符，可以粘贴及村中的内容到当前位置：
  Ctrl+r： 粘贴最近执行的命令
  CTRL-R/ 将粘贴最近使用的搜索模式；

  CTRL-R0 将粘贴"0寄存器的内容；

  CTRL-Ra 将粘贴"a寄存器的内容。

  使用以下命令，可以查看相关帮助信息：

  :help i_CTRL-R

  本配置中Ctrl+v已经被配置为系统级别的粘贴了
  --]]
}

M.ui = {
   theme = "gruvchad",
}

-- Install plugins
local userPlugins = require "custom.plugins" -- path to table
M.plugins = {
   install = userPlugins,

   options={
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
   },

}

return M
