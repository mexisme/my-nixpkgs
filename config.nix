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
    #go = go_1_6;

    excon = lib.callPackageWith pkgs_ ./pkgs/ruby-modules/excon {};

    # pkgs is your overridden set of packages itself
    my-dev-tools = with pkgs; buildEnv {
      name = "my-dev-tools";
      paths = [
        asciidoc
        "apache-maven"
        bundix
        cmake
        direnv
        editorconfig-core-c
        emacs
        git
        git-lfs
        gitAndTools.git-annex-remote-b2
        gitAndTools.gitflow
        go2nix
        gradle
        leiningen
        mercurial
        mr
        patchelf
        python27Packages.hg-git
        #python35Packages.hg-git
        #rake  # Clashes with bundler?
        sbt
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
        rustc
        scala
        #stack  # libsecurity_utilities-osx-10.7.5 fails to build

        # Libraries:
        bundler
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
        packer
        pwgen
        python35Packages.awscli
        screen
        tmux
        xz
        zile
        zsh
      ];
    };
  };
}
