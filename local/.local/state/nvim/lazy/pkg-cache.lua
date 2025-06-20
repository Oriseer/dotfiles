return {version=12,pkgs={{name="noice.nvim",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,file="lazy.lua",source="lazy",dir="/home/khel/.local/share/nvim/lazy/noice.nvim",},{name="plenary.nvim",spec={"nvim-lua/plenary.nvim",lazy=true,},file="community",source="lazy",dir="/home/khel/.local/share/nvim/lazy/plenary.nvim",},},}