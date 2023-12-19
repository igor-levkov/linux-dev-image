# virtual machine agent
#sudo dnf install spice-vdagent


#   ModemManager # 3g devices
#   NetworkManager-adsl # adsl modems pppoe etc.
# VPN prerequisities
# sudo install -y  NetworkManager-openconnect-gnome \
#   NetworkManager-openvpn-gnome \
#   NetworkManager-ppp \
#   NetworkManager-pptp-gnome \
#   NetworkManager-ssh-gnome \
#   NetworkManager-vpnc-gnome \
#   NetworkManager-wwan \

# install missing packages in bash or suggestions
sudo dnf install -y PackageKit-command-not-found 
sudo dnf install -y PackageKit-gtk3-module
sudo dnf install -y adobe-source-code-pro-fonts
#   at-spi2-atk
#   at-spi2-core
# DNS-SD service discovery
sudo dnf install -y avahi
# Disk usage
# sydo dnf install -y baobab
 #  cheese

# Document viewer
sudo dnf install -y evince evince-djvu
# Fingerprint auth
# sudo dnf install -y  fprintd-pam 
sudo dnf install -y glib-networking
sudo dnf install -y gnome-backgrounds
#   gnome-bluetooth
# install extensions through browser
# sudo gnome-browser-connector 
sudo dnf install -y gnome-calculator gnome-calendar
#   gnome-characters
#   gnome-classic-session
sudo dnf install -y gnome-clocks gnome-color-manager
#   gnome-contacts
sudo dnf install -y gnome-disk-utility
#   gnome-font-viewer
sudo dnf install -y gnome-logs
#   gnome-maps
#   gnome-remote-desktop
sudo dnf install -y gnome-system-monitor
sudo dnf install -y gnome-terminal-nautilus
#   gnome-user-docs
#   gnome-user-share
#   gnome-weather
#   gvfs-afc
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
#   orca
 #smart devices
sudo dnf install -y rygel
#   sane-backends-drivers-scanners
#   simple-scan
# file preview for nautilus
sudo dnf install -y sushi \
   systemd-oomd-defaults
#   totem # movie player
sudo dnf install -y celluloid
# File indexing
sudo dnf install -y tracker \
   tracker-miners
# Sandboxed applications prerequisities like flatpack
#   xdg-desktop-portal
#   xdg-desktop-portal-gnome
#   xdg-desktop-portal-gtk
#   xdg-user-dirs-gtk
