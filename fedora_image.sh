echo '####################################'
echo '## !!!WARNING!!!'
echo '## Your system might be restarted'
echo '## several times'
echo '####################################'
sleep 3
sudo ls > /dev/null
sudo ls > /dev/null

echo '####################################'
echo '## SET SYSTEM SETTINGS'
echo '####################################'

#set suduers withous pass
sudo sed -i.bak -e '/NOPASSWD/ s/^# *//' /etc/sudoers
sudo sed -i.bak -e '/%wheel/ {/NOPASSWD/! s/^/#/}' /etc/sudoers

#disable mouse accelaration
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.peripherals.mouse speed -0.82

#echo '####################################'
#echo '## Enable SNAP packages'
#echo '####################################'
#dnf list installed snapd > /dev/null || {
#   sudo dnf install -y snapd
#   echo 'Logout in 5 seconds. Run script again after restart'
#   /usr/bin/gnome-session-quit --no-prompt
#}

#[ -h /snap ] || {
#   sudo ln -s /var/lib/snapd/snap /snap
#   echo 'Logout in 5 seconds. Run script again after restart'
#   sleep 5
#   /usr/bin/gnome-session-quit --no-prompt
#}


#required for react native and vs code
#sudo sysctl -w fs.inotify.max_user_watches=524288
#echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/50-libreswan.conf

#echo '#####################################'
#echo '## INSTALL REPOSITORIES'
#echo '#####################################'

#paper theme
#sudo dnf config-manager --add-repo http://download.opensuse.org/repositories/home:snwh:paper/Fedora_25/home:snwh:paper.repo

echo '#####################################'
echo '## INSTALL PACKAGES'
echo '#####################################'

#dnf plugins
sudo dnf -y install dnf-plugins-core

#tweak tool
sudo dnf install -y gnome-tweaks.noarch

#visuals
sudo dnf install -y paper-icon-theme
#prerequisities for adapta theme
#sudo dnf install -y autoconf automake inkscape gdk-pixbuf2-devel glib2-devel libsass libxml2 pkgconfig sassc gnome-shell parallel

echo '#####################################'
echo '## GNOME EXTENTIONS'
echo '#####################################'

#Install
#sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
#sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

#User Themes
#gnomeshell-extension-manage --install --extension-id 19 --user --version latest

#Dash to Panel
#gnomeshell-extension-manage --install --extension-id 1160 --user --version latest

#Panel OSD
#gnomeshell-extension-manage --install --extension-id 708 --user --version latest

#Fedora Linux Updates Indicator 
#gnomeshell-extension-manage --install --extension-id 1150 --user --version latest

#Dynamic Panel Transparency
#gnomeshell-extension-manage --install --extension-id 1011 --user --version latest

#gnome-shell --replace

#Enable
#gnome-shell-extension-tool -e user-theme

echo '#####################################'
echo '## SET VISUALS'
echo '#####################################'

#adapta theme
#sudo dnf install -y adapta-gtk-theme
#git clone --depth 1 https://github.com/adapta-project/adapta-gtk-theme
#cd adapta-gtk-theme
#./autogen.sh --enable-parallel
#make
#sudo make install
#cd ..
#rm -Rf adapta-gtk-theme

#cursor breeze theme
#wget --tries=40 -O breeze.tar.gz 'https://dl.opendesktop.org/api/files/download/id/1460735269/165371-Breeze.tar.gz'
#tar -xvzf breeze.tar.gz
#mv Breeze/ ~/.icons/
#rm breeze.tar.gz

#Change themes
#gsettings set org.gnome.desktop.interface gtk-theme Adapta-Nokto
gsettings set org.gnome.desktop.interface icon-theme Paper
gsettings set org.gnome.desktop.interface cursor-theme Paper
#gsettings set org.gnome.shell.extensions.user-theme name Adapta-Nokto

gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

#sudo cp ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/org.gnome.shell.extensions.dash-to-panel.gschema.xml /usr/share/glib-2.0/schemas
#sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

#gsettings set org.gnome.shell.extensions.dash-to-panel show-showdesktop-button true
#gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-bg true
#gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-opacity true
#gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-dynamic-opacity true
#gsettings set org.gnome.shell.extensions.dash-to-panel trans-panel-opacity 0.0

#gsettings set org.gnome.shell.extensions.panel-osd x-pos 100.0
#gsettings set org.gnome.shell.extensions.panel-osd y-pos 0.0

#echo '[Settings]' >> ~/.config/gtk-3.0/settings.ini
#echo 'gtk-application-prefer-dark-theme=1' >> ~/.config/gtk-3.0/settings.ini

#Wallpaper
cp -R ./wallpapers/ $HOME/Pictures
gsettings set org.gnome.desktop.background picture-uri-dark file://$HOME/Pictures/wallpapers/droid1.jpg

echo '#####################################'
echo '## INSTALL DEVELOPMENT TOOLS'
echo '#####################################'

#Node JS
#curl -sL https://rpm.nodesource.com/setup_13.x | sudo bash -
sudo dnf install -y nodejs

#sudo snap install node --classic --channel=12

#Microsoft Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code

#code --install-extension vsmobile.vscode-react-native
#code --install-extension xabikos.ReactSnippets
#code --install-extension waderyan.nodejs-extension-pack

#ract-native
#sudo npm install -g create-react-native-app
#sudo npm install -g react-native-cli

echo '#####################################'
echo '## COMMUNICATION APPS'
echo '#####################################'

flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.telegram.desktop

echo '#####################################'
echo '## TERMINAL AND DESKTOP CONFIG'
echo '#####################################'

####fix vaforites
#gsettings get org.gnome.shell favorite-apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'code.desktop']"

####fix default terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1} # remove leading and trailing single quotes
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 132
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 43

echo '#####################################'
echo '## FIREWALL TOOLS'
echo '#####################################'
#sudo dnf install -y firewall-config.noarch
#sudo firewall-cmd --zone=internal --add-port=19000/tcp

#Setup docker
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#create new text file template
touch ~/Templates/New_File
