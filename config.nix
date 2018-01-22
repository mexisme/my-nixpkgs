{
  allowUnfree = true;
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    #jre = oraclejre8;
    jre = jre8;
    jdk = jdk8;
    openjdk = openjdk8;
    # The standard version will only work Linux
    # mc = lib.callPackageWith (pkgs_ // xlibs) ./pkgs/mc { };
    python3 = python36;
    #python3 = python36Full;
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
        #my-kde-tools

        my-games
        my-x-graphics-tools

        my-dev-tools
        my-x-dev-tools
        my-dev-langs-libs
        my-c-tools
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
        drive
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
        pass
        postgresql
        pwgen
        redis
        screen
        tmux
        python36Packages.upass
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
        #keybase
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
        calibre
        desktop_file_utils
        keepassx-community
        keybase-gui
        meld
        pavucontrol
        #qsyncthingtray
        qtpass
        signal-desktop
        skype
        slack
        spotify
        #syncthing-tray
      ];
    };

    # pkgs is your overridden set of packages itself
    my-gnome-tools = with pkgs; buildEnv {
      name = "my-gnome-tools";
      paths = [
        #rhythmbox
        gpa
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
    my-games = with pkgs; buildEnv {
      name = "my-games";
      paths = [
        minecraft
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
        bazel
        cmake
        #darcs
        editorconfig-core-c
        emacs
        git
        gitAndTools.git-remote-hg
        gitAndTools.gitflow
        gnumake
        mr
        multimarkdown   # Appears to be less-functional
        patchelf
        protobuf
        readline
        silver-searcher
        subversion
        uncrustify
        upx
      ];
    };

    # pkgs is your overridden set of packages itself
    my-x-dev-tools = with pkgs; buildEnv {
      name = "my-x-dev-tools";
      paths = [
        atom
        vscode
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
    my-c-tools = with pkgs; buildEnv {
      name = "my-c-tools";
      paths = [
        #clang
        gcc
      ];
    };

    # pkgs is your overridden set of packages itself
    my-python-tools = with pkgs; buildEnv {
      name = "my-python-tools";
      paths = [
        python
        python3
        #python35

        python27Packages.pip
        python36Packages.pip
        python27Packages.pip-tools
        python36Packages.pip-tools
        pipenv

        mercurial
        #python35Packages.awscli
        awscli
        python27Packages.hg-git
        #python36Packages.hg-git
        #hg-git
        #python35Packages.markdown2
        python36Packages.yamllint
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
