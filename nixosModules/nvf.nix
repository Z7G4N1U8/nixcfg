{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.nvf.nixosModules.default ];
  environment.sessionVariables.EDITOR = "nvim";

  programs.nvf = {

    enable = true;
    settings.vim = {

      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      debugMode = {
        enable = false;
        level = 16;
        logFile = "/tmp/nvim.log";
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
      };

      visuals = {
        # nvim-scrollbar.enable = isMaximal;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      treesitter.context.enable = true;
      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      telescope.enable = true;
      statusline.lualine.enable = true;
      notify.nvim-notify.enable = true;
      comments.comment-nvim.enable = true;

      languages = {
        markdown.enable = true;
        bash.enable = true;
        css.enable = true;
        clang.enable = true;
        python.enable = true;
        rust.enable = true;
        nix = {
          enable = true;
          format = {
            enable = true;
            type = "nixfmt";
            package = pkgs.nixfmt-rfc-style;
          };
          lsp.enable = true;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            nix = "110";
            ruby = "120";
            java = "130";
            go = [
              "90"
              "130"
            ];
          };
        };
        fastaction.enable = true;
      };

      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };

      utility = {
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
        # images.image-nvim.enable = true;
      };
    };

  };
}
