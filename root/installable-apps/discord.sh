apt update
apt install -y libatomic1

wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
dpkg -i discord.deb
sleep 1
rm discord.deb