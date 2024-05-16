# Fedora dotfiles

Assuming you have a fresh installation of fedora, some of the things you may want are: 

- Eable the [rpm-fusion repository](https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup/)
    
    ```bash
    sudo dnf install \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    # maybe also the non-free repos
    sudo dnf install \
         https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    ```

- Other repository you may want: 

    ```bash 
    # VS-code, see there for more updates info: https://code.visualstudio.com/docs/setup/linux

    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update && sudo dnf install code 
    
    ```


- Install the [nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation) following the [fedora doc](https://docs.fedoraproject.org/en-US/quick-docs/fonts/):

    ```bash
    cd $HOME/Downloads
    mkdir fonts
    cd fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hack.zip
    unzip Hack.zip
    rm Hack.zip
    # For a single-user only also ~/.local/share/fonts is ok, but somethign can be broken in root mode
    sudo mkdir -p /usr/local/share/fonts/hack
    sudo mv * /usr/local/share/fonts/hack
    cd 
    rm -r $HOME/Downloads/fonts
    ```
- Install `fish` and configure it with [tide](https://github.com/IlanCosman/tide): 
    ```
    sudo dnf install -y fish 

    # into a fish shell: 
    # install fisher, the plugin-manager needed to install tide:
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    # install tide
    fisher install IlanCosman/tide@v6
    tide configure
    ```

- install and configure also zsh: 

    ```
    sudo dnf install -y zsh
    
    # install oh-my-zsh 

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # install powerlevel10k

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # remember to set Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
    exec zsh 
    ```
- Install the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager:
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
- Configure your login manager to autologin, for example for sddm see [there](https://wiki.archlinux.org/title/SDDM#Configuration).

- Some packages that you will probably want to install (note, this list of package name is for fedora): 
    
    ```bash 
    # utilities ...

    sudo dnf install -y libnotify wlogout jetbrains-mono-fonts-all bat \
        adwaita-gtk2-theme adw-gtk3-theme nodejs exa cargo
       

    # programs  ... 

    sudo dnf install -y alacritty telegram htop gnome-calendar \
        qt5ct lxappearance qt5-qtstyleplugins chromium okular \
        libreoffice wdisplays mupdf wofi libwacom kcm_wacomtablet \ 
        gcc-c++

    # needed for emacs
    cargo install --git https://github.com/latex-lsp/texlab

    ```


- enable `copilot` inside `nvim` read the instruction [there](https://github.com/github/copilot.vim)

    ```
    git clone https://github.com/github/copilot.vim.git \
        ~/.config/nvim/pack/github/start/copilot.vim
    ```

    then start nvim and invoke the command `:Copilot setup`


- Enable the multimedia codecs (some of those are non-free):

    ```
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

    sudo dnf install lame\* --exclude=lame-devel

    sudo dnf group upgrade --with-optional Multimedia

    ```


- Install spacemac

    ```
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ```
    and then copy the `.spacemacs` file from this repository to your home directory to have all 
    the differenrce from the default

