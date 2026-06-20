local THEME = "rose-pine" -- active theme: rose-pine | gruvbox-material | catppuccin | tokyonight | dracula | kanagawa | nord | night-owl

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = THEME ~= "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = { bold = true, italic = true },
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = THEME ~= "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_current_word = "bold"
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_transparent_background = 2
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = THEME ~= "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = THEME ~= "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = THEME ~= "dracula",
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = THEME ~= "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        transparent = true,
      })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = THEME ~= "nord",
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = THEME ~= "night-owl",
    priority = 1000,
    config = function()
      require("night-owl").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = { theme = "auto" },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = THEME,
    },
  },
}
