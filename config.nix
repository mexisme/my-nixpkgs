{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    #jre = oraclejre8;
    jre = jre8;
    jdk = jdk8;
    openjdk = openjdk8;
    # The standard version will only work Linux
    # mc = lib.callPackageWith (pkgs_ // xlibs) ./pkgs/mc { };
    python3 = python35;
    #python = python35;
    #go = "nixos-unstable".go;

    #excon = lib.callPackageWith pkgs_ ./pkgs/ruby-modules/excon {};

    all = with pkgs; buildEnv {
      name = "all";
      paths = [
        my-tools
        my-net-tools

        my-x-tools
        my-gnome-tools
        # my-kde-tools

        my-x-graphics-tools

        my-dev-tools
        my-dev-langs-libs
        my-python-tools
        my-rubylang-tools
        my-rustlang-tools
        my-nodejs-tools
        my-java-tools
        my-golang-tools
      ];
    };

    # pkgs is your overridden set of packages itself
    my-tools = with pkgs; buildEnv {
      name = "my-tools";
      paths = [
        ddrescue
        faac
        faad2
        flac
        gnupg
        gpgme
        gtypist
        htop
        imagemagick
        lame
        mc
        #neovim
        "nix-zsh-completions"
        postgresql
        pwgen
        redis
        screen
        tmux
        vagrant
        xz
        zile
        zsh

        #salt
      ];
    };

    # pkgs is your overridden set of packages itself
    my-net-tools = with pkgs; buildEnv {
      name = "my-net-tools";
      paths = [
        #cacert  # This seems to be installed by default, now?
        curl
        #irssi
        #irssi_otr   # Appears to use GCC-isms on linker?
        lftp
        ncftp
        openssh
        telnet
        weechat
        wget
      ];
    };

    # pkgs is your overridden set of packages itself
    my-x-tools = with pkgs; buildEnv {
      name = "my-x-tools";
      paths = [
        desktop_file_utils
        keepassx-community
        meld
        pass
        pavucontrol
        qtpass
        skype
        slack
        spotify
      ];
    };

    # pkgs is your overridden set of packages itself
    my-gnome-tools = with pkgs; buildEnv {
      name = "my-gnome-tools";
      paths = [
        #rhythmbox
      ];
    };

    # pkgs is your overridden set of packages itself
    my-kde-tools = with pkgs; buildEnv {
      name = "my-kde-tools";
      paths = [
        ark
        kate
        kcalc
        # kgpg
        gwenview
        okteta
        okular
        spectacle
      ];
    };

    # pkgs is your overridden set of packages itself
    my-x-graphics-tools = with pkgs; buildEnv {
      name = "my-x-graphics-tools";
      paths = [
        ghostscriptX
        inkscape
        # synfigstudio
      ];
    };

    # pkgs is your overridden set of packages itself
    my-dev-tools = with pkgs; buildEnv {
      name = "my-dev-tools";
      paths = [
        asciidoc
        "apache-maven"
        cmake
        darcs
        editorconfig-core-c
        emacs
        git
        gitAndTools.git-remote-hg
        gitAndTools.gitflow
        gnumake
        mr
        multimarkdown   # Appears to be less-functional
        patchelf
        readline
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
        #ghc
        stack  # libsecurity_utilities-osx-10.7.5 fails to build

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
        #python35Packages.markdown2
        python35Packages.yamllint
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
        cargo
        rustc
        rustfmt   ## Can't compile rustc!
      ];
    };

    # pkgs is your overridden set of packages itself
    my-nodejs-tools = with pkgs; buildEnv {
      name = "my-nodejs-tools";
      paths = [
        nodejs
        npm2nix
      ];
    };

    # pkgs is your overridden set of packages itself
    my-java-tools = with pkgs; buildEnv {
      name = "my-java-tools";
      paths = [
        jdk8
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
        glide
        go2nix
        git-lfs
        gitAndTools.git-annex-remote-b2
        packer
      ];
    };
  };
}
