return {
  -- 历史修改记录
  {
        "mbbill/undotree",
        opt = true,
        cmd = "UndotreeToggle",
  },

  -- 多光标
  {
    "mg979/vim-visual-multi",
    keys = "<C-n>",
  },

  -- 增删改引号
  {
    "tpope/vim-surround",
    keys = {"c", "d", "S"},
  },

  -- 代码格式化
  {
    "Chiel92/vim-autoformat",
    cmd = "Autoformat",
  },

  {
    "williamboman/nvim-lsp-installer",
    requires = "neovim/nvim-lspconfig",
	event = "VimEnter",
  },

  -- 快速分析启动时间
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },


  -- 现代任务系统
  {
    "skywind3000/asynctasks.vim",
    requires = "skywind3000/asyncrun.vim",
    cmd = {"AsyncTask", "AsyncTaskEdit"},
    opt = true
  },

  -- 函数列表
  {
    "liuchengxu/vista.vim",
    cmd = "Vista",
  },

  -- markdown预览
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
  },

  -- 制作markdown表格
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  },

  {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }
}
