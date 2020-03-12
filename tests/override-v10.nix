{pkgs ? import <nixpkgs> {
  inherit system;
}, system ? builtins.currentSystem}:

let
  nodePackages = import ./default-v10.nix {
    inherit pkgs system;
  };
in
nodePackages // {
  node-libcurl = nodePackages.node-libcurl.override {
    buildInputs = [ pkgs.curl ];
  };
}
