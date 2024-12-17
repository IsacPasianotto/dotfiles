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

export PATH=$PATH':$HOME/bin'
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


alias "vpn-area"="sudo openfortivpn -c $HOME/.openfortivpn/AREA-config"
alias "vpn-area-kill"="sudo killall openfortivpn"
alias "vpn-casa"="sudo wg-quick up $HOME/.wireguard/thinkad-t490.conf"
alias "vpn-casa-kill"="sudo wg-quick down $HOME/.wireguard/thinkad-t490.conf"

export KUBECONFIG=$HOME/.kube/config.yaml

