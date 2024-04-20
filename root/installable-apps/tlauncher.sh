echo "**** Fixing broken dependencies ****"
apt update
apt --fix-broken install -y

echo "**** Installing OpenJDK 17 ****"
apt install -y openjdk-17-jdk wget unzip

echo "**** Downloading TLauncher ****"
wget -O /tmp/TLauncher.jar https://repo.tlauncher.org/update/lch/starter-core-1.11-v10.jar
mkdir -p /opt/tlauncher
mv /tmp/TLauncher.jar /opt/tlauncher/
rm /tmp/TLauncher.jar

cat > /usr/share/applications/tlauncher.desktop <<EOL
[Desktop Entry]
Name=TLauncher
Comment=Minecraft launcher
Exec=java -jar /opt/tlauncher/TLauncher.jar
Icon=/opt/tlauncher/TLauncher_icon.png
Terminal=false
Type=Application
Categories=Game;
EOL

wget -O /opt/tlauncher/TLauncher_icon.png https://cdn.icon-icons.com/icons2/2699/PNG/512/minecraft_logo_icon_168974.png

chmod +x /usr/share/applications/tlauncher.desktop

echo "**** TLauncher installation completed ****"
