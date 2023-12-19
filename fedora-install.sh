###########################################
## Installs from minimal server image
###########################################

sudo dnf install \
   dconf \
   gdm \
   gnome-control-center \
   gnome-initial-setup \
   gnome-session-wayland-session \
   gnome-settings-daemon \
   gnome-shell \
   gnome-software \
   kitty \
   nautilus \
   polkit
   gnome-terminal

sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Desktop environment
# sudo dnf grouplist hidden -v | grep gnome
# Get all packages in gnome desktop group
# dnf groupinfo gnome-desktop
#sudo dnf group install gnome-desktop

# --
# Same but custom selection of gnome-desktop group
# --

# install missing packages in bash or suggestions
sudo dnf install -y PackageKit-command-not-found 
sudo dnf install -y PackageKit-gtk3-module
sudo dnf install -y adobe-source-code-pro-fonts

# DNS-SD service discovery
sudo dnf install -y avahi
# Disk usage
sudo dnf install -y baobab

# Document viewer
sudo dnf install -y evince evince-djvu
# Fingerprint auth
# sudo dnf install -y  fprintd-pam 
sudo dnf install -y glib-networking
sudo dnf install -y gnome-backgrounds
# Bluetooth gnome UI
#   gnome-bluetooth
sudo dnf install -y gnome-calculator gnome-calendar
sudo dnf install -y gnome-clocks gnome-color-manager
sudo dnf install -y gnome-disk-utility
sudo dnf install -y gnome-logs
sudo dnf install -y gnome-system-monitor
sudo dnf install -y gnome-terminal-nautilus
#   gnome-weather
sudo dnf install -y gvfs-afp \
   gvfs-archive \
   gvfs-fuse \
   gvfs-goa \
   gvfs-gphoto2 \
   gvfs-mtp \
   gvfs-smb \
   librsvg2
 #  libsane-hpaio # HP printer support
# Image viewer
sudo dnf install -y loupe
sudo dnf install -y mesa-dri-drivers \
   mesa-libEGL
# Smart devices
sudo dnf install -y rygel
# file preview for nautilus
sudo dnf install -y sushi \
   systemd-oomd-defaults
#   totem # movie player
sudo dnf install -y celluloid
# File indexing
sudo dnf install -y tracker \
   tracker-miners

# Browser
sudo dnf intall firefox -y

