{
  nix2container,
  buildEnv,
  coreutils,
  bashInteractive,
  dockerTools,
}:

nix2container.buildImage {
  name = "docker-image-name";
  tag = "0.1.0";
  copyToRoot = buildEnv {
    name = "root";
    paths = [
      coreutils
      bashInteractive
      dockerTools.usrBinEnv
      dockerTools.binSh
    ];
    pathsToLink = [ "/bin" ];
  };
  config = {
    Cmd = [ "${bashInteractive}/bin/bash" ];
  };
  layers = [
    (nix2container.buildLayer {
      deps = [
        coreutils
        bashInteractive
        dockerTools.usrBinEnv
        dockerTools.binSh
      ];
    })
  ];
}
