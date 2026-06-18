variant:
let
  all = {
    mirage = {
      foreground = "#CCCAC2";
      background = "#242936";

      regular0 = "#0A0000";
      regular1 = "#F06B5C";
      regular2 = "#BFE760";
      regular3 = "#E6B752";
      regular4 = "#3BBBF4";
      regular5 = "#D09FFD";
      regular6 = "#84CEB5";
      regular7 = "#D2D6DC";

      bright0 = "#0A0000";
      bright1 = "#F39184";
      bright2 = "#D5FF80";
      bright3 = "#FFCD66";
      bright4 = "#73D0FF";
      bright5 = "#DFBFFF";
      bright6 = "#95E6CB";
      bright7 = "#E3E6EA";

    };
  };
in
builtins.getAttr variant all
