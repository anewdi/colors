self:
{ lib, config, ... }:
let
  cfg = config.colorscheme;

  # Some applications use without the hashes, so make both accesible
  full = rec {
    hash = import ./colors/${cfg.scheme}.nix cfg;
    nohash = lib.mapAttrs (name: color: lib.removePrefix "#" color) hash;
  };

  # Function to create uniq option (so that colors are not overridable)
  mkscheme =
    name:
    lib.mkOption {
      type = with lib.types; uniq anything;
      default = { };
      description = "${cfg.scheme} colorscheme for ${name}";
    };

  themes = [
    "alacritty"
    "wezterm"
    "zathura"
    "zellij"
    "foot"
  ];

  # Create options for every theme
  initoptions = builtins.listToAttrs (
    builtins.map (theme: {
      name = theme;
      value = mkscheme "${theme}";
    }) themes
  );

  # Map the themes to their name in an attrset
  setscheme = builtins.listToAttrs (
    builtins.map (theme: {
      name = theme;
      value = import ./themes/${theme}.nix full;
    }) themes
  );
in
{

  options.colorscheme = {
    # Options to set variant and types
    type = lib.mkOption {
      type = lib.types.enum [
          "dark"
          "light"
        ];
      default = "dark";
    };
    variant = lib.mkOption {
      type = lib.types.enum [
          "hard"
          "medium"
          "soft"
        ];
      default = "medium";
    };
    scheme = lib.mkOption{
      type = lib.types.enum [
          "mellow"
          "everforest"
      ];
      default = "mellow";
    }

    # Create the options
    colors = mkscheme "colors";
  } // initoptions;

  # Set the options so they can not be overridden
  config.colorscheme = setscheme // {
      colors = full.hash;
  };
}
