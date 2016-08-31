{ bundlerEnv, ruby, lib }:

bundlerEnv {
  name = "excon-0.52.0";

  inherit ruby;

  gemfile  = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset   = ./gemset.nix;

  meta = with lib; {
    description = "Usable, fast, simple HTTP 1.1 for Ruby";
    homepage = http://excon.io;
    license = with licenses; mit;
    platforms = ruby.meta.platforms;
    priority = 100;
  };
}
