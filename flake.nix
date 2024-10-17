{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      homeManagerModules = {
        default = inputs.self.homeManagerModules.everforest;
        everforest = import ./hm-module.nix inputs.self;
      };
    };
}
