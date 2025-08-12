{
  nix2container,
  buildEnv,
  runCommandNoCC,
  coreutils,
  bashInteractive,
  dockerTools,
  cacert,
  nix,
  path,
}:

let
  tmpDirectory = runCommandNoCC "tmp" { } ''
    mkdir -p $out/tmp
  '';
in
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
        nix
      ];
      pathsToLink = [ "/bin" ];
    })
    tmpDirectory
  ];
  perms = [
    {
      path = tmpDirectory;
      regex = ".*";
      mode = "0777";
    }
  ];
  config = {
    Cmd = [ "bash" ];
    Env = [
      "SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt"
      "NIX_PATH=nixpkgs=${path}"
      "NIX_PAGER=cat"
      "USER=nobody"
    ];
  };
}
