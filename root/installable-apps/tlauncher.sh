echo "**** install java ****"
apt update
apt install -y default-jre wget

echo "**** install tlauncher ****"
wget -O /tmp/tlauncher.jar https://tlauncher.org/jar
mkdir -p /opt/tlauncher
mv /tmp/tlauncher.jar /opt/tlauncher/tlauncher.jar

cat > /usr/share/applications/tlauncher.desktop <<EOL
[Desktop Entry]
Name=TLauncher
Comment=Custom Minecraft launcher
Exec=java -jar /opt/tlauncher/tlauncher.jar
Icon=/opt/tlauncher/tlauncher.png
Terminal=false
Type=Application
Categories=Game;
EOL

wget -O /opt/tlauncher/tlauncher.png https://tlauncher.org/images/icon.png

chmod +x /usr/share/applications/tlauncher.desktop
