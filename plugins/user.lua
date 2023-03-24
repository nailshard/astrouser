return {
  {
    "nguyenvukhang/nvim-toggler",
    event = "BufRead",
    config = function()
      require("nvim-toggler").setup()
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufRead",
    config = function()
      require("virt-column").setup()
    end,
  },

  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
