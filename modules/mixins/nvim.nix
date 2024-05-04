{
    home-manager.users.richard = { pkgs, ...}: {
        programs.neovim = {
            enable = true;
            defaultEditor = true;
            withNodeJs = true;
            plugins = with pkgs.vimPlugins; [
                copilot-vim
                fzf-vim
                indentLine
                nvim-tree-lua
                nvim-web-devicons
                tcomment_vim
                vim-airline
                vim-airline-themes
                leap-nvim
                Shade-nvim
                # vim-easymotion
                vim-markdown
                nvim-treesitter
                nvim-treesitter-parsers.java
                nvim-treesitter-parsers.javascript
                nvim-treesitter-parsers.nix
                nvim-treesitter-parsers.python
                nvim-treesitter-parsers.svelte
                nvim-treesitter-parsers.typescript
                nvim-treesitter-parsers.tsx
                playground
                # { plugin = vim-polyglot;
                #   config = "let g:polyglot_disabled = ['autoindent']";
                # }
                vim-svelte
                #vim-oscyank
            ];
            extraConfig = ''
                " general
                set mouse=
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

                " indentation
                set shiftwidth=4
                set tabstop=4
                set softtabstop=4
                set expandtab

                " conceal fix
                let g:vim_json_conceal=0
                let g:vim_markdown_conceal=0

                " folding and indentation
                set foldmethod=syntax
                set foldcolumn=4
                "au BufNewFile,BufRead *.py
                "  \ set foldmethod=indent |
                "  \ set expandtab |
                "  \ set autoindent |
                "  \ set fileformat=unix

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

                " airline
                set laststatus=2
                let g:airline#extensions#tabline#enabled = 1
                let g:airline_theme = 'ayu_mirage'

                " tcomment
                let g:tcomment_opleader1 = '<Leader>c'

                " nvim-tree-lua
                nnoremap <C-n> :NvimTreeToggle<CR>
                nnoremap <leader>r :NvimTreeRefresh<CR>
                nnoremap <leader>n :NvimTreeFindFile<CR>

                " easymotion
                let g:EasyMotion_do_mapping = 0
                map <Leader>j <Plug>(easymotion-j)
                map <Leader>k <Plug>(easymotion-k)
                " nmap s <Plug>(easymotion-overwin-f)
                " nmap f <Plug>(easymotion-overwin-f2)
                nnoremap <silent> zj :call NextClosedFold('j')<cr>
                nnoremap <silent> zk :call NextClosedFold('k')<cr>
                function! NextClosedFold(dir)
                    let cmd = 'norm!z' . a:dir
                    let view = winsaveview()
                    let [l0, l, open] = [0, view.lnum, 1]
                    while l != l0 && open
                        exe cmd
                        let [l0, l] = [l, line('.')]
                        let open = foldclosed(l) < 0
                    endwhile
                    if open
                        call winrestview(view)
                    endif
                endfunction

                map <Leader><Leader> :Rg<CR>

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

                    require('leap').create_default_mappings()
                    
                    require('shade').setup({
                        overlay_opacity = 60,
                        opacity_step = 1,
                    })
                    
                    require'nvim-treesitter.configs'.setup {
                        highlight = {
                            enable = true,
                        },
                    }
                    vim.api.nvim_set_hl(0, "@variable", { link = "Normal" })
                EOF
            '';
        };
    };
}
