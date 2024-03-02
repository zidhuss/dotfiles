{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # language servers
    beancount-language-server
    lua-language-server
    marksman
    nodePackages.yaml-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nil
    terraform-lsp
    zls
    pyright
    typescript

    # Formatters & linters
    alejandra
    stylua
    pgformatter
    nodePackages.fixjson

    # Other editor related
    editorconfig-core-c
    editorconfig-checker

    # http
    hey
    caddy

    # Containers
    lazydocker
    docker-client

    # tools
    fd
    ripgrep
    ranger

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/abry/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  xdg.enable = true;

  xdg.configFile."karabiner" = {
    source = config.lib.file.mkOutOfStoreSymlink ./configs/karabiner;
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./configs/nvim;
    recursive = true;
  };

  xdg.configFile."git/allowed_signers".text = ''
    hussein@zidhuss.tech ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhUktjsxUkkZybwH+NWcZajqfhIUEr+tdX1iFWo6YgJ
  '';

  programs.git = {
    enable = true;
    userName = "Hussein Al Abry";
    userEmail = "hussein@zidhuss.tech";
    signing = {
      key = "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhUktjsxUkkZybwH+NWcZajqfhIUEr+tdX1iFWo6YgJ";
      signByDefault = true;
    };

    delta = {
      enable = true;
      options.navigate = true;
    };

    ignores = [
      ".DS_Store"
    ];

    extraConfig = {
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "${config.xdg.configHome}/git/allowed_signers";
      };
      pull.rebase = true;
      fetch.prune = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      log.showSignature = true;
      push.autoSeutpRemote = true;
      commit.verbose = true;
      merge.conflictStyle = "diff3";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        selectedLineBgColor = ["reverse"];
      };
      gui.showIcons = true;
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --line-numbers --paging=never";
        };
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
  };

  programs.fish = {
    enable = true;

    plugins =
      map
      (pkg: {
        name = pkg.name;
        src = pkg.src;
      })
      (with pkgs.fishPlugins; [
        sponge
        autopair-fish
      ]);

    shellInit = ''
      set -gx PATH "$HOME/bin" $PATH
    '';

    interactiveShellInit = ''
      eval (/opt/homebrew/bin/brew shellenv)
    '';
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export PATH"=$HOME/bin:$PATH"
    '';
  };

  programs.fzf = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

  programs.tmux.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
