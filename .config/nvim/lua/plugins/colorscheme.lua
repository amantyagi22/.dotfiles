return {
  -- Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    priority = 1000, -- Make sure it loads first
    config = function()
      -- Set the colorscheme variant (available options: 'hard', 'medium', 'soft')
      vim.g.gruvbox_material_background = "hard"

      -- Set the foreground style (available options: 'material', 'mix', 'original')
      vim.g.gruvbox_material_foreground = "material"

      -- Set the contrast between visual elements
      vim.g.gruvbox_material_better_performance = 1

      -- Enable bold style for functions
      vim.g.gruvbox_material_enable_bold = 1

      -- Enable italic style for comments, statements, types etc
      vim.g.gruvbox_material_enable_italic = 1

      -- Set visibility for underlines
      vim.g.gruvbox_material_ui_contrast = "high"

      -- Set the color of the current word highlight
      vim.g.gruvbox_material_current_word = "bold"

      -- Set colors for diagnostic features
      vim.g.gruvbox_material_diagnostic_line_highlight = 1

      -- Set up transparent background (comment next line to disable)
      vim.g.gruvbox_material_transparent_background = 1

      -- Apply the colorscheme
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
  -- Optional dependency: nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },
  -- Optional dependency: lualine with gruvbox-material
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "gruvbox-material",
      },
    },
  },
}
