echo "**** install VirtualBox ****"
apt update
apt install -y wget
wget "https://download.virtualbox.org/virtualbox/6.1.30/virtualbox-6.1_6.1.30-147558~Debian~bullseye_amd64.deb" -O /tmp/virtualbox.deb
dpkg -i /tmp/virtualbox.deb
apt install -y -f
rm /tmp/virtualbox.deb
