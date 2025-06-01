{
  source ? import ./npins,
  system ? builtins.currentSystem,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
}:

pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
  packages = with pkgs; [
    clang-tools
    cmake
    just
  ];
}
