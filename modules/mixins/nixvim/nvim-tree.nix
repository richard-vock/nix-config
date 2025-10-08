{
  plugins.nvim-tree = {
    enable = true;
    autoLoad = true;
  };
  keymaps = [
    {
      key = "<leader>e";
      mode = [ "n" ];
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}
