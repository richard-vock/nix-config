{ pkgs, ... }:
{
  keymaps = [
    {
      key = "H";
      mode = [ "n" ];
      action = "<cmd>bp<CR>";
    }
    {
      key = "L";
      mode = [ "n" ];
      action = "<cmd>bn<CR>";
    }
    {
      key = "K";
      mode = [ "n" ];
      action = "14k";
    }
    {
      key = "J";
      mode = [ "n" ];
      action = "14j";
    }
    {
      key = "K";
      mode = [ "v" ];
      action = "14k";
    }
    {
      key = "J";
      mode = [ "v" ];
      action = "14j";
    }
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>";
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>";
    }
  ];
}
