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
  copyToRoot = [
    (buildEnv {
      name = "root-usr-bin-env";
      paths = [
        dockerTools.usrBinEnv
      ];
      pathsToLink = [ "/usr/bin" ];
    })
    (buildEnv {
      name = "root-bin";
      paths = [
        coreutils
        bashInteractive
        dockerTools.binSh
      ];
      pathsToLink = [ "/bin" ];
    })
  ];
  config = {
    Cmd = [ "bash" ];
  };
}
