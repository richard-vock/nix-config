{
  plugins.nvim-tree = {
    enable = true;
    autoLoad = true;
    settings = {
      view = {
        width = 40;
      };
    };
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
