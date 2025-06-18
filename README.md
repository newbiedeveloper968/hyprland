# Git
```
git config --global user.name "newbiedeveloper968" && git config --global user.email "newbiedeveloper968@gmail.com" && ssh-keygen -t ed25519 -C "newbiedeveloper968@gmail.com" && git remote set-url origin git@github.com:newbiedeveloper968/hyprland.git && nvim ~/.ssh/id_ed25519.pub
```
Copy that and create a new GPG token. Then, Git Clone.

# Install requirements
```
yay -S hyprland hyprsunset hyprpaper hyprlock hypridle hyprshot waybar rofi brightnessctl alacritty git fish python-pip imv wl-clipboard openssh bluetui mako ttf-font-awesome fastfetch neovim 
```

# Post installation
### Removing existing directories
```
sudo rm -r .config/hypr ; rm -r .config/waybar ; rm -r .config/rofi ; rm -r .config/alacritty ; rm -r .config/fish ; rm -r .config/mako ; rm -r .config/fastfetch ; rm -r .config/neovim
```
### Copying to destined dirs
```
sudo cp -r pyc/hyprland/hypr .config/ ; cp -r pyc/hyprland/waybar .config/ ; cp -r pyc/hyprland/rofi .config/ ; cp -r pyc/hyprland/alacritty .config/ ; cp -r pyc/hyprland/fish .config/ ; cp -r pyc/hyprland/mako .config/ ; cp -r pyc/hyprland/fastfetch .config/ ; cp -r pyc/hyprland/neovim
```
# Neovim
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && cp pyc/hyprland/nvim/init.vim .config/nvim/
```
Inside neovim:
:PlugInstall

### Bluetooth
```
systemctl enable bluetooth.service && systemctl start bluetooth.service
```
If br-connection-profile-unavailable:
```
systemctl --user restart pipewire pipewire-pulse && sudo systemctl restart bluetooth
```

### Network Manager
```
sudo systemctl enable NetworkManager.service && sudo systemctl start NetworkManager.service
```
