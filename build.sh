echo "
    --- Fish Env Build Script ---
    By input 'yes' and press the Enter key, the following items will be executed.
        - install fish shell, oh my fish, fisher, peco
        - set fish shell as the login shell
        - add config for peco
"
read input
if [ $input = "yes" ]; then
    # install fish shell
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish

    # set fish shell as the login shell
    chsh -s $(which fish)

    # install oh my fish
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

    # install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    # install peco
    fisher install oh-my-fish/plugin-peco

    # add config for peco
    echo "
    function fish_user_key_bindings
        bind \cr 'peco_select_history (commandline -b)'
    end
    " >> ~/.config/fish/config.fish

else
    echo "Canceled."

fi
