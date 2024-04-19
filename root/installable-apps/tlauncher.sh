echo "**** Installing OpenJDK 11 ****"
apt update
apt install -y openjdk-11-jre-headless wget unzip

# Check if Java installation was successful
if [ $? -ne 0 ]; then
    echo "Java installation failed. Aborting TLauncher installation."
    exit 1
fi

echo "**** Installing TLauncher ****"
wget -O /tmp/tlauncher.zip https://tlauncher.org/jar
mkdir -p /opt/tlauncher
unzip /tmp/tlauncher.zip -d /opt/tlauncher
rm /tmp/tlauncher.zip

cat > /usr/share/applications/tlauncher.desktop <<EOL
[Desktop Entry]
Name=TLauncher
Comment=Custom Minecraft launcher
Exec=java -jar /opt/tlauncher/TLauncher.jar
Icon=/opt/tlauncher/TLauncher_icon.png
Terminal=false
Type=Application
Categories=Game;
EOL

# Downloading the Minecraft logo icon
wget -O /opt/tlauncher/TLauncher_icon.png https://cdn.icon-icons.com/icons2/2699/PNG/512/minecraft_logo_icon_168974.png

chmod +x /usr/share/applications/tlauncher.desktop

echo "**** TLauncher installation completed ****"
