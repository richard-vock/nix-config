{ imports, inputs, pkgs, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                viAlias = false;
                vimAlias = true;
                lsp = {
                  enable = true;
                };

                globals = {
                    mapleader = " ";
                    ayucolor = "dark";
                };

                options = {
                    shiftwidth = 4;
                    tabstop = 4;
                    softtabstop = 0;
                    mouse = "";
                };

                clipboard = {
                    enable = true;
                    registers = "unnamedplus";
                    providers.xclip.enable = true;
                };

                visuals.nvim-web-devicons.enable = true;

                filetree.nvimTree = {
                    enable = true;
                    openOnSetup = false;
                    setupOpts = {
                        filters = {
                            dotfiles = false;
                            git_ignored = true;
                        };
                        git.enable = true;
                    };
                    mappings = {
                        toggle = "<leader>e";
                        refresh = "<leader>r";
                    };
                    setupOpts.view.width = 40;
                };

                autocomplete = {
                    nvim-cmp = {
                        enable = true;
                        mappings = {
                            confirm = "<CR>";
                            complete = "<C-Space>";
                        };
                    };
                };

                assistant.copilot = {
                    enable = true;
                    cmp.enable = true;
                };

                languages = {
                    ts = {
                        enable = true;
                        format = {
                            enable = true;
                            type = "prettier";
                        };
                        lsp = {
                            enable = true;
                        };
                        treesitter = {
                            enable = true;
                        };
                        extensions.ts-error-translator.enable = true;
                    };
                    # python = {
                    #     enable = true;
                    #     lsp = true;
                    #     formatter.black.enable = true;
                    #     linter.flake8.enable = true;
                    # };
                    # lua = {
                    #     enable = true;
                    #     lsp = true;
                    #     formatter.stylua.enable = true;
                    # };
                    # nix = {
                    #     enable = true;
                    #     lsp = true;
                    #     formatter.nixpkgs-fmt.enable = true;
                    # };
                    # rust = {
                    #     enable = true;
                    #     lsp = true;
                    #     formatter.rustfmt.enable = true;
                    #     linter.clippy.enable = true;
                    # };
                    # markdown = {
                    #     enable = true;
                    #     lsp = true;
                    # };
                };

                formatter = {
                    conform-nvim = {
                        enable = true;
                    };      
                };

                lsp = {
                    formatOnSave = true;
                };

                terminal.toggleterm = {
                    enable = true;
                    lazygit = {
                        enable = true;
                    };
                };

                extraPlugins = with pkgs.vimPlugins; {
                    ayu-vim = {
                        package = ayu-vim;
                    };
                };

                luaConfigRC.ayu = inputs.nvf.lib.nvim.dag.entryAfter ["theme"] ''
                    vim.cmd.colorscheme("ayu")
                '';

                maps.normal = {
                    K.action = "<C-u>";
                    J.action = "<C-d>";
                };
            };
        };
    };
}
