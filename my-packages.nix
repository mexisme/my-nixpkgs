{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);

  self = {
    mc = callPackage ./pkgs/mc { };
    rocker = callPackage ./pkgs/rocker { };
  };
in
self
