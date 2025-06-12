{
  source ? import ./npins,
  system ? builtins.currentSystem,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
  nix2container ? import source.nix2container {
    inherit pkgs system;
  },
}:

{
  docker = pkgs.callPackage ./docker.nix {
    inherit (nix2container) nix2container;
  };
}
