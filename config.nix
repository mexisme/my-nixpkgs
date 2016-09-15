{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    #jre = oraclejre8;
    jre = jre8;
    jdk = jdk8;
    openjdk = openjdk8;
    # The standard version will only work Linux
    mc = lib.callPackageWith (pkgs_ // xlibs) ./pkgs/mc { };
    python3 = python35;
    #python = python35;

    #excon = lib.callPackageWith pkgs_ ./pkgs/ruby-modules/excon {};

    # pkgs is your overridden set of packages itself
    my-dev-tools = with pkgs; buildEnv {
      name = "my-dev-tools";
      paths = [
        asciidoc
        "apache-maven"
        cmake
        editorconfig-core-c
        emacs
        git
        gitAndTools.gitflow
        mr
        patchelf
        silver-searcher
        subversion
        upx
      ];
    };

    # pkgs is your overridden set of packages itself
    my-dev-langs-libs = with pkgs; buildEnv {
      name = "my-dev-langs-libs";
      paths = [
        # Languages:
        elixir
        # elixirscript is not yet in Nix
        ghc
        #stack  # libsecurity_utilities-osx-10.7.5 fails to build

        # Libraries:
        #excon
        getopt
        #intltool
        libiconv
        #libgit2
        openssl
        pkgconfig

      ];
    };

    # pkgs is your overridden set of packages itself
    my-tools = with pkgs; buildEnv {
      name = "my-tools";
      paths = [
        #cacert  # This seems to be installed by default, now?
        curl
        ddrescue
        #faac
        faad2
        flac
        htop
        irssi
        #irssi_otr   # Appears to use GCC-isms on linker?
        lame
        mc
        "nix-zsh-completions"
        pwgen
        screen
        tmux
        xz
        zile
        zsh
      ];
    };

    # pkgs is your overridden set of packages itself
    my-python-tools = with pkgs; buildEnv {
      name = "my-python-tools";
      paths = [
        python
        python3
        #python35

        mercurial
        python35Packages.awscli
        python27Packages.hg-git
        #python35Packages.hg-git
      ];
    };

    # pkgs is your overridden set of packages itself
    my-rubylang-tools = with pkgs; buildEnv {
      name = "my-rubylang-tools";
      paths = [
        ruby
        # "ruby-1.9"
        # "ruby-2.1"
        # "ruby-2.2"
        # "ruby-2.3"

        bundix
        bundler
        #excon
        #rake  # Clashes with bundler?
      ];
    };

    # pkgs is your overridden set of packages itself
    my-rustlang-tools = with pkgs; buildEnv {
      name = "my-rustlang-tools";
      paths = [
        rustc
        #rustfmt   ## Can't compile rustc!
      ];
    };

    # pkgs is your overridden set of packages itself
    my-nodejs-tools = with pkgs; buildEnv {
      name = "my-nodejs-tools";
      paths = [
        nodejs
        #npm2nix
      ];
    };

    # pkgs is your overridden set of packages itself
    my-java-tools = with pkgs; buildEnv {
      name = "my-java-tools";
      paths = [
        gradle
        leiningen
        scala
        sbt
      ];
    };

    # pkgs is your overridden set of packages itself
    my-golang-tools = with pkgs; buildEnv {
      name = "my-golang-tools";
      paths = [
        go

        direnv
        go2nix
        git-lfs
        gitAndTools.git-annex-remote-b2
        packer
      ];
    };
  };
}
