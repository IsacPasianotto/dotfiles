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

- Install the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager:
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

- Some packages that you will probably want to install (note, this list of package name is for fedora): 
    
    ```bash 
    # utilities ...

    sudo dnf install -y libnotify wlogout jetbrains-mono-fonts-all bat \
        adwaita-blue-gtk-theme xfce4-settings

    # programs  ... 

    sudo dnf install -y alacrity telegram htop gnome-calendar \
        qt5ct lxappearanc qt5-qtstylepluginse chromium
    ```
