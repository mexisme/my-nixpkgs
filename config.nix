{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    callPackage = lib.callPackageWith (pkgs_ // xlibs);

    python3 = python35;
    #with python35Packages; { pytest = pytest_28; }
    mc = callPackage ./pkgs/mc { };

    # pkgs is your overridden set of packages itself
    my-tools = with pkgs; buildEnv {
      name = "my-tools";
      paths = [
        mc  # The standard version will only work Linux
        "nix-zsh-completions"
        python35Packages.awscli

        #tmux
        xz
        zile
        zsh
      ];
    };

    # pkgs is your overridden set of packages itself
    my-dev-tools = with pkgs; buildEnv {
      name = "my-dev-tools";
      paths = [
        "apache-maven"
        bundix
        bundler
        getopt
        git
        gitAndTools.gitflow
        go2nix
        gradle
        leiningen
        mercurial
        mr
        patchelf
        #python27Packages.hg-git
        sbt
        silver-searcher
        subversion
        upx
      ];
    };

    # pkgs is your overridden set of packages itself
    my-dev-langs = with pkgs; buildEnv {
      name = "my-dev-langs";
      paths = [
        # Languages:
        elixir
        # elixirscript is not yet in Nix
        go
        ghc
        nodejs
        python
        python3
        #python35
        ruby
        # "ruby-1.9"
        # "ruby-2.1"
        # "ruby-2.2"
        # "ruby-2.3"
        #rustc
        scala
        #stack
      ];
    };
  };
}
