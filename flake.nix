{
  outputs =
    { self, ... }:
    {
      homeManagerModules = {
        default = self.homeManagerModules.everforest;
        everforest = import ./hm-module.nix self;
      };
    };
}
