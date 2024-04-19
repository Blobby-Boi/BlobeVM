echo "**** install steam ****"
apt-get update
apt-get install -y
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb" -O /tmp/steam.deb
dpkg -i /tmp/steam.deb
sleep 1
rm /tmp/steam.deb
