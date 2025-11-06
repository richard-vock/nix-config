{ inputs, pkgs, ... }:
let
  nixvimModulePaths = [
    ./nixvim/keymaps.nix
    ./nixvim/bufdelete.nix
    ./nixvim/vimade.nix
    ./nixvim/treesitter.nix
    ./nixvim/toggleterm.nix
    ./nixvim/themes.nix
    ./nixvim/lazygit.nix
    ./nixvim/lualine.nix
    ./nixvim/bufferline.nix
    ./nixvim/snacks.nix
    ./nixvim/nvim-tree.nix
    ./nixvim/gitsigns.nix
    ./nixvim/whichkey.nix
    ./nixvim/hlchunk.nix
    # ./nixvim/yanky.nix
    ./nixvim/autopairs.nix
    ./nixvim/blink-cmp.nix
    ./nixvim/fidget.nix
    # ./nixvim/smear-cursor.nix
    ./nixvim/lsp/conform.nix
    ./nixvim/lsp/lsp.nix
    # ./nixvim/nix-develop.nix
    # ./nixvim/kulala.nix
    ./nixvim/aerial.nix
    # ./nixvim/autosave.nix
    ./nixvim/notify.nix
    ./nixvim/barbecue.nix
    ./nixvim/noice.nix
    ./nixvim/neoscroll.nix
    ./nixvim/markview.nix
    ./nixvim/yazi.nix
    ./nixvim/wtf.nix
    # ./nixvim/windsurf-vim.nix if you want to use this plugin uncomment it and run nix develop --impure
    ./nixvim/ts-comments.nix
    ./nixvim/treesj.nix
    ./nixvim/web-devicons.nix
  ];

  wrapNixvimModule =
    path:
    { pkgs, ... }@args:
    let
      raw = import path;
      moduleConfig = if builtins.isFunction raw then raw args else raw;
    in
    {
      config.programs.nixvim = moduleConfig;
    };
in
{
  imports = [ inputs.nixvim.nixosModules.nixvim ] ++ builtins.map wrapNixvimModule nixvimModulePaths;

  config.programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      # colorcolumn = "100";
      relativenumber = false;
      shiftwidth = 4;
      tabstop = 4;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
    };

    extraPackages = with pkgs; [
      nerd-fonts.hack
      fzf
      ripgrep
      fd
      nixfmt-rfc-style
      shellcheck
      eslint_d
    ];
  };
}
