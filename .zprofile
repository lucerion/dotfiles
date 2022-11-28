# Autostart X at login
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
    startx;
fi

# Add ~/bin to $PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
