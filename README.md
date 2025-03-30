A simple flake which I use to store the themes I use.
Chose colorscheme, type(light/dark) and variant(hard/medium/soft) with the the following options
```
colorscheme.scheme = "mellow" #default
colorscheme.type = "dark" #default, only has an effect for everforest
colorscheme.variant = "medium" # default, only has an effect for everforest
```


## Presets
To use something like foot, I do ``programs.foot.colors = config.colorscheme.foot`` once the flake moduleis imported.

The option is an attrset of colors so it can also be merged like this:
```
programs.alacritty.settings = {
    some.config = true;
} // config.colorscheme.alacritty;
```

Curren presets:
* zathura
* foot
* alacritty
* zellij
* wezterm

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
    colors.url = "github:anewdi/colors";
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
  imports = [ inputs.colors.homeManagerModules.default ];

  colorscheme = {
      scheme = "everforest"
      type = "light";
      variant = "medium";
  };

  programs.foot = {
    enable = true;
    colors = config.colorscheme.foot;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "None";
      };
    } // config.colorscheme.alacritty;
  };
}
```

