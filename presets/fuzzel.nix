colors: with (builtins.mapAttrs (k: v: v + "ff") colors.nohash); {
  inherit background;
  border = foreground;
  match = foreground;
  selection = bright1;
  selection-match = background;
  selection-text = background;
}
