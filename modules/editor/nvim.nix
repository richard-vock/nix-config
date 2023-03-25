{
  home-manager.users.richard = { pkgs, ...}: {
    programs.neovim = {
      enable = true;
      withNodeJs = true;
      plugins = with pkgs.vimPlugins; [
        copilot-vim
        indentLine
        lightspeed-nvim
        nvim-tree-lua
        nvim-web-devicons
        tcomment_vim
        vim-nix
        vim-polyglot
        vim-wordmotion
        #vim-oscyank
      ];
      extraPackages = with pkgs;
      [
      ];
      extraConfig = ''
        " general
        set nocp
        filetype plugin on
        set hidden
        set diffopt+=internal,algorithm:patience
        set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
        set backspace=2

        " swap files
        set noswapfile

        " clipboard
        set clipboard=unnamedplus
        "vmap <C-c> y:OSCYank<cr>

        " visual
        let &titlestring = @%
        set title
        set number
        set hlsearch
        set nowrap
        set expandtab

        " conceal fix
        let g:vim_json_conceal=0

        " folding and indentation
        set foldmethod=syntax
        set foldcolumn=4
        au BufNewFile,BufRead *.py
          \ set foldmethod=indent |
          \ set tabstop=4 |
          \ set softtagstop=4 |
          \ set shiftwidth=4 |
          \ set expandtab |
          \ set autoindent |
          \ set fileformat=unix

        " keybindings
        map <C-Space> :bn<CR>
        map <C-BS> :bp<CR>
        map <C-@> :bn<CR>
        map <C-H> :bp<CR>
        map <C-TAB> <C-w>p
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        "nnoremap <C-H> <C-W><C-H>
        map <Space> @q
        map <Insert> "*p

        map J <C-d>
        map K <C-u>

        map <F1> zR
        map <F2> zM
        map <F3> zr

        :command! BW :bn|:bd#
        map <F4> :BW<CR>

        map <F5> mA
        map <F6> `A
        map <F8> :cclose<CR>

        " tcomment
        let g:tcomment_opleader1 = '<Leader>c'

        " nvim-tree-lua
        nnoremap <C-n> :NvimTreeToggle<CR>
        nnoremap <leader>r :NvimTreeRefresh<CR>
        nnoremap <leader>n :NvimTreeFindFile<CR>

        lua << EOF
          require'nvim-tree'.setup {
            view = {
              width = 40,
            },
            renderer = {
              icons = {
                show = {
                  git = true,
                  folder = true,
                  file = true,
                  folder_arrow = true,
                  modified = true,
                },
              },
            },
          }
        EOF
      '';
    };
  };
}
