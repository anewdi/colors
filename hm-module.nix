self:
{ lib, config, ... }:
let
  cfg = config.colorscheme;

  # Some applications use without the hashes, so make both accesible
  full = rec {
    hash = import ./schemes/${cfg.scheme}.nix cfg.variant;
    nohash = lib.mapAttrs (name: color: lib.removePrefix "#" color) hash;
  };

  program = [
    "alacritty"
    "wezterm"
    "zathura"
    "zellij"
    "foot"
  ];

  themeVariants = {
    "mellow" = [ "dark" ];
    "everforest" = [
      "dark soft"
      "dark medium"
      "dark hard"
      "light soft"
      "light medium"
      "light hard"
    ];
    "ayu" = [ "mirage" ];
  };

  # Create options for every theme
  progOptions = builtins.listToAttrs (
    map (program: {
      name = program;
      value = lib.mkOption {
        type = with lib.types; uniq attrs;
        default = { };
        description = "${cfg.scheme} colorscheme for ${program}";
      };
    }) program
  );

  # (key) application name  - (value) theme attrset
  themes = builtins.listToAttrs (
    map (program: {
      name = program;
      value = import ./presets/${program}.nix full;
    }) program
  );
in
{
  options.colorscheme = {
    # Options to set variant and types
    variant = lib.mkOption {
      type = lib.types.enum (themeVariants.${cfg.scheme});
      default = "dark";
    };

    scheme = lib.mkOption {
      type = lib.types.enum (lib.mapAttrsToList (k: v: k) themeVariants);
      default = "mellow";
    };

    # Create the options
    colors = lib.mkOption {
      type = with lib.types; uniq attrs;
      default = full.hash;
      description = "all scheme colors";
    };
  }
  // progOptions;

  # Set the options so they can not be overridden
  config.colorscheme = themes;
}
