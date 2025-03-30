theme:
let
  light =
    let
      fg = {
        foreground = "#5C6A72";
        regular0 = "#5c6a72";
        regular1 = "#F85552";
        regular2 = "#8DA101";
        regular3 = "#DFA000";
        regular4 = "#3A94C5";
        regular5 = "#DF69BA";
        regular6 = "#35A77C";
        regular7 = "#E8E5D5";

        orange = "#F57D26";

        grey0 = "#A6B0A0";
        grey1 = "#939F91";
        grey2 = "#829181";

        statusline1 = "#93B259";
        statusline2 = "#708089";
        statusline3 = "#E66868";
      };
    in
    {
      hard = (
        {
          bg_dim = "#F2EFDF";
          background = "#FFFBEF";
          bg1 = "#F8F5E4";
          bg2 = "#F2EFDF";
          bg3 = "#EDEADA";
          bg4 = "#E8E5D5";
          bg5 = "#BEC5B2";
          bg_visual = "#F0F2D4";
          bg_red = "#FFE7DE";
          bg_green = "#F3F5D9";
          bg_blue = "#ECF5ED";
          bg_yellow = "#FEF2D5";
        }
        // fg
      );
      medium = (
        {
          bg_dim = "#EFEBD4";
          background = "#FDF6E3";
          bg1 = "#F4F0D9";
          bg2 = "#EFEBD4";
          bg3 = "#E6E2CC";
          bg4 = "#E0DCC7";
          bg5 = "#BDC3AF";
          bg_visual = "#EAEDC8";
          bg_red = "#FBE3DA";
          bg_green = "#F0F1D2";
          bg_blue = "#E9F0E9";
          bg_yellow = "#FAEDCD";
        }
        // fg
      );
      soft = (
        {
          bg_dim = "#E5DFC5";
          background = "#F3EAD3";
          bg1 = "#EAE4CA";
          bg2 = "#E5DFC5";
          bg3 = "#DDD8BE";
          bg4 = "#D8D3BA";
          bg5 = "#B9C0AB";
          bg_visual = "#E1E4BD";
          bg_red = "#F5DBD0";
          bg_green = "#E5E6C5";
          bg_blue = "#E1E7DD";
          bg_yellow = "#F1E4C5";
        }
        // fg
      );
    };
  dark =
    let
      fg = {
        foreground = "#D3C6AA";
        regular0 = "#4b565c";
        regular1 = "#E67E80";
        regular2 = "#A7C080";
        regular3 = "#DBBC7F";
        regular4 = "#7FBBB3";
        regular5 = "#D699B6";
        regular6 = "#83C092";
        regular7 = "#D3C6AA";

        bright0 = "#414B50";
        bright1 = "#E67E80";
        bright2 = "#A7C080";
        bright3 = "#DBBC7F";
        bright4 = "#7FBBB3";
        bright5 = "#D699B6";
        bright6 = "#83C092";
        bright7 = "#D3C6AA";

        orange = "#E69875";

        grey0 = "#7A8478";
        grey1 = "#859289";
        grey2 = "#9DA9A0";

        statusline1 = "#A7C080";
        statusline2 = "#D3C6AA";
        statusline3 = "#E67E80";
      };
    in
    {
      hard = (
        {
          bg_dim = "#1E2326";
          background = "#272E33";
          bg1 = "#2E383C";
          bg2 = "#374145";
          bg3 = "#414B50";
          bg4 = "#495156";
          bg5 = "#4F5B58";
          bg_visual = "#4C3743";
          bg_red = "#493B40";
          bg_green = "#3C4841";
          bg_blue = "#384B55";
          bg_yellow = "#45443C";
        }
        // fg
      );
      medium = (
        {
          bg_dim = "#232A2E";
          background = "#2D353B";
          bg1 = "#343F44";
          bg2 = "#3D484D";
          bg3 = "#475258";
          bg4 = "#4F585E";
          bg5 = "#56635f";
          bg_visual = "#543A48";
          bg_red = "#514045";
          bg_green = "#425047";
          bg_blue = "#3A515D";
          bg_yellow = "#4D4C43";
        }
        // fg
      );
      soft = (
        {
          bg_dim = "#293136";
          background = "#333C43";
          bg1 = "#3A464C";
          bg2 = "#434F55";
          bg3 = "#4D5960";
          bg4 = "#555F66";
          bg5 = "#5D6B66";
          bg_visual = "#5C3F4F";
          bg_red = "#59464C";
          bg_green = "#48584E";
          bg_blue = "#3F5865";
          bg_yellow = "#55544A";
        }
        // fg
      );
    };
in
{
  inherit ${cfg.type}.${cfg.variant};
}
