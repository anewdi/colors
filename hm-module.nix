self:
{ lib, config, ... }:
let
  cfg = config.colorschemes.everforest;
  everforest = (import ./colors.nix).${cfg.type}.${cfg.variant};

  mkscheme =
    palette:
    lib.mkOption {
      type = with lib.types; attrsOf str;
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

    foot = mkscheme (import ./themes/foot.nix everforest);
    zathura = mkscheme (import ./themes/zathura.nix everforest);
  };
}
