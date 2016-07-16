{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);

  self = {
    pkgconfig = callPackage ./pkgs/pkgconfig { };

    gpm = callPackage ./pkgs/gpm { };

    mc = callPackage ./pkgs/mc { };
  };
in
self
