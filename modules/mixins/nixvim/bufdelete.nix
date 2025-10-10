{
  plugins.bufdelete = {
    enable = true;
  };
  keymaps = [
    {
      key = "<F4>";
      mode = [ "n" ];
      action = "<cmd>Bwipeout<CR>";
    }
  ];
}
