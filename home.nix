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
    dogdns

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
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/zidhuss/dotfiles/configs/nvim";
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
        ssh = {
          allowedSignersFile = "${config.xdg.configHome}/git/allowed_signers";
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
      pull.rebase = true;
      fetch.prune = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      log.showSignature = true;
      push.autoSeutpRemote = true;
      commit.verbose = true;
      merge.conflictStyle = "diff3";
      rerere.enabled = true;
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

    functions.fish_user_key_bindings = {
      body = ''
        bind -M insert \cy accept-autosuggestion
      '';
    };

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

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;
    aggressiveResize = true;
    escapeTime = 0;
    shortcut = "a";
    terminal = "wezterm";

    extraConfig = ''
      set -g renumber-windows on
      set -g allow-rename off

      # Stay in directory on slits
      bind '%' split-window -h -c '#{pane_current_path}'  # Split panes horizontal
      bind '"' split-window -v -c '#{pane_current_path}'  # Split panes vertically
      bind c new-window -c '#{pane_current_path}' # Create new window

      # Undercurl
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

      # Shift-movement keys will resize panes
      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2

      # tmux battery
      set -g @batt_icon_charge_tier8 ""
      set -g @batt_icon_charge_tier7 ""
      set -g @batt_icon_charge_tier6 ""
      set -g @batt_icon_charge_tier5 ""
      set -g @batt_icon_charge_tier4 ""
      set -g @batt_icon_charge_tier3 ""
      set -g @batt_icon_charge_tier2 ""
      set -g @batt_icon_charge_tier1 ""
      set -g @batt_icon_status_charged " "
      set -g @batt_icon_status_charging "  "
      set -g @batt_icon_status_discharging " "
      set -g @batt_icon_status_attached " "
      set -g @batt_icon_status_unknown " "


      # default light colours
      color_bg="#f0f0f0"
      color_fg="#fafafa"
      color_green="#1da912"
      color_yellow="#eea825"
      color_red="#e05661"
      color_blue="#118dc3"
      color_cyan="#56b6c2"
      color_purple="#9a77cf"
      color_gray="#bebebe"
      color_buffer="#6a6a6a"
      color_selection="#bfceff"

      # Statusline
      set -g status on
      set -g status-justify centre
      set -g status-position bottom
      setw -g mode-style bg=$color_purple,fg=$color_bg
      setw -g window-status-separator "   "
      set -g status-style "bg=$color_fg"
      set -g message-style bg=$color_blue,fg=$color_bg
      set -g status-left "#[fg=$color_gray]#(hostname)"
      set -g status-right "#[fg=$color_gray]#{battery_icon_charge}  #{battery_percentage}#{battery_icon_status}"

      setw -g window-status-format "#[fg=$color_gray,italics]#I #[noitalics]#W  "
      setw -g window-status-current-format "#[fg=$color_purple,italics]• #[noitalics,bold]#W  "
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      battery
      tmux-thumbs
      resurrect
      continuum
      better-mouse-mode
    ];
  };

  xdg.configFile."tmux/light.conf" = {
    source = ./configs/tmux/light.conf;
  };

  xdg.configFile."tmux/dark.conf" = {
    source = ./configs/tmux/dark.conf;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
