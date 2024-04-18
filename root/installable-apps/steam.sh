echo "**** install steam ****"
apt update
apt install -y libatomic1 wget
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb" -O /tmp/steam.deb
dpkg -i /tmp/steam.deb
sleep 1
rm /tmp/steam.deb
