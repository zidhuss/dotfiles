{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.username = "abry";
  home.homeDirectory = "/Users/abry";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # For splitting up configuration into multiple files
  imports = [
  ];

  home.packages = with pkgs; [
    # http
    hey
    caddy

    # Containers
    colima
    lazydocker
    docker-client
    k9s

    # tools
    fd
    ripgrep
    ranger
    doggo
    pngpaste
  ];

  xdg.enable = true;

  xdg.configFile."karabiner" = {
    source = config.lib.file.mkOutOfStoreSymlink ./configs/karabiner;
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/zidhuss/dotfiles/configs/nvim";
    recursive = true;
  };

  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/zidhuss/dotfiles/configs/wezterm";
    recursive = true;
  };

  xdg.configFile."git/allowed_signers".text = ''
    hussein@zidhuss.tech ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhUktjsxUkkZybwH+NWcZajqfhIUEr+tdX1iFWo6YgJ
  '';

  programs.jujutsu = {
    enable = true;
    settings = {
      ui.paginate = "never";
      user = {
        name = "Hussein Al Abry";
        email = "hussein@zidhuss.tech";
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhUktjsxUkkZybwH+NWcZajqfhIUEr+tdX1iFWo6YgJ hussein@zidhuss.tech";
        backends.ssh.allowed-signers = "${config.xdg.configHome}/git/allowed_signers";
      };
    };
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  programs.git = {
    enable = true;

    signing = {
      key = "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhUktjsxUkkZybwH+NWcZajqfhIUEr+tdX1iFWo6YgJ";
      signByDefault = true;
    };

    ignores = [
      ".DS_Store"
    ];

    attributes = [ "*.lockb binary diff=lockb" ];

    settings = {
      user = {
        name = "Hussein Al Abry";
        email = "hussein@zidhuss.tech";
      };
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
        ssh = {
          allowedSignersFile = "${config.xdg.configHome}/git/allowed_signers";
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
      pull.rebase = true;
      fetch.prune = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      push.autoSetupRemote = true;
      commit.verbose = true;
      merge.conflictStyle = "diff3";
      rerere.enabled = true;
      url."git@github.com:".insteadOf = "https://github.com/";
      diff.lockb = {
        textconv = "bun";
        binary = true;
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        selectedLineBgColor = [ "reverse" ];
      };
      gui.showIcons = true;
      git = {
        pagers = [
          { externalDiffCommand = "difft --color=always"; }
        ];
        autoFetch = false;
        autoRefresh = false;
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gh = {
    enable = true;

    gitCredentialHelper.enable = false;

    extensions = [
      pkgs.gh-poi
    ];

    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
      };
    };
  };

  programs.bat.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.1password/agent.sock";
    DO_NOT_TRACK = 1;
  };

  programs.fish = {
    enable = true;

    plugins =
      map
        (pkg: {
          name = pkg.name;
          src = pkg.src;
        })
        (
          with pkgs.fishPlugins;
          [
            sponge
            autopair-fish
          ]
        );

    functions.fish_user_key_bindings = {
      body = ''
        bind -M insert \cy accept-autosuggestion
      '';
    };

    shellInit = ''
      set -gx PATH "$HOME/bin" $PATH
    '';
  };

  programs.starship =
    let
      getPreset =
        name:
        (
          with builtins;
          removeAttrs (fromTOML (readFile "${pkgs.starship}/share/starship/presets/${name}.toml")) [
            "\"$schema\""
          ]
        );
    in
    {
      enable = true;
      enableTransience = true;
      settings =
        lib.recursiveUpdate
          (lib.mergeAttrsList [
            (getPreset "nerd-font-symbols")
          ])
          {
            gcloud = {
              disabled = true;
            };

            custom.jj = {
              command = "prompt";
              format = "$output";
              ignore_timeout = true;
              shell = [
                "${pkgs.starship-jj}/bin/starship-jj"
                "--ignore-working-copy"
                "starship"
              ];
              use_stdin = false;
              when = true;
            };

            git_branch = {
              disabled = true;
            };
            custom.git_branch = {
              when = "! jj --ignore-working-copy root";
              command = "starship module git_branch";
              description = "only show if we're not in a jj repo";
            };
            git_state = {
              disabled = true;
            };
            custom.git_state = {
              when = "! jj --ignore-working-copy root";
              command = "starship module git_state";
              description = "only show if we're not in a jj repo";
            };
            git_status = {
              disabled = true;
            };
            custom.git_status = {
              when = "! jj --ignore-working-copy root";
              command = "starship module git_status";
              description = "only show if we're not in a jj repo";
            };
          };
    };

  programs.fzf = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;

    extraPackages = with pkgs; [
      # language servers
      beancount-language-server
      copilot-language-server
      emmet-language-server
      gopls
      jdt-language-server
      lemminx
      lua-language-server
      marksman
      nodePackages.yaml-language-server
      nodePackages."@astrojs/language-server"
      nodePackages.vscode-langservers-extracted
      nodePackages.typescript-language-server
      nil
      zls
      phpactor
      pyright
      regal
      rubyPackages_3_3.solargraph
      tailwindcss-language-server
      taplo
      terraform-ls
      tinymist
      typescript

      # Formatters & linters
      alejandra
      gotools
      stylua
      pgformatter

      # Other editor related
      editorconfig-core-c
      editorconfig-checker
      websocat # typst-preview
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
