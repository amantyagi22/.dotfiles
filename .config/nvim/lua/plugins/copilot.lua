return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  enabled = true,
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>", -- Set your preferred key here
        },
      },
      panel = { enabled = false },
    })
  end,
}
