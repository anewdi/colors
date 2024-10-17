A simple flake which allows you to easily use the everforest theme in you config. 
Chose type(light/dark) and variant(hard/medium/soft) with the the following options 
```
colorschemes.everforest.type = "dark" #default
colorschemes.everfores.variant = "medium" # default
```

## Colors
You may then access the colors with (read more about avaliable colors [here](https://github.com/sainnhe/everforest/blob/master/palette.md#highlights):
```
config.colorschemes.everforest.colors.yourcolor
```
## Presets
I will throw together some presets for everything i use myself, and am willing to add others as well. 
To use something like foot, just do ``programs.foot.colors = config.colorschemes.everforest.foot`` once you have imported the flake module.

## Install
Example `flake.nix` file:
```
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # add everforest flake
    everforest.url = "github:anewdi/everforest";
  };

  outputs = { home-manager, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
  in
  {
    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };

      # pass inputs as specialArgs
      extraSpecialArgs = { inherit inputs; };

      # import your home.nix
      modules = [ ./home-manager/home.nix ];
    };
  };
}
```
Example `home.nix` file:
```
{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.everforest.homeManagerModules.default ];

  colorschemes.everforest = {
      type = "light";
      variant = "medium";
  };
}
```
