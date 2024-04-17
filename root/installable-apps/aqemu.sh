apt update
apt install -y aqemu
sleep 1
rm /usr/share/applications/aqemu.desktop
cp /installable-apps/aqemu.desktop /usr/share/applications/aqemu.desktop