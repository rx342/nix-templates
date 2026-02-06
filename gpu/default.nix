{
  source ? import ./npins,
  system ? builtins.currentSystem,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config.allowUnfree = true;
    inherit system;
  },
}:

let
  inherit (pkgs) lib;
in
{
  shell = pkgs.mkShellNoCC {
    packages = with pkgs; [
      cudaPackages.cuda_nvcc
    ];
    env = {
      LD_LIBRARY_PATH = lib.makeLibraryPath (
        with pkgs;
        [
          cudaPackages.cuda_cudart
          cudaPackages.cudatoolkit
          cudaPackages.cudnn
        ]
      );
      CUDA_PATH = pkgs.cudaPackages.cudatoolkit;
    };
  };
}
