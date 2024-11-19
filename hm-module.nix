self:
{ lib, config, ... }:
let
  cfg = config.colorschemes.everforest;
  everforest = (import ./colors.nix).${cfg.type}.${cfg.variant};
  nohash = lib.mapAttrs (name: color: lib.removePrefix "#" color) everforest;

  full = {
    hash = everforest;
    nohash = nohash;
  };

  mkscheme =
    palette:
    lib.mkOption {
      type = with lib.types; anything;
      default = palette;
      description = "Everforest colorscheme";
    };
in
{
  options.colorschemes.everforest = {
    type = lib.mkOption {
      type =
        with lib.types;
        enum [
          "dark"
          "light"
        ];
      default = "dark";
    };
    variant = lib.mkOption {
      type =
        with lib.types;
        enum [
          "hard"
          "medium"
          "soft"
        ];
      default = "medium";
    };

    colors = mkscheme everforest;

    foot = mkscheme (import ./themes/foot.nix full);
    alacritty = mkscheme (import ./themes/alacritty.nix full);
    wezterm = mkscheme (import ./themes/wezterm.nix full);
    zathura = mkscheme (import ./themes/zathura.nix full);
    zellij = mkscheme (import ./themes/zellij.nix full);
  };
}
