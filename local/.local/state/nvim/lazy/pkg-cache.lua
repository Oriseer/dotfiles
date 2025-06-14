return {version=12,pkgs={{source="lazy",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,dir="/home/khel/.local/share/nvim/lazy/noice.nvim",name="noice.nvim",file="lazy.lua",},{source="lazy",spec={"nvim-lua/plenary.nvim",lazy=true,},dir="/home/khel/.local/share/nvim/lazy/plenary.nvim",name="plenary.nvim",file="community",},},}