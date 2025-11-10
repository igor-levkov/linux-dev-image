###############
# https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
###############

sudo dnf upgrade --refresh
sudo shutdown -r 1

sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=43 --allowerasing

# Trigger the upgrade process
sudo dnf5 offline reboot

###############
# Optional post-upgrade tasks
###############

# Upgrade system configuration files

sudo dnf install rpmconf
sudo rpmconf -a

# Clean-up retired packages
sudo dnf install remove-retired-packages
sudo remove-retired-packages

# Clean-up old packages
sudo dnf repoquery --duplicates
# sudo dnf remove --duplicates

# Packages that are still on your system may no longer be in the repositories
sudo dnf list --extras
# sudo dnf remove $(sudo dnf repoquery --extras --exclude=kernel,kernel-\*,kmod-\*)
# sudo dnf autoremove

old_kernels=($(dnf repoquery --installonly --latest-limit=-1 -q))
if [ "${#old_kernels[@]}" -eq 0 ]; then
    echo "No old kernels found"
    exit 0
fi

if ! sudo dnf remove "${old_kernels[@]}"; then
    echo "Failed to remove old kernels"
    exit 1
fi

echo "Removed old kernels"

# Clean-up old keys trusted for RPM package signing
sudo dnf install clean-rpm-gpg-pubkey
sudo clean-rpm-gpg-pubkey

# Clean-up old symlinks
sudo dnf install symlinks
sudo symlinks -r /usr | grep dangling

sudo symlinks -r -d /usr

# Regenerate rescue kernel
sudo rm /boot/*rescue*
sudo kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"