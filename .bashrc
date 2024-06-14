# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# export PATH=$PATH:/home/pasianeight/Downloads/Programs/quarto/quarto-1.3.450/bin
export PATH=$PATH:/home/pasianeight/Downloads/Programs/quarto/quarto-1.4.550/bin
export PATH=$PATH:/home/pasianeight/Downloads/Programs/gradle/gradle-8.5/bin
export PATH=$PATH:/home/pasianeight/Downloads/Programs/drawio
export PATH=$PATH:/home/pasianeight/Downloads/Programs/Clion/clion-2023.3.4/bin
export PATH=$PATH:/home/pasianeight/Downloads/Programs/bitwarden
export PATH=$PATH:/home/pasianeight/Downloads/Programs/pycharm/pycharm-2024.1/bin


alias vim='nvim'

export EDITOR='nvim'
alias clion="clion.sh"




## KUBERNETES
export KUBECONFIG=$HOME/.kube/config.yaml
alias "k context"="kubectl config use-context"

## VPN 
alias "vpn-area"="sudo openfortivpn -c $HOME/.openfortivpn/AREA-config"
alias "vpn-killall"="sudo killall openfortivpn"
