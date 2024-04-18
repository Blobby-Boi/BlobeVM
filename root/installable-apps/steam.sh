echo "**** install steam ****"
apt update
apt install -y wget
wget -O /tmp/steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb
apt install -y /tmp/steam.deb
rm /tmp/steam.deb
