self:
{ lib, config, ... }:
let
  cfg = config.colorschemes.everforest;
  everforest = (import ./colors.nix).${cfg.type}.${cfg.variant};
  hash = lib.mapAttrs (name: color: "#" + color) everforest;

  full = {
    hash = hash;
    nohash = everforest;
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
    zathura = mkscheme (import ./themes/zathura.nix full);
  };
}
