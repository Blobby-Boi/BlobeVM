echo "**** install VirtualBox ****"
apt update
apt install -y wget
wget https://download.virtualbox.org/virtualbox/6.1.30/virtualbox-6.1_6.1.30-148432~Debian~bullseye_amd64.deb -O /tmp/virtualbox.deb
apt install -y /tmp/virtualbox.deb
rm /tmp/virtualbox.deb
