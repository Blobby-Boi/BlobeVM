echo "**** install steam ****"
apt-get update
apt-get install -y libatomic1 wget libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-launcher zenity
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb" -O /tmp/steam.deb
dpkg -i /tmp/steam.deb
sleep 1
rm /tmp/steam.deb
