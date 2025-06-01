{
  source ? import ./npins,
  system ? builtins.currentSystem,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
}:

pkgs.mkShell {
  packages = with pkgs; [
    cmake
    just
  ];
}
